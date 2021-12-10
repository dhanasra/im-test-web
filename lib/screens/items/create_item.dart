import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im_web/app/app.dart';
import 'package:im_web/components/drop_down_search.dart';
import 'package:im_web/components/screen_wrapper.dart';
import 'package:im_web/screens/dashboard/dashboard_screen.dart';

import '../../constants.dart';
import '../../responsive.dart';

class CreateItem extends StatefulWidget {
  const CreateItem({Key? key}) : super(key: key);

  @override
  _CreateItemState createState() => _CreateItemState();
}

class _CreateItemState extends State<CreateItem> {
  var itemType = "Product";
  var lowStockWarning = false;
  var salesPriceTax = "Without Tax";
  var purchasePriceTax = "Without Tax";

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
                  padding: EdgeInsets.all(defaultPadding/2),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: ()=>App().setBackNavigation(context),
                        // onPressed: context.read<MenuController>().controlMenu,
                      ),
                      if(!Responsive.isMobile(context))
                        Text("Create Item",style: Theme.of(context).textTheme.headline6!.copyWith(color: txtColor),),
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
                          child: Text("Item Settings")
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
                ),
                SizedBox(height: defaultPadding,),
                addPartyForm()
              ],
            ),
          ),
        )
    );
  }

  Widget addPartyForm(){
    return Form(
        child: Container(
          padding: EdgeInsets.all(defaultPadding),
          color: bright,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    generalDetails()
                  ],
                ),
              ),
              SizedBox(width: defaultPadding),
              Expanded(child: Column(
                children: [
                  stockDetails(),
                  pricingDetails(),
                ],
              ),
              )
            ],
          ),
        )
    );
  }

  Widget generalDetails(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text("General Details",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: txtColor),),
        ),
        SizedBox(height: defaultPadding),
        Text("Item Type",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
        Row(
          children: [
            Radio(value: "Product", onChanged: (String? value) { setState(() {
              itemType = value!;
            }); }, groupValue: itemType,),
            Text("Product",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: txtColor),),
            Radio(value: "Service", onChanged: (String? value) { setState(() {
              itemType = value!;
            }); }, groupValue: itemType,),
            Text("Service",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: txtColor),),
          ],
        ),
        SizedBox(height: defaultPadding),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Item Name",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
                SizedBox(
                  width: 300,
                  height: 40,
                  child: TextFormField(
                    decoration: new InputDecoration(
                        contentPadding: EdgeInsets.only(left: defaultPadding/2,right: defaultPadding/2,top: 0,bottom: 0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 1.0),
                        ),
                        hintText: "Enter Name",
                        hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.black38)
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: defaultPadding),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Item Code",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
                SizedBox(
                  width: 300,
                  height: 40,
                  child: TextFormField(
                    decoration: new InputDecoration(
                        contentPadding: EdgeInsets.only(left: defaultPadding/2,right: defaultPadding/2,top: 0,bottom: 0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 1.0),
                        ),
                        hintText: "Enter Item Code",
                        hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.black38)
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: defaultPadding),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Item Description",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
                  SizedBox(
                    height: 80,
                    child:TextFormField(
                      maxLines: 5,
                      decoration: new InputDecoration(
                          contentPadding: EdgeInsets.all(defaultPadding/2),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: primaryColor, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: primaryColor, width: 1.0),
                          ),
                          hintText: "Enter item description",
                          hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.black38)
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget stockDetails(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Container(
        child: Text("Stock Details",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: txtColor),),
      ),
        SizedBox(height: defaultPadding),
      Row(
        children: [
           Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Unit",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
                SizedBox(
                  width: 300,
                  height: 40,
                  child: TextFormField(
                    decoration: new InputDecoration(
                        contentPadding: EdgeInsets.only(left: defaultPadding/2,right: defaultPadding/2,top: 0,bottom: 0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 1.0),
                        ),
                        hintText: "Enter Item unit",
                        hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.black38)
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    SizedBox(height: defaultPadding,),
      Row(
        children: [
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Opening Stock",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
              SizedBox(
                width: 300,
                height: 40,
                child: TextFormField(
                  decoration: new InputDecoration(
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
            ],
          ),),
          SizedBox(width: defaultPadding,),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("As Of Date",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
              SizedBox(
                width: 300,
                height: 40,
                child: TextFormField(
                  decoration: new InputDecoration(
                      contentPadding: EdgeInsets.only(left: defaultPadding/2,right: defaultPadding/2,top: 0,bottom: 0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor, width: 1.0),
                      ),
                      hintText: "12 DEC 2021",
                      hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.black38)
                  ),
                ),
              ),
            ],
          ),),
        ],
      ),
        SizedBox(height: defaultPadding,),
      Row(
        children: [
          Expanded(child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Enter Low Stock Warning",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
              SizedBox(
                width: 100,
                height: 70,
                child: Switch(
                      onChanged: (bool value) {
                          setState(() {
                            lowStockWarning = value;
                          });
                      }, value: lowStockWarning,
                  )
              )],
          ),),
          SizedBox(width: defaultPadding,),
          Expanded(child: Visibility(
            visible: lowStockWarning,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Low Stock Units",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
                SizedBox(
                  width: 300,
                  height: 40,
                  child: TextFormField(
                    decoration: new InputDecoration(
                        contentPadding: EdgeInsets.only(left: defaultPadding/2,right: defaultPadding/2,top: 0,bottom: 0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 1.0),
                        ),
                        hintText: "Enter low stock units",
                        hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.black38)
                    ),
                  ),
                ),
              ],
            ),
          ),),
        ],
      )
    ],);
  }

  Widget pricingDetails(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text("Pricing Details",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: txtColor),),
        ),
        SizedBox(height: defaultPadding,),
        Row(
          children: [
            Expanded(child:
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sales Price",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          child: TextFormField(
                            decoration: new InputDecoration(
                                contentPadding: EdgeInsets.only(left: defaultPadding/2,right: defaultPadding/2,top: 0,bottom: 0),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: primaryColor, width: 1.0),
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(4),bottomLeft: Radius.circular(4),topRight: Radius.circular(0),bottomRight: Radius.circular(0))
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: primaryColor, width: 1.0),
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(4),bottomLeft: Radius.circular(4),topRight: Radius.circular(0),bottomRight: Radius.circular(0))
                                ),
                                hintText: "0",
                                hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.black38)
                            ),
                          ),
                        ),
                      ),
                      Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(0),bottomLeft: Radius.circular(0),topRight: Radius.circular(4),bottomRight: Radius.circular(4))
                          ),
                          padding: EdgeInsets.all(defaultPadding/2),
                          child: DropdownButton<String>(
                            underline: Container(),
                            value: salesPriceTax,
                            items: ["With Tax","Without Tax"].map((e) {
                              return DropdownMenuItem<String>(
                                value: e,
                                child: Text(e,style: Theme.of(context).textTheme.subtitle2!.copyWith(color: txtColor),),
                              );
                            }).toList(),
                            onChanged: (val){
                              setState(() {
                                salesPriceTax = val!;
                              });
                            },
                          )
                      )
                    ],
                  )
                ]
            )
            ),
            SizedBox(width: defaultPadding,),
            Expanded(child:
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Purchase Price",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          child: TextFormField(
                            decoration: new InputDecoration(
                                contentPadding: EdgeInsets.only(left: defaultPadding/2,right: defaultPadding/2,top: 0,bottom: 0),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: primaryColor, width: 1.0),
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(4),bottomLeft: Radius.circular(4),topRight: Radius.circular(0),bottomRight: Radius.circular(0))
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: primaryColor, width: 1.0),
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(4),bottomLeft: Radius.circular(4),topRight: Radius.circular(0),bottomRight: Radius.circular(0))
                                ),
                                hintText: "0",
                                hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.black38)
                            ),
                          ),
                        ),
                      ),
                      Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(0),bottomLeft: Radius.circular(0),topRight: Radius.circular(4),bottomRight: Radius.circular(4))
                          ),
                          padding: EdgeInsets.all(defaultPadding/2),
                          child: DropdownButton<String>(
                            underline: Container(),
                            value: purchasePriceTax,
                            items: ["With Tax","Without Tax"].map((e) {
                              return DropdownMenuItem<String>(
                                value: e,
                                child: Text(e,style: Theme.of(context).textTheme.subtitle2!.copyWith(color: txtColor),),
                              );
                            }).toList(),
                            onChanged: (val){
                              setState(() {
                                purchasePriceTax = val!;
                              });
                            },
                          )
                      )
                    ],
                  )
                ]
            )
            ),
          ],
        ),
        SizedBox(height: defaultPadding,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("MRP",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
            SizedBox(
              width: 300,
              height: 40,
              child: TextFormField(
                decoration: new InputDecoration(
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
          ],
        ),
        SizedBox(height: defaultPadding,),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("HSN Code",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
                  SizedBox(
                      width: 300,
                      height: 40,
                      child: TextFormField(
                        decoration: new InputDecoration(
                            contentPadding: EdgeInsets.only(left: defaultPadding/2,right: defaultPadding/2,top: 0,bottom: 0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor, width: 1.0),
                            ),
                            hintText: "Enter HSN Code",
                            hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.black38)
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(width: defaultPadding,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("GST Tax Rate",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
                   SizedBox(
                      width: 300,
                      height: 40,
                      child: TextFormField(
                        decoration: new InputDecoration(
                            contentPadding: EdgeInsets.only(left: defaultPadding/2,right: defaultPadding/2,top: 0,bottom: 0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor, width: 1.0),
                            ),
                            hintText: "Tax Rate",
                            hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.black38)
                        ),
                      ),
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(height: defaultPadding,),
        Row(
          children: [
            Expanded(child:
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Wholesale Price",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          child: TextFormField(
                            decoration: new InputDecoration(
                                contentPadding: EdgeInsets.only(left: defaultPadding/2,right: defaultPadding/2,top: 0,bottom: 0),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: primaryColor, width: 1.0),
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(4),bottomLeft: Radius.circular(4),topRight: Radius.circular(0),bottomRight: Radius.circular(0))
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: primaryColor, width: 1.0),
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(4),bottomLeft: Radius.circular(4),topRight: Radius.circular(0),bottomRight: Radius.circular(0))
                                ),
                                hintText: "0",
                                hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.black38)
                            ),
                          ),
                        ),
                      ),
                      Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(0),bottomLeft: Radius.circular(0),topRight: Radius.circular(4),bottomRight: Radius.circular(4))
                          ),
                          padding: EdgeInsets.all(defaultPadding/2),
                          child: DropdownButton<String>(
                            underline: Container(),
                            value: salesPriceTax,
                            items: ["With Tax","Without Tax"].map((e) {
                              return DropdownMenuItem<String>(
                                value: e,
                                child: Text(e,style: Theme.of(context).textTheme.subtitle2!.copyWith(color: txtColor),),
                              );
                            }).toList(),
                            onChanged: (val){
                              setState(() {
                                salesPriceTax = val!;
                              });
                            },
                          )
                      )
                    ],
                  )
                ]
            )
            ),
            SizedBox(width: defaultPadding,),
            Expanded(child:
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Wholesale Quantity",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          child: TextFormField(
                            decoration: new InputDecoration(
                                contentPadding: EdgeInsets.only(left: defaultPadding/2,right: defaultPadding/2,top: 0,bottom: 0),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: primaryColor, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: primaryColor, width: 1.0),
                               ),
                                hintText: "Enter minimum qty",
                                hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.black38)
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ]
            )
            ),
          ],
        ),
      ],
    );
  }
}
