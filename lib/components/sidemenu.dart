import 'package:flutter/material.dart';
import 'package:im_web/app/app.dart';
import 'package:im_web/app/app_routes.dart';
import 'package:im_web/constants.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
    required this.index
  }) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SingleChildScrollView(
            child: Column(
              children: [
                DrawerHeader(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/logo.png",height: 35,width: 35,),
                            SizedBox(width: defaultPadding/2,),
                            Text("Bill Book",style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white,fontWeight: FontWeight.w700),)
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: TextButton.icon(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultPadding * 1.5,
                                  vertical: defaultPadding
                              ),
                              minimumSize: Size(180,40),
                              textStyle: Theme.of(context).textTheme.caption,
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(25))
                              )
                            ),
                            onPressed: ()=>App().setNavigation(context, AppRoutes.APP_ADD_SALES_INVOICE),
                            icon: Icon(Icons.add,size: 18,color: txtColor,),
                            label: Text("Create Sales Invoice",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
                          ),
                        )
                      ],
                    )
                ),
                DrawerListTile(
                  icon: Icons.dashboard_outlined,
                  title: "Dashboard",
                  onPress: (){
                    App().setNavigation(context, AppRoutes.APP_DASHBOARD);
                  },
                  isSelected: index==0,
                ),
                DrawerListTile(
                  icon: Icons.group_outlined,
                  title: "Parties",
                  onPress: (){
                    App().setNavigation(context, AppRoutes.APP_PARTIES);
                  },
                  isSelected: index==1,
                ),
                DrawerListTile(
                  icon: Icons.add_box_outlined,
                  title: "Items",
                  onPress: (){
                    App().setNavigation(context, AppRoutes.APP_ITEMS);
                  },
                  isSelected: index==4,
                ),
                ExpansionTile(
                  maintainState: true,
                  initiallyExpanded: index>30 && index<40 ?true:false,
                  leading: Icon(Icons.sell,color: Colors.white54,size: 18,),
                  title: Text("Sales",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.white54,fontWeight: FontWeight.w100),),
                  children: <Widget>[
                    ListTile(
                      onTap: (){
                        App().setNavigation(context, AppRoutes.APP_SALES_INVOICE);
                      },
                      tileColor: index==31?primaryColor:secondaryColor,
                      horizontalTitleGap: 0.0,
                      leading: Container(width: 10,),
                      title: Text("Sales Invoices",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: index==31?Colors.black54:Colors.white54,fontWeight: FontWeight.w100),),
                    ),
                    ListTile(
                      onTap: (){
                        App().setNavigation(context, AppRoutes.APP_QUOTATION);
                      },
                      tileColor: index==32?primaryColor:secondaryColor,
                      horizontalTitleGap: 0.0,
                      leading: Container(width: 10,),
                      title: Text("Quotation / Estimate",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: index==32?Colors.black54:Colors.white54,fontWeight: FontWeight.w100),),
                    ),
                    ListTile(
                      onTap: (){
                        App().setNavigation(context, AppRoutes.APP_PAYMENT_IN);
                      },
                      tileColor: index==33?primaryColor:secondaryColor,
                      horizontalTitleGap: 0.0,
                      leading: Container(width: 10,),
                      title: Text("Payment In",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: index==33?Colors.black54:Colors.white54,fontWeight: FontWeight.w100),),
                    ),
                    ListTile(
                      onTap: (){
                        App().setNavigation(context, AppRoutes.APP_SALES_RETURN);
                      },
                      tileColor: index==34?primaryColor:secondaryColor,
                      horizontalTitleGap: 0.0,
                      leading: Container(width: 10,),
                      title: Text("Sales Return",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: index==34?Colors.black54:Colors.white54,fontWeight: FontWeight.w100),),
                    ),
                    ListTile(
                      onTap: (){
                        App().setNavigation(context, AppRoutes.APP_DELIVERY_CHALLAN);
                      },
                      tileColor: index==35?primaryColor:secondaryColor,
                      horizontalTitleGap: 0.0,
                      leading: Container(width: 10,),
                      title: Text("Delivery Challan",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: index==35?Colors.black54:Colors.white54,fontWeight: FontWeight.w100),),
                    )
                  ],
                ),
                ExpansionTile(
                  maintainState: true,
                  initiallyExpanded: index>20 && index<30 ?true:false,
                  leading: Icon(Icons.shopping_cart_outlined,color: Colors.white54,size: 18,),
                  title: Text("Purchases",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.white54,fontWeight: FontWeight.w100),),
                  children: <Widget>[
                    ListTile(
                      onTap: (){
                        App().setNavigation(context, AppRoutes.APP_PURCHASE_INVOICE);
                      },
                      tileColor: index==21?primaryColor:secondaryColor,
                      horizontalTitleGap: 0.0,
                      leading: Container(width: 10,),
                      title: Text("Purchase Invoices",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: index==21?Colors.black54:Colors.white54,fontWeight: FontWeight.w100),),
                    ),
                    ListTile(
                      onTap: (){
                        App().setNavigation(context, AppRoutes.APP_PAYMENT_OUT);
                      },
                      tileColor: index==22?primaryColor:secondaryColor,
                      horizontalTitleGap: 0.0,
                      leading: Container(width: 10,),
                      title: Text("Payment Out",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: index==22?Colors.black54:Colors.white54,fontWeight: FontWeight.w100),),
                    ),
                    ListTile(
                      onTap: (){
                        App().setNavigation(context, AppRoutes.APP_PURCHASE_RETURN);
                      },
                      tileColor: index==23?primaryColor:secondaryColor,
                      horizontalTitleGap: 0.0,
                      leading: Container(width: 10,),
                      title: Text("Purchase Return",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: index==23?Colors.black54:Colors.white54,fontWeight: FontWeight.w100),),
                    ),
                    ListTile(
                      onTap: (){
                        App().setNavigation(context, AppRoutes.APP_PURCHASE_ORDER);
                      },
                      tileColor: index==24?primaryColor:secondaryColor,
                      horizontalTitleGap: 0.0,
                      leading: Container(width: 10,),
                      title: Text("Purchase Orders",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: index==24?Colors.black54:Colors.white54,fontWeight: FontWeight.w100),),
                    )
                  ],
                ),
                DrawerListTile(
                  icon: Icons.attach_money_outlined,
                  title: "Cash & bank",
                  onPress: (){
                    App().setNavigation(context, AppRoutes.APP_CASH_BANK);
                  },
                  isSelected: index==5,
                ),
                DrawerListTile(
                  icon: Icons.subdirectory_arrow_right_outlined,
                  title: "Expense",
                  onPress: (){
                    App().setNavigation(context, AppRoutes.APP_EXPENSES);
                  },
                  isSelected: index==6,
                ),
                DrawerListTile(
                  icon: Icons.settings_outlined,
                  title: "Settings",
                  onPress: (){
                  },
                  isSelected: index==7,
                ),
                DrawerListTile(
                  icon: Icons.help_center_outlined,
                  title: "Help",
                  onPress: (){
                  },
                  isSelected: index==8,
                ),
              ],
            )
        )
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onPress,
    required this.isSelected
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      tileColor: isSelected?primaryColor:secondaryColor,
      horizontalTitleGap: 0.0,
      leading: Icon(icon,color: isSelected?Colors.black54:Colors.white54,size: 18,),
      title: Text(title,style: Theme.of(context).textTheme.subtitle2!.copyWith(color: isSelected?Colors.black54:Colors.white54,fontWeight: FontWeight.w100),),
    );
  }
}
