import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im_web/components/screen_wrapper.dart';

import '../../../constants.dart';
import '../../../responsive.dart';

class RecordPaymentOut extends StatefulWidget {
  const RecordPaymentOut({Key? key}) : super(key: key);

  @override
  _RecordPaymentOutState createState() => _RecordPaymentOutState();
}

class _RecordPaymentOutState extends State<RecordPaymentOut> {
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
        index: 22,
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
                          Text("Record Payment Out",style: Theme.of(context).textTheme.headline6!.copyWith(color: txtColor),),
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
                  ),
                  SizedBox(height: defaultPadding,),
                  Container(
                    padding: EdgeInsets.all(defaultPadding),
                    color:bright,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Party Name",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
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
                                        hintText: "Enter name",
                                        hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.black38)
                                    ),
                                  ),
                                ),
                                SizedBox(height:defaultPadding),
                                Text("Enter Payment Amount",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
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
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Payment Date",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
                                          SizedBox(
                                            width: double.infinity,
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
                                                  hintText: "09 Dec 2021",
                                                  hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.black38)
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Payment Type",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
                                          SizedBox(
                                            width: double.infinity,
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
                                                  hintText: "Cash",
                                                  hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.black38)
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Payment No",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
                                          SizedBox(
                                            width: double.infinity,
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
                                                  hintText: "2",
                                                  hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.black38)
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height:defaultPadding),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Notes",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
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
                                                  hintText: "Enter notes",
                                                  hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.black38)
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
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
