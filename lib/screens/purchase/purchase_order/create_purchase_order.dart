import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im_web/app/app.dart';
import 'package:im_web/components/accordian.dart';
import 'package:im_web/components/accordian_swap.dart';
import 'package:im_web/components/charge_field.dart';
import 'package:im_web/components/screen_wrapper.dart';
import 'package:im_web/view_models/sales_invoice_view_model.dart';
import 'package:im_web/widgets/add_item.dart';

import '../../../constants.dart';
import '../../../responsive.dart';

class CreatePurchaseOrder extends StatefulWidget {
  const CreatePurchaseOrder({Key? key}) : super(key: key);

  @override
  _CreatePurchaseOrderState createState() => _CreatePurchaseOrderState();
}

class _CreatePurchaseOrderState extends State<CreatePurchaseOrder> {
  var notesSwap = false;
  var termsConditionsSwap = false;
  var discountSwap = false;
  bool additionalChargeSwap = false;
  bool roundOff = false;
  bool bankDetailsSwap = false;
  bool upiIdSwap = false;
  String amountReceivedMode = "Cash";
  List<dynamic> _searchResult = contactsData;

  static List<String> additionalChargeList = [];
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
        index: 24,
        screen: SafeArea(
          child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: bright,
                    padding: EdgeInsets.only(top:defaultPadding/2,bottom: defaultPadding/2,left: defaultPadding,right: defaultPadding),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: ()=>App().setBackNavigation(context),
                          // onPressed: context.read<MenuController>().controlMenu,
                        ),
                        if(!Responsive.isMobile(context))
                          Text("Create Purchase Order",style: Theme.of(context).textTheme.headline6!.copyWith(color: txtColor),),
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
                            child: Text("Save & New")
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
                  Container(
                    margin: EdgeInsets.only(left: defaultPadding,right: defaultPadding),
                    padding: EdgeInsets.all(defaultPadding),
                    decoration: BoxDecoration(
                        color: bright,
                        borderRadius: BorderRadius.all(Radius.circular(4))
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width:30,
                          height:30,
                          child: Image.asset("assets/images/logo.png"),
                        ),
                        SizedBox(width:20),
                        Text("Spiderlingz",style: Theme.of(context).textTheme.subtitle2,),
                        Expanded(
                          child: Container(),
                        ),
                        TextButton(child: Text("View Details"),onPressed: (){},)
                      ],
                    ),
                  ),
                  salesInvoice()
                ],
              )
          ),
        )
    );
  }

  Widget salesInvoice(){
    return Container(
      decoration: BoxDecoration(
          color: bright,
          borderRadius: BorderRadius.all(Radius.circular(4))
      ),
      margin: EdgeInsets.all(defaultPadding),
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(child: Text("Bill From")),
                            OutlinedButton(
                                onPressed: (){},
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: defaultPadding * 1.5,
                                      vertical: defaultPadding
                                  ),
                                  minimumSize: Size(140,35),
                                  textStyle: Theme.of(context).textTheme.caption!.copyWith(fontSize: 10),
                                ),
                                child: Text("Change Party")
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            InkWell(
                                onTap: () {

                                },
                                child: Container(
                                  child: DottedBorder(
                                      borderType: BorderType.Rect,
                                      color: primaryColor,
                                      dashPattern: [8, 4],
                                      strokeWidth: 2,
                                      radius: Radius.circular(12),
                                      child: SizedBox(
                                        width: 200,
                                        height: 100,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.add,color: primaryColor,),
                                            Text("Add Party",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: primaryColor),)
                                          ],
                                        ),
                                      )
                                  ),
                                  margin: EdgeInsets.all(20),
                                )
                            ),
                          ],
                        )
                      ],
                    )
                ),
                Container(
                  color: Colors.black12,
                  width: 2,
                  height: 200,
                  margin: EdgeInsets.only(left: defaultPadding,right: defaultPadding),
                ),
                Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Sales Invoice No:",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
                                SizedBox(
                                  width: 100,
                                  height: 25,
                                  child: TextFormField(
                                    decoration: new InputDecoration(
                                        contentPadding: EdgeInsets.only(left: defaultPadding/2,right: defaultPadding/2,top: 0,bottom: 0),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: primaryColor, width: 1.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: primaryColor, width: 1.0),
                                        ),
                                        hintText: "25",
                                        hintStyle: Theme.of(context).textTheme.caption!.copyWith(color: Colors.black38)
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width:defaultPadding),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Sales Invoice Date:",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
                                SizedBox(
                                  width: 100,
                                  height: 25,
                                  child: TextFormField(
                                    decoration: new InputDecoration(
                                        contentPadding: EdgeInsets.only(left: defaultPadding/2,right: defaultPadding/2,top: 0,bottom: 0),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: primaryColor, width: 1.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: primaryColor, width: 1.0),
                                        ),
                                        hintText: "08 Dec 2021",
                                        hintStyle: Theme.of(context).textTheme.caption!.copyWith(color: Colors.black38)
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],),
                          SizedBox(height: defaultPadding,),
                          SizedBox(
                            width: 300,
                            child: Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right:10,top:10),
                                  child: DottedBorder(
                                    borderType: BorderType.Rect,
                                    color: primaryColor,
                                    dashPattern: [8, 4],
                                    strokeWidth: 2,
                                    radius: Radius.circular(12),
                                    padding: EdgeInsets.all(defaultPadding),
                                    child: Row(children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Payments Terms:",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
                                          SizedBox(
                                            width: 100,
                                            height: 25,
                                            child: TextFormField(
                                              decoration: new InputDecoration(
                                                  contentPadding: EdgeInsets.only(left: defaultPadding/2,right: defaultPadding/2,top: 0,bottom: 0),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: primaryColor, width: 1.0),
                                                  ),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: primaryColor, width: 1.0),
                                                  ),
                                                  hintText: "30 days",
                                                  hintStyle: Theme.of(context).textTheme.caption!.copyWith(color: Colors.black38)
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width:defaultPadding),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Due Date:",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
                                          SizedBox(
                                            width: 100,
                                            height: 25,
                                            child: TextFormField(
                                              decoration: new InputDecoration(
                                                  contentPadding: EdgeInsets.only(left: defaultPadding/2,right: defaultPadding/2,top: 0,bottom: 0),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: primaryColor, width: 1.0),
                                                  ),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: primaryColor, width: 1.0),
                                                  ),
                                                  hintText: "08 Dec 2021",
                                                  hintStyle: Theme.of(context).textTheme.caption!.copyWith(color: Colors.black38)
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],),
                                  ),
                                ),
                                Positioned(
                                  right: -10,
                                  top:-10,
                                  child: IconButton(icon:Icon(Icons.cancel,color: Colors.black38,),onPressed: (){},),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                ),
              ],
            ),
          ),
          Container(
            color: Colors.black12,
            height: 2,
          ),
          itemHeader(),
          SizedBox(
            height: defaultPadding,
          ),
          InkWell(
            onTap: (){
              showDialog(context: context, builder: (context){
                return Dialog(
                    child: Stack(
                      children: [
                        AddItem()
                      ],
                    )
                );
              });
            },
            child: Container(
              margin: EdgeInsets.only(left: 2,right: 2),
              child: DottedBorder(
                  borderType: BorderType.Rect,
                  color: primaryColor,
                  dashPattern: [8, 4],
                  strokeWidth: 2,
                  radius: Radius.circular(12),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add,color: primaryColor,),
                        Text("Add Item",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: primaryColor),)
                      ],
                    ),
                  )
              ),
            ),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Container(
            color: Colors.black12,
            height: 2,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: defaultPadding,
                    ),
                    Container(
                      padding: EdgeInsets.only(right: defaultPadding),
                      child:
                      AccordianSwap(
                          isSwap:notesSwap,
                          onClick: (){
                            setState(() {
                              notesSwap = !notesSwap;
                            });
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Notes"),
                                  IconButton(onPressed: (){
                                    setState(() {
                                      notesSwap = !notesSwap;
                                    });
                                  }, icon: Icon(Icons.cancel_outlined,color: Colors.black38,))
                                ],
                              ),
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
                                      hintText: "Enter your notes",
                                      hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.black38)
                                  ),
                                ),
                              ),
                            ],),
                          accordianHeader: "+ Add Notes"
                      ),),
                    SizedBox(
                      height: defaultPadding,
                    ),
                    Container(
                        padding: EdgeInsets.only(right: defaultPadding),
                        child:
                        AccordianSwap(
                            onClick: (){
                              setState(() {
                                termsConditionsSwap = !termsConditionsSwap;
                              });
                            },
                            isSwap:termsConditionsSwap,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Terms and Conditions"),
                                    IconButton(onPressed: (){
                                      setState(() {
                                        termsConditionsSwap = !termsConditionsSwap;
                                      });
                                    }, icon: Icon(Icons.cancel_outlined,color: Colors.black38,))
                                  ],
                                ),
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
                                        hintText: "Enter your terms and conditions",
                                        hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.black38)
                                    ),
                                  ),
                                ),

                              ],),
                            accordianHeader: "+ Add Terms and Conditions"
                        )),
                    SizedBox(
                        height:defaultPadding
                    ),
                    Container(
                      color: Colors.black12,
                      height: 2,
                      width: double.infinity,
                    ),
                    Container(
                        padding: EdgeInsets.only(right: defaultPadding,top:defaultPadding),
                        child:
                        AccordianSwap(
                            onClick: (){
                              setState(() {
                                bankDetailsSwap = !bankDetailsSwap;
                              });
                            },
                            isSwap:bankDetailsSwap,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Bank Details"),
                                    IconButton(onPressed: (){
                                      setState(() {
                                        bankDetailsSwap = !bankDetailsSwap;
                                      });
                                    }, icon: Icon(Icons.cancel_outlined,color: Colors.black38,))
                                  ],
                                ),
                                SizedBox(height:defaultPadding),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("ACCOUNT NUMBER",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
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
                                                hintText: "Enter account number",
                                                hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.black38)
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width:defaultPadding),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("RE-ENTER ACCOUNT NUMBER",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
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
                                                hintText: "Re-enter account number",
                                                hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.black38)
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height:defaultPadding),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("ACCOUNT HOLDER'S NAME",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
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
                                                hintText: "Enter your number",
                                                hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.black38)
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width:defaultPadding),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("IFSC CODE",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
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
                                                hintText: "Enter IFSC Code",
                                                hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.black38)
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height:defaultPadding),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("BANK & BRANCH NAME",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
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
                                            hintText: "Enter bank branch",
                                            hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.black38)
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],),
                            accordianHeader: "+ Add Bank Details"
                        )),
                    Container(
                        padding: EdgeInsets.only(right: defaultPadding,top:defaultPadding),
                        child:
                        AccordianSwap(
                            onClick: (){
                              setState(() {
                                upiIdSwap = !upiIdSwap;
                              });
                            },
                            isSwap:upiIdSwap,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("UPI ID"),
                                    IconButton(onPressed: (){
                                      setState(() {
                                        upiIdSwap = !upiIdSwap;
                                      });
                                    }, icon: Icon(Icons.cancel_outlined,color: Colors.black38,))
                                  ],
                                ),
                                SizedBox(
                                  height: 80,
                                  width:300,
                                  child:TextFormField(
                                    decoration: new InputDecoration(
                                        contentPadding: EdgeInsets.all(defaultPadding/2),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: primaryColor, width: 1.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: primaryColor, width: 1.0),
                                        ),
                                        hintText: "Enter UPI ID",
                                        hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.black38)
                                    ),
                                  ),
                                ),

                              ],),
                            accordianHeader: "+ Add UPI ID"
                        )),
                  ],),
              ),
              Container(
                  color: Colors.black12,
                  width: 2,
                  height: 600
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:EdgeInsets.all(defaultPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Taxable Amount"),
                          Text("0")
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.black12,
                      height: 2,
                      width: double.infinity,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: defaultPadding,top: defaultPadding),
                        child:
                        AccordianSwap(
                            onClick: (){
                              setState(() {
                                discountSwap = !discountSwap;
                              });
                            },
                            isSwap:discountSwap,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child:Text("Discount"),
                                    ),
                                    SizedBox(
                                      width:200,
                                      height:30,
                                      child: TextFormField(
                                        decoration: new InputDecoration(
                                            contentPadding: EdgeInsets.all(defaultPadding/2),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: primaryColor, width: 1.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: primaryColor, width: 1.0),
                                            ),
                                            hintText: "0%",
                                            hintStyle: Theme.of(context).textTheme.caption!.copyWith(color: Colors.black38)
                                        ),
                                      ),
                                    ),
                                    SizedBox(width:defaultPadding),
                                    SizedBox(
                                      width:200,
                                      height:30,
                                      child: TextFormField(
                                        decoration: new InputDecoration(
                                            contentPadding: EdgeInsets.all(defaultPadding/2),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: primaryColor, width: 1.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: primaryColor, width: 1.0),
                                            ),
                                            hintText: "0",
                                            hintStyle: Theme.of(context).textTheme.caption!.copyWith(color: Colors.black38)
                                        ),
                                      ),
                                    ),
                                    IconButton(onPressed: (){
                                      setState(() {
                                        discountSwap = !discountSwap;
                                      });
                                    }, icon: Icon(Icons.cancel_outlined,color: Colors.black38,))
                                  ],
                                ),
                              ],),
                            accordianHeader: "+ Add Discount"
                        )),
                    Container(
                      padding: EdgeInsets.only(left: defaultPadding,top: defaultPadding),
                      child:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ..._getFriends(),
                        ],
                      ),),
                    Container(
                      padding: EdgeInsets.only(left: defaultPadding,top: defaultPadding),
                      child: Material(
                          color: bright,
                          child: InkWell(
                              onTap: (){
                                additionalChargeList.insert(0, "");
                                setState((){});
                              },
                              child:Text("+ Add Additional charge")
                          )
                      ),
                    ),
                    SizedBox(height:defaultPadding),
                    Container(
                      color: Colors.black12,
                      height: 2,
                      width: double.infinity,
                    ),
                    SizedBox(height:defaultPadding),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Round Off"),
                        Checkbox(value: roundOff, onChanged: (val){
                          setState(() {
                            roundOff = val!;
                          });
                        }),
                      ],
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Amount"),
                          SizedBox(
                            width:300,
                            height:30,
                            child: TextFormField(
                              decoration: new InputDecoration(
                                  contentPadding: EdgeInsets.all(defaultPadding/2),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: primaryColor, width: 1.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: primaryColor, width: 1.0),
                                  ),
                                  hintText: "Enter Payment Amount",
                                  hintStyle: Theme.of(context).textTheme.caption!.copyWith(color: Colors.black38)
                              ),
                            ),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.only(left:defaultPadding,top:defaultPadding),
                    ),
                    SizedBox(height:defaultPadding),
                    Container(
                      color: Colors.black12,
                      height: 2,
                      width: double.infinity,
                    ),
                    SizedBox(height:defaultPadding),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Mark as fully paid"),
                        Checkbox(value: roundOff, onChanged: (val){
                          setState(() {
                            roundOff = val!;
                          });
                        }),
                      ],
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Amount Received"),
                          Row(
                            children: [
                              SizedBox(
                                width: 300,
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
                              Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(0),bottomLeft: Radius.circular(0),topRight: Radius.circular(4),bottomRight: Radius.circular(4))
                                  ),
                                  padding: EdgeInsets.all(defaultPadding/2),
                                  child: DropdownButton<String>(
                                    underline: Container(),
                                    value: amountReceivedMode,
                                    items: ["Cash","Cheque","Online"].map((e) {
                                      return DropdownMenuItem<String>(
                                        value: e,
                                        child: Text(e,style: Theme.of(context).textTheme.subtitle2!.copyWith(color: txtColor),),
                                      );
                                    }).toList(),
                                    onChanged: (val){
                                      setState(() {
                                        amountReceivedMode = val!;
                                      });
                                    },
                                  )
                              )
                            ],
                          )
                        ],
                      ),
                      padding: EdgeInsets.only(left:defaultPadding,top:defaultPadding),
                    ),
                    SizedBox(height:defaultPadding),
                    Container(
                      color: Colors.black12,
                      height: 2,
                      width: double.infinity,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Balance Amount"),
                          Text("0"),
                        ],
                      ),
                      padding: EdgeInsets.all(defaultPadding),
                    ),
                    Container(
                      color: Colors.black12,
                      height: 2,
                      width: double.infinity,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top:defaultPadding
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Authorized sgnatory for Spiderlingz"),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top:defaultPadding
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width:300,
                            height:100,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: primaryColor,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(4))
                            ),
                          )
                        ],
                      ),
                    ),
                  ],),
              ),
            ],
          )
        ],
      ),
    );
  }

  onSearchTextChanged(String text) async {
    print(text);
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    contactsData.forEach((item) {
      if (item.name.contains(text))
        _searchResult.add(item);
    });
    setState(() {});
    print(_searchResult.length);
  }

  List<Widget> _getFriends(){
    List<Widget> additionalChargeFieldsList = [];
    for(int i=0; i<additionalChargeList.length; i++){
      additionalChargeFieldsList.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              children: [
                Expanded(child: AdditionalChargeTextFields(i)),
                SizedBox(width:defaultPadding/2),
                InkWell(
                    onTap: (){
                      additionalChargeList.removeAt(i);
                      setState((){});
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          child: Icon(Icons.cancel_outlined, color: Colors.black26,
                          ),
                        ),
                      ],
                    )
                )
              ],
            ),
          )
      );
    }
    return additionalChargeFieldsList;
  }

  Widget itemHeader(){
    return SizedBox(
        width: double.infinity,
        child: DataTable(
          horizontalMargin: 10,
          showBottomBorder: true,
          headingRowColor: MaterialStateProperty.all(Colors.black12),
          columnSpacing: defaultPadding,
          columns: [
            DataColumn(
                label: Text("NO")
            ),
            DataColumn(
                label: SizedBox(
                  width: 200,
                  child: Text("ITEMS"),
                )
            ),
            DataColumn(
                label: Text("HSN")
            ),
            DataColumn(
                label: Text("MRP")
            ),
            DataColumn(
                label: Text("QTY")
            ),
            DataColumn(
                label: Text("PRICE/ITEM")
            ),
            DataColumn(
                label: Text("DISCOUNT")
            ),
            DataColumn(
                label: Text("TAX")
            ),
            DataColumn(
                label: Text("AMOUNT")
            ),
            DataColumn(
                label: Text("-")
            ),
          ],
          rows: [],
        )
    );
  }
}

