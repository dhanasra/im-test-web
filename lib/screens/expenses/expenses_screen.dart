import 'package:flutter/material.dart';
import 'package:im_web/app/app.dart';
import 'package:im_web/app/app_routes.dart';
import 'package:im_web/components/screen_wrapper.dart';
import 'package:im_web/screens/dashboard/dashboard_screen.dart';

import '../../constants.dart';
import '../../responsive.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({Key? key}) : super(key: key);

  @override
  _ExpensesScreenState createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
        index: 6,
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
                          Text("Expenses",style: Theme.of(context).textTheme.headline6!.copyWith(color: txtColor),),
                        if(!Responsive.isMobile(context))
                          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1,),
                        // Expanded(
                        //     child: SearchField()
                        // ),
                        DashboardButton(
                            icon: Icons.add,
                            onPress: ()=>App().setNavigation(context, AppRoutes.APP_ADD_EXPENSE),
                            option: "Create Expense"
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: defaultPadding,),
                  ExpensesTable()
                ],
              )
          ),
        )
    );
  }
}

class ExpensesTable extends StatelessWidget {
  const ExpensesTable({Key? key}) : super(key: key);

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
                      label: Text("PARTY")
                  ),
                  DataColumn(
                      label: Text("MODE")
                  ),
                  DataColumn(
                      label: Text("PAID")
                  ),
                  DataColumn(
                      label: Text("BALANCE")
                  ),
                ],
                rows: List.generate(expensesData.length, (index) =>
                    DataRow(
                        cells: [
                          DataCell(
                              Text(expensesData[index].date)
                          ),
                          DataCell(
                              Text(expensesData[index].party)
                          ),
                          DataCell(
                              Text(expensesData[index].mode)
                          ),
                          DataCell(
                              Text(expensesData[index].paid)
                          ),
                          DataCell(
                              Text(expensesData[index].balance)
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

class ExpensesData{
  final String date,party,mode,paid,balance;

  ExpensesData({required this.date,required this.party,required this.mode,required this.paid,required this.balance});
}

List<ExpensesData> expensesData = [
  ExpensesData(date: "12/12/2021",party: "Jeeva",mode: "Cash",paid: "1000",balance: "1000")
];


