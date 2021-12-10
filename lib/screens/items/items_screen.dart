import 'package:flutter/material.dart';
import 'package:im_web/app/app.dart';
import 'package:im_web/app/app_routes.dart';
import 'package:im_web/components/screen_wrapper.dart';
import 'package:im_web/screens/dashboard/dashboard_screen.dart';

import '../../constants.dart';
import '../../responsive.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  _ItemsScreenState createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
        index: 4,
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
                          Text("Items",style: Theme.of(context).textTheme.headline6!.copyWith(color: txtColor),),
                        if(!Responsive.isMobile(context))
                          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1,),
                        // Expanded(
                        //     child: SearchField()
                        // ),
                        DashboardButton(
                            icon: Icons.add,
                            onPress: ()=>App().setNavigation(context, AppRoutes.APP_ADD_ITEM),
                            option: "Create Item"
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: defaultPadding,),
                  ItemsTable()
                ],
              )
          ),
        )
    );
  }
}

class ItemsTable extends StatelessWidget {
  const ItemsTable({Key? key}) : super(key: key);

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
            "All Items",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
                horizontalMargin: 0,
                columnSpacing: defaultPadding,
                columns: [
                  DataColumn(
                      label: Text("ITEM NAME")
                  ),
                  DataColumn(
                      label: Text("ITEM CODE")
                  ),
                  DataColumn(
                      label: Text("STOCK QTY")
                  ),
                  DataColumn(
                      label: Text("STOCK VALUE")
                  ),
                  DataColumn(
                      label: Text("SELLING PRICE")
                  ),
                  DataColumn(
                      label: Text("PURCHASE PRICE")
                  ),
                  DataColumn(
                      label: Text("MRP")
                  ),
                  DataColumn(
                      label: Text("WHOLESALE PRICE")
                  ),
                ],
                rows: List.generate(partiesData.length, (index) =>
                    DataRow(
                        cells: [
                          DataCell(
                              Text(partiesData[index].name)
                          ),
                          DataCell(
                              Text(partiesData[index].code)
                          ),
                          DataCell(
                              Text(partiesData[index].qty)
                          ),
                          DataCell(
                              Text(partiesData[index].value)
                          ),
                          DataCell(
                              Text(partiesData[index].sellingPrice)
                          ),
                          DataCell(
                              Text(partiesData[index].purchasePrice)
                          ),
                          DataCell(
                              Text(partiesData[index].mrp)
                          ),
                          DataCell(
                              Text(partiesData[index].wholeSalePrice)
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

class ItemsData{
  final String name,code,qty,value,sellingPrice,purchasePrice,mrp,wholeSalePrice;

  ItemsData({required this.name,required this.code,required this.qty,required this.value,required this.sellingPrice,required this.purchasePrice,required this.wholeSalePrice,required this.mrp});
}

List<ItemsData> partiesData = [
  ItemsData(name: "Daal", code: "330", qty: "10 PCS", value: "20,000",sellingPrice: "300",purchasePrice: "200",wholeSalePrice: "100",mrp: "40"),
  ItemsData(name: "Rice", code: "229", qty: "50 PCS", value: "11,000",sellingPrice: "500",purchasePrice: "400",wholeSalePrice: "200",mrp: "30"),
  ItemsData(name: "Flour", code: "112", qty: "10 KG", value: "19,000",sellingPrice: "800",purchasePrice: "600",wholeSalePrice: "200",mrp: "220"),
];


