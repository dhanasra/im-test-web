import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im_web/app/app.dart';
import 'package:im_web/app/app_routes.dart';
import 'package:im_web/components/screen_wrapper.dart';
import 'package:im_web/screens/dashboard/dashboard_screen.dart';

import '../../../constants.dart';
import '../../../responsive.dart';

class SalesInvoiceScreen extends StatefulWidget {
  const SalesInvoiceScreen({Key? key}) : super(key: key);

  @override
  _SalesInvoiceScreenState createState() => _SalesInvoiceScreenState();
}

class _SalesInvoiceScreenState extends State<SalesInvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
        index: 31,
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
                          Text("Sales Invoices",style: Theme.of(context).textTheme.headline6!.copyWith(color: txtColor),),
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
                            onPressed: ()=>App().setNavigation(context, AppRoutes.APP_ADD_SALES_INVOICE),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultPadding * 1.5,
                                  vertical: defaultPadding
                              ),
                              minimumSize: Size(180,40),
                              textStyle: Theme.of(context).textTheme.caption,
                              backgroundColor: primaryColor,
                            ),
                            child: Text("Create Sales Invoice",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),)
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: defaultPadding,),
                  SalesInvoiceTable()
                ],
              )
          ),
        )
    );
  }
}

class SalesInvoiceTable extends StatelessWidget {
  const SalesInvoiceTable({Key? key}) : super(key: key);

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
                      label: Text("SALES INVOICE NO")
                  ),
                  DataColumn(
                      label: Text("PARTY NAME")
                  ),
                  DataColumn(
                      label: Text("DUE IN")
                  ),
                  DataColumn(
                      label: Text("AMOUNT")
                  ),
                  DataColumn(
                      label: Text("STATUS")
                  ),
                ],
                rows: List.generate(salesInvoiceData.length, (index) =>
                    DataRow(
                        cells: [
                          DataCell(
                              Text(salesInvoiceData[index].date)
                          ),
                          DataCell(
                              Text(salesInvoiceData[index].no)
                          ),
                          DataCell(
                              Text(salesInvoiceData[index].party)
                          ),
                          DataCell(
                              Text(salesInvoiceData[index].due)
                          ),
                          DataCell(
                              Text(salesInvoiceData[index].amount)
                          ),
                          DataCell(
                              Text(salesInvoiceData[index].status)
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

class SalesInvoiceData{
  final String date,no,party,due,amount,status;

  SalesInvoiceData({required this.date,required this.no,required this.party,required this.due,required this.amount,required this.status});
}

List<SalesInvoiceData> salesInvoiceData = [
  SalesInvoiceData(date: "12/12/2021",no: "11",party: "Jeeva",due: "7 days",amount: "1000",status: "Unpaid")
];