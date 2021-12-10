import 'package:flutter/material.dart';
import 'package:im_web/app/app.dart';
import 'package:im_web/app/app_routes.dart';
import 'package:im_web/components/screen_wrapper.dart';
import 'package:im_web/screens/dashboard/dashboard_screen.dart';

import '../../constants.dart';
import '../../responsive.dart';

class PartiesScreen extends StatefulWidget {
  const PartiesScreen({Key? key}) : super(key: key);

  @override
  _PartiesScreenState createState() => _PartiesScreenState();
}

class _PartiesScreenState extends State<PartiesScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
        index: 1,
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
                          Text("Parties",style: Theme.of(context).textTheme.headline6!.copyWith(color: txtColor),),
                        if(!Responsive.isMobile(context))
                          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1,),
                        // Expanded(
                        //     child: SearchField()
                        // ),
                        DashboardButton(
                            icon: Icons.add,
                            onPress: ()=>App().setNavigation(context, AppRoutes.APP_ADD_PARTY),
                            option: "Create Party"
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: defaultPadding,),
                  PartiesTable()
                ],
              )
          ),
        )
    );
  }
}

class PartiesTable extends StatelessWidget {
  const PartiesTable({Key? key}) : super(key: key);

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
            "All Parties",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
                horizontalMargin: 0,
                columnSpacing: defaultPadding,
                columns: [
                  DataColumn(
                      label: Text("NAME")
                  ),
                  DataColumn(
                      label: Text("MOBILE NUMBER")
                  ),
                  DataColumn(
                      label: Text("PARTY TYPE")
                  ),
                  DataColumn(
                      label: Text("BALANCE")
                  ),
                ],
                rows: List.generate(transactionsData.length, (index) =>
                    DataRow(
                        cells: [
                          DataCell(
                              Text(partiesData[index].name)
                          ),
                          DataCell(
                              Text(partiesData[index].mobile)
                          ),
                          DataCell(
                              Text(partiesData[index].type)
                          ),
                          DataCell(
                              Text(partiesData[index].balance)
                          ),
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

class PartiesData{
  final String name,mobile,type,balance;

  PartiesData({required this.name,required this.mobile,required this.type,required this.balance});
}

List<PartiesData> partiesData = [
  PartiesData(name: "Dhana", mobile: "8056384773", type: "Customer", balance: "0"),
  PartiesData(name: "Guna", mobile: "9988768788", type: "Customer", balance: "1000"),
  PartiesData(name: "Raja", mobile: "9254669000", type: "Customer", balance: "900"),
  PartiesData(name: "Appu", mobile: "8879090900", type: "Customer", balance: "500"),
  PartiesData(name: "Surya", mobile: "9129090997", type: "Customer", balance: "100"),
  PartiesData(name: "Dhanush", mobile: "9987920221", type: "Customer", balance: "3000"),
];