class AdditionalChargeTextFields extends StatefulWidget {
  final int index;
  AdditionalChargeTextFields(this.index);
  @override
  _AdditionalChargeTextFieldsState createState() => _AdditionalChargeTextFieldsState();
}
class _AdditionalChargeTextFieldsState extends State<AdditionalChargeTextFields> {
  late TextEditingController _nameController;
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }
  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _nameController.text = _CreatePurchaseOrderState.additionalChargeList[widget.index]
          ?? '';
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width:300,
          height:30,
          child: TextFormField(
            controller: _nameController,
            onChanged: (v) => _CreatePurchaseOrderState.additionalChargeList[widget.index] = v,
            decoration: new InputDecoration(
                contentPadding: EdgeInsets.all(defaultPadding/2),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor, width: 1.0),
                ),
                hintText: "Charge Name",
                hintStyle: Theme.of(context).textTheme.caption!.copyWith(color: Colors.black38)
            ),
            validator: (v){
              if(v!.trim().isEmpty) return 'Please enter something';
              return null;
            },
          ),
        ),
        SizedBox(
          width:200,
          height:30,
          child: TextFormField(
            controller: _nameController,
            onChanged: (v) => _CreatePurchaseOrderState.additionalChargeList[widget.index] = v,
            decoration: new InputDecoration(
                contentPadding: EdgeInsets.all(defaultPadding/2),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor, width: 1.0),
                ),
                hintText: "0",
                hintStyle: Theme.of(context).textTheme.caption!.copyWith(color: Colors.black38)
            ),
            validator: (v){
              if(v!.trim().isEmpty) return 'Please enter something';
              return null;
            },
          ),
        ),
      ],
    );
  }
}


