import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im_web/app/app.dart';
import 'package:im_web/app/app_routes.dart';
import 'package:im_web/components/screen_wrapper.dart';
import 'package:im_web/screens/dashboard/dashboard_screen.dart';

import '../../../constants.dart';
import '../../../responsive.dart';

class SalesReturnScreen extends StatefulWidget {
  const SalesReturnScreen({Key? key}) : super(key: key);

  @override
  _SalesReturnScreenState createState() => _SalesReturnScreenState();
}

class _SalesReturnScreenState extends State<SalesReturnScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
        index: 34,
        screen: SafeArea(
          child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: bright,
                    padding: EdgeInsets.only(top:defaultPadding/2,bottom: defaultPadding/2,left: defaultPadding,right: defaultPadding),
                    child: Row(
                      children: [
                        if(!Responsive.isDesktop(context))
                          IconButton(
                            icon: Icon(Icons.menu),
                            onPressed: (){},
                            // onPressed: context.read<MenuController>().controlMenu,
                          ),
                        if(!Responsive.isMobile(context))
                          Text("Sales Return",style: Theme.of(context).textTheme.headline6!.copyWith(color: txtColor),),
                        if(!Responsive.isMobile(context))
                          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1,),
                        // Expanded(
                        //     child: SearchField()
                        // ),
                        OutlinedButton(
                            onPressed: (){},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultPadding * 1.5,
                                  vertical: defaultPadding
                              ),
                              minimumSize: Size(180,40),
                              textStyle: Theme.of(context).textTheme.caption,
                            ),
                            child: Text("Invoice Settings")
                        ),
                        SizedBox(width: defaultPadding,),
                        ElevatedButton(
                            onPressed: ()=>App().setNavigation(context, AppRoutes.APP_ADD_SALES_RETURN),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultPadding * 1.5,
                                  vertical: defaultPadding
                              ),
                              minimumSize: Size(180,40),
                              textStyle: Theme.of(context).textTheme.caption,
                              backgroundColor: primaryColor,
                            ),
                            child: Text("Create Sales Return",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),)
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: defaultPadding,),
                  SalesReturnTable()
                ],
              )
          ),
        )
    );
  }
}

class SalesReturnTable extends StatelessWidget {
  const SalesReturnTable({Key? key}) : super(key: key);

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
                      label: Text("SALES RETURN NO")
                  ),
                  DataColumn(
                      label: Text("PARTY NAME")
                  ),
                  DataColumn(
                      label: Text("DUE IN")
                  ),
                  DataColumn(
                      label: Text("AMOUNT")
                  )
                ],
                rows: List.generate(salesReturnData.length, (index) =>
                    DataRow(
                        cells: [
                          DataCell(
                              Text(salesReturnData[index].date)
                          ),
                          DataCell(
                              Text(salesReturnData[index].no)
                          ),
                          DataCell(
                              Text(salesReturnData[index].party)
                          ),
                          DataCell(
                              Text(salesReturnData[index].due)
                          ),
                          DataCell(
                              Text(salesReturnData[index].amount)
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

class SalesReturnData{
  final String date,no,party,due,amount;

  SalesReturnData({required this.date,required this.no,required this.party,required this.due,required this.amount});
}

List<SalesReturnData> salesReturnData = [
  SalesReturnData(date: "12/12/2021",no: "11",party: "Jeeva",due: "",amount: "1000")
];