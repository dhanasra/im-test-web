import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im_web/components/screen_wrapper.dart';
import 'package:im_web/screens/dashboard/dashboard_screen.dart';

import '../../constants.dart';
import '../../responsive.dart';

class CashBankScreen extends StatefulWidget {
  const CashBankScreen({Key? key}) : super(key: key);

  @override
  _CashBankScreenState createState() => _CashBankScreenState();
}

class _CashBankScreenState extends State<CashBankScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
        index: 5,
        screen: SafeArea(
          child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: bright,
                    padding: EdgeInsets.only(left:defaultPadding,right:defaultPadding),
                    child: Row(
                      children: [
                        if(!Responsive.isDesktop(context))
                          IconButton(
                            icon: Icon(Icons.menu),
                            onPressed: (){},
                            // onPressed: context.read<MenuController>().controlMenu,
                          ),
                        if(!Responsive.isMobile(context))
                          Text("Cash & Bank",style: Theme.of(context).textTheme.headline6!.copyWith(color: txtColor),),
                        if(!Responsive.isMobile(context))
                          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1,),
                        // Expanded(
                        //     child: SearchField()
                        // ),
                        DashboardButton(
                            icon: Icons.remove,
                            onPress: (){
                              showDialog(context: context,
                                  builder: (context){
                                    return Dialog(
                                        child: Stack(
                                          children: [
                                            AddOrReduceMoney(type: "REMOVE",),
                                          ],
                                        )
                                    );
                                  }
                              );
                            },
                            option: "Reduce Money"
                        ),
                        DashboardButton(
                            icon: Icons.add,
                            onPress: (){
                              showDialog(context: context,
                                  builder: (context){
                                    return Dialog(
                                      child: Stack(
                                        children: [
                                          AddOrReduceMoney(type: "ADD",),
                                        ],
                                      )
                                    );
                                  }
                              );
                            },
                            option: "Add Money"
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: defaultPadding,),
                  CashBankTable()
                ],
              )
          ),
        )
    );
  }
}

class CashBankTable extends StatelessWidget {
  const CashBankTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(defaultPadding),
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          color: bright,
          borderRadius: BorderRadius.all(Radius.circular(4))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "All Time",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
                horizontalMargin: 0,
                columnSpacing: defaultPadding,
                columns: [
                  DataColumn(
                      label: Text("DATE")
                  ),
                  DataColumn(
                      label: Text("TYPE")
                  ),
                  DataColumn(
                      label: Text("TXN NO")
                  ),
                  DataColumn(
                      label: Text("PARTY")
                  ),
                  DataColumn(
                      label: Text("MODE")
                  ),
                  DataColumn(
                      label: Text("PAID")
                  ),
                  DataColumn(
                      label: Text("RECEIVED")
                  ),
                  DataColumn(
                      label: Text("BALANCE")
                  ),
                ],
                rows: List.generate(cashBankData.length, (index) =>
                    DataRow(
                        cells: [
                          DataCell(
                              Text(cashBankData[index].date)
                          ),
                          DataCell(
                              Text(cashBankData[index].type)
                          ),
                          DataCell(
                              Text(cashBankData[index].txn)
                          ),
                          DataCell(
                              Text(cashBankData[index].party)
                          ),
                          DataCell(
                              Text(cashBankData[index].mode)
                          ),
                          DataCell(
                              Text(cashBankData[index].paid)
                          ),
                          DataCell(
                              Text(cashBankData[index].received)
                          ),
                          DataCell(
                              Text(cashBankData[index].balance)
                          )
                        ]
                    )
                )
            ),
          )
        ],
      ),
    );
  }
}

class CashBankData{
  final String date,type,txn,party,mode,paid,received,balance;

  CashBankData({required this.date,required this.type,required this.txn,required this.party,required this.mode,required this.paid,required this.received,required this.balance});
}

List<CashBankData> cashBankData = [
  CashBankData(date: "12/12/2021",type: "Payment In",txn: "7",party: "Jeeva",mode: "Cash",paid: "-",received: "1000",balance: "1000")
];

class AddOrReduceMoney extends StatefulWidget {
  const AddOrReduceMoney({
    Key? key,
    required this.type
  }) : super(key: key);
  final String type;


  @override
  _AddOrReduceMoneyState createState() => _AddOrReduceMoneyState();
}

class _AddOrReduceMoneyState extends State<AddOrReduceMoney> {
  var mode = "Cash";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.type=="ADD"?"Add Money":"Reduce Money",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: txtColor),),
              IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.close,color: txtColor,))
            ],
          ),
          SizedBox(height:defaultPadding),
          SizedBox(
            height: 400,
            child: ListView(
              shrinkWrap: true,
              children: [
                Text(widget.type=="ADD"?"Add Money In":"Reduce Money In",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
                SizedBox(height:defaultPadding),
                Row(
                  children: [
                    Radio(value: "Cash", onChanged: (String? value) { setState(() {
                      mode = value!;
                    }); }, groupValue: mode,),
                    Text("Cash",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: txtColor),),
                    Radio(value: "Bank", onChanged: (String? value) { setState(() {
                      mode = value!;
                    }); }, groupValue: mode,),
                    Text("Bank",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: txtColor),),
                  ],
                ),
                SizedBox(height:defaultPadding),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Current Balance",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: txtColor),),
                          SizedBox(height:defaultPadding/2),
                          Text("33,000",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: txtColor),),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Date",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: txtColor),),
                          SizedBox(height:defaultPadding/2),
                          Text("8 Dec 2021",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: txtColor),),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height:defaultPadding),
                Text("Enter Amount",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
                SizedBox(
                  width: 300,
                  height: 40,
                  child: TextFormField(
                    decoration: new InputDecoration(
                        prefixIcon: widget.type=="ADD"?Icon(Icons.add,color: Colors.green,):Icon(Icons.remove,color: Colors.red,),
                        contentPadding: EdgeInsets.only(left: defaultPadding/2,right: defaultPadding/2,top: 0,bottom: 0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 1.0),
                        ),
                        hintText: "0",
                        hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.black38)
                    ),
                  ),
                ),
                SizedBox(height:defaultPadding),
                Text("New Balance",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
                Visibility(
                  visible: false,
                  child: Text("0",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
                ),
                SizedBox(height:defaultPadding),
                Text("Remarks",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
                SizedBox(
                  width: 300,
                  height: 80,
                  child: TextFormField(
                    maxLines: 5,
                    decoration: new InputDecoration(
                        contentPadding: EdgeInsets.only(left: defaultPadding/2,right: defaultPadding/2,top: 0,bottom: 0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 1.0),
                        ),
                        hintText: "",
                        hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.black38)
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height:defaultPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(
                  onPressed: ()=>Navigator.pop(context),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: defaultPadding * 1.5,
                        vertical: defaultPadding
                    ),
                    minimumSize: Size(180,40),
                    textStyle: Theme.of(context).textTheme.caption,
                  ),
                  child: Text("Cancel")
              ),
              SizedBox(width: defaultPadding,),
              ElevatedButton(
                  onPressed: (){},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: defaultPadding * 1.5,
                        vertical: defaultPadding
                    ),
                    minimumSize: Size(180,40),
                    textStyle: Theme.of(context).textTheme.caption,
                    backgroundColor: primaryColor,
                  ),
                  child: Text("Save",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),)
              )
            ],
          ),
        ],
      )
    );
  }
}