class ContactsData{
  final String name,mobile,address,email,gstin;

  ContactsData({required this.name,required this.mobile,required this.address,required this.email,required this.gstin});
}

List<ContactsData> contactsData = [
  ContactsData(name: "Dhana",mobile: "8056384773",address: "2, TNHB, Mela Anuppanadi, Madurai - 625009",email:"1dhana625@gmail.com",gstin: "123XXXXXX89789"),
  ContactsData(name: "Guna",mobile: "8056384773",address: "2, TNHB, Mela Anuppanadi, Madurai - 625009",email:"1dhana625@gmail.com",gstin: "123XXXXXX89789"),
  ContactsData(name: "Raju",mobile: "8056384773",address: "2, TNHB, Mela Anuppanadi, Madurai - 625009",email:"1dhana625@gmail.com",gstin: "123XXXXXX89789"),
  ContactsData(name: "Kumar",mobile: "8056384773",address: "2, TNHB, Mela Anuppanadi, Madurai - 625009",email:"1dhana625@gmail.com",gstin: "123XXXXXX89789"),
  ContactsData(name: "Alagu",mobile: "8056384773",address: "2, TNHB, Mela Anuppanadi, Madurai - 625009",email:"1dhana625@gmail.com",gstin: "123XXXXXX89789"),
  ContactsData(name: "Dhinesh",mobile: "8056384773",address: "2, TNHB, Mela Anuppanadi, Madurai - 625009",email:"1dhana625@gmail.com",gstin: "123XXXXXX89789"),
  ContactsData(name: "Bala",mobile: "8056384773",address: "2, TNHB, Mela Anuppanadi, Madurai - 625009",email:"1dhana625@gmail.com",gstin: "123XXXXXX89789"),
  ContactsData(name: "Jerlin",mobile: "8056384773",address: "2, TNHB, Mela Anuppanadi, Madurai - 625009",email:"1dhana625@gmail.com",gstin: "123XXXXXX89789"),
  ContactsData(name: "Kavya",mobile: "8056384773",address: "2, TNHB, Mela Anuppanadi, Madurai - 625009",email:"1dhana625@gmail.com",gstin: "123XXXXXX89789"),
  ContactsData(name: "Amrin",mobile: "8056384773",address: "2, TNHB, Mela Anuppanadi, Madurai - 625009",email:"1dhana625@gmail.com",gstin: "123XXXXXX89789"),
  ContactsData(name: "Hansa",mobile: "8056384773",address: "2, TNHB, Mela Anuppanadi, Madurai - 625009",email:"1dhana625@gmail.com",gstin: "123XXXXXX89789"),
  ContactsData(name: "Samsa",mobile: "8056384773",address: "2, TNHB, Mela Anuppanadi, Madurai - 625009",email:"1dhana625@gmail.com",gstin: "123XXXXXX89789"),
  ContactsData(name: "John",mobile: "8056384773",address: "2, TNHB, Mela Anuppanadi, Madurai - 625009",email:"1dhana625@gmail.com",gstin: "123XXXXXX89789"),
  ContactsData(name: "Nikil",mobile: "8056384773",address: "2, TNHB, Mela Anuppanadi, Madurai - 625009",email:"1dhana625@gmail.com",gstin: "123XXXXXX89789"),
];
