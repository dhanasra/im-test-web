import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im_web/app/app.dart';
import 'package:im_web/app/app_routes.dart';
import 'package:im_web/components/header.dart';
import 'package:im_web/components/screen_wrapper.dart';
import 'package:im_web/constants.dart';
import 'package:im_web/responsive.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
        index: 0,
        screen: SafeArea(
          child: SingleChildScrollView(
              child: Column(
                children: [
                  Header(),
                  SizedBox(height: defaultPadding,),
                  Padding(
                    padding: EdgeInsets.only(left:defaultPadding/2,right:defaultPadding/2),
                    child:Row(children: [
                      DashboardButton(
                      icon: Icons.sell,
                          onPress: ()=>App().setNavigation(context, AppRoutes.APP_ADD_SALES_INVOICE),
                          option: "Create Invoice"
                      ),
                      DashboardButton(
                          icon: Icons.shopping_cart,
                          onPress:()=>App().setNavigation(context, AppRoutes.APP_ADD_PURCHASE_INVOICE),
                          option: "Create Purchase"
                      ),
                      DashboardButton(
                          icon: Icons.notes,
                          onPress: ()=>App().setNavigation(context, AppRoutes.APP_ADD_QUOTATION),
                          option: "Create Quotation"
                      ),
                      DashboardButton(
                          icon: Icons.subdirectory_arrow_left_outlined,
                          onPress: ()=>App().setNavigation(context, AppRoutes.APP_ADD_PAYMENT_IN),
                          option: "Record Payment In"
                      ),
                      DashboardButton(
                          icon: Icons.add_box,
                          onPress: ()=>App().setNavigation(context, AppRoutes.APP_ADD_ITEM),
                          option: "Create Item"
                      ),
                    ],),
                  ),
                  SizedBox(height: defaultPadding,),
                  Padding(
                    padding: EdgeInsets.only(left:defaultPadding,right:defaultPadding),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 5,
                            child: Column(
                              children: [
                                // Responsive(
                                //     mobile: ProgressInfoCardView(
                                //       crossAxisCount: MediaQuery.of(context).size.width<650 ? 2 : 4,
                                //       childAspectRatio: MediaQuery.of(context).size.width<1400 ? 1.3 : 1,
                                //     ),
                                //     tablet: ProgressInfoCardView(),
                                //     desktop: ProgressInfoCardView(
                                //       childAspectRatio: MediaQuery.of(context).size.width<1400 ? 1.1 : 1.4,
                                //     )
                                // ),
                                // SizedBox(height: defaultPadding,),
                                LatestTransactions(),
                                if(Responsive.isMobile(context))
                                  SizedBox(height: defaultPadding,),
                                if(Responsive.isMobile(context))
                                  TransactionsSummary()
                              ],
                            )
                        ),
                        if(!Responsive.isMobile(context))
                          SizedBox(width: defaultPadding,),
                        if(!Responsive.isMobile(context))
                          Expanded(
                              flex: 2,
                              child: TransactionsSummary()
                          )
                      ],
                    ),
                  )
                ],
              )
          ),
        )
    );
  }
}

class DashboardButton extends StatelessWidget {
  const DashboardButton({
    Key? key,
    required this.icon,
    required this.onPress,
    required this.option
  }) : super(key: key);

  final String option;
  final IconData icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(defaultPadding/2),
      child: ElevatedButton.icon(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(
                horizontal: defaultPadding * 1.5,
                vertical: defaultPadding
            ),
            minimumSize: Size(180,40),
            textStyle: Theme.of(context).textTheme.caption,
            backgroundColor: primaryColor,
          ),
          onPressed: onPress,
          icon: Icon(icon,size: 18,color: txtColor,),
          label: Text(option,style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
        ),
      );
  }
}




class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title, count,amount;

  const InfoCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.count,
    required this.amount
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultPadding),
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(
            width: 2,
            color: txtColor.withOpacity(0.15),
          ),
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: Icon(icon,color: Colors.deepPurple,),
          ),
          Expanded(child: Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  count,
                  style: Theme.of(context).textTheme.caption!.copyWith(color:Colors.black54),
                )
              ],
            ),
          )),
          Text(amount)
        ],
      ),
    );
  }
}

class ProgressInfoCardView extends StatelessWidget {
  ProgressInfoCardView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1.4
  }) : super(key: key);

  int crossAxisCount;
  double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 4,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: defaultPadding,
            mainAxisSpacing: defaultPadding,
            childAspectRatio: childAspectRatio
        ),
        itemBuilder: (context, index) =>
            ProgressCard(type: "Sales", amount: "1500", no: "150 sales", percentage: 23)
    );
  }
}


class ProgressCard extends StatelessWidget {
  const ProgressCard({
    Key? key,
    required this.type,
    required this.amount,
    required this.no,
    required this.percentage
  }) : super(key: key);

  final String type,no,amount;
  final int percentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
              ),
              Icon(Icons.more_vert,color: Colors.white54,)
            ],
          ),
          Text(
            type,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 5,
                decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
              ),
              LayoutBuilder(builder: (context,constraints)=>Container(
                width: constraints.maxWidth * (percentage/100),
                height: 5,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
              ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                no,
                style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white54),
              ),
              Text(
                amount,
                style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white),
              ),
            ],)
        ],
      ),
    );
  }
}


class TransactionsSummary extends StatelessWidget {
  const TransactionsSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          color: bright,
          borderRadius: BorderRadius.all(Radius.circular(4))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Transaction Summary",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: txtColor,
                fontSize: 18
            ),
          ),
          SizedBox(height:defaultPadding),
          SizedBox(
              height: 200,
              child: Stack(
                children: [
                  PieChart(
                      PieChartData(
                        startDegreeOffset: -90,
                        sectionsSpace: 0,
                        centerSpaceRadius: 70,
                        sections: pieChartData,
                      )
                  ),
                  Positioned.fill(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: defaultPadding,),
                          Text(
                              "1500",
                              style: Theme.of(context).textTheme.headline4!.copyWith(color: txtColor,fontWeight: FontWeight.w600,height: 0.5)
                          ),
                          Text("of Sales",
                              style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor)
                          )
                        ],
                      )
                  )
                ],
              )
          ),
          InfoCard(
              icon: Icons.shopping_cart_rounded,
              title: "To Collect",
              count: "Invoices & Payment In",
              amount: "1,500"),
          InfoCard(
              icon: Icons.sell,
              title: "To Pay",
              count: "Purchases & Payement Out",
              amount: "23,500"),
          InfoCard(
              icon: Icons.attach_money_rounded,
              title: "Cash + Bank",
              count: "in cash",
              amount: "500"),
          InfoCard(
              icon: Icons.all_inbox,
              title: "Stock Value",
              count: "Total stock worth",
              amount: "55,000"),
          InfoCard(
              icon: Icons.inbox,
              title: "Low Stock",
              count: "Below 10 stocks",
              amount: "0 Items"),
        ],
      ),
    );
  }
}


class RecentTransactions extends StatelessWidget {
  const RecentTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class LatestTransactions extends StatelessWidget {
  const LatestTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          color: bright,
          borderRadius: BorderRadius.all(Radius.circular(4))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Transactions",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
                horizontalMargin: 0,
                columnSpacing: defaultPadding,
                columns: [
                  DataColumn(
                      label: Text("No")
                  ),
                  DataColumn(
                      label: Text("Date")
                  ),
                  DataColumn(
                      label: Text("Party")
                  ),
                  DataColumn(
                      label: Text("Amount")
                  ),
                  DataColumn(
                      label: Text("Type")
                  ),
                ],
                rows: List.generate(transactionsData.length, (index) =>
                    DataRow(
                        cells: [
                          DataCell(
                              Text(index.toString())
                          ),
                          DataCell(
                              Text(transactionsData[index].date)
                          ),
                          DataCell(
                              Text(transactionsData[index].party)
                          ),
                          DataCell(
                              Text(transactionsData[index].amount)
                          ),
                          DataCell(
                              Text(transactionsData[index].type)
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




List<PieChartSectionData> pieChartData = [
  PieChartSectionData(
      color: primaryColor,
      value: 15,
      showTitle: false,
      radius: 25
  ),
  PieChartSectionData(
      color: Color(0xFF2655FF),
      value: 15,
      showTitle: false,
      radius: 22
  ),
  PieChartSectionData(
      color: Color(0xFF268866),
      value: 15,
      showTitle: false,
      radius: 19
  ),
  PieChartSectionData(
      color: Color(0xFF55AA28),
      value: 15,
      showTitle: false,
      radius: 16
  ),
  PieChartSectionData(
      color: primaryColor.withOpacity(0.1),
      value: 15,
      showTitle: false,
      radius: 12
  ),
];

class TransactionsData{
  final String date,party,amount,type;

  TransactionsData({required this.amount,required this.date,required this.party,required this.type});
}

List<TransactionsData> transactionsData = [
  TransactionsData(amount: "2100", date: "12/12/2022", party: "Dhana", type: "Sales"),
  TransactionsData(amount: "3300", date: "10/12/2022", party: "Guna", type: "Invoice"),
  TransactionsData(amount: "1500", date: "1/12/2022", party: "Guna", type: "Invoice"),
  TransactionsData(amount: "500", date: "2/12/2022", party: "Dhana", type: "Sales"),
  TransactionsData(amount: "500", date: "8/12/2022", party: "Dhana", type: "Sales"),
  TransactionsData(amount: "2300", date: "15/12/2022", party: "Guna", type: "Invoice")
];

