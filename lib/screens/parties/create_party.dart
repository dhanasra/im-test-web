import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im_web/app/app.dart';
import 'package:im_web/components/drop_down_search.dart';
import 'package:im_web/components/screen_wrapper.dart';
import 'package:im_web/screens/dashboard/dashboard_screen.dart';

import '../../constants.dart';
import '../../responsive.dart';

class CreateParty extends StatefulWidget {
  const CreateParty({Key? key}) : super(key: key);

  @override
  _CreatePartyState createState() => _CreatePartyState();
}

class _CreatePartyState extends State<CreateParty> {
  var selectedVal = "To Pay";
  var partyType = "Customer";

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
                  padding: EdgeInsets.all(defaultPadding/2),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: ()=>App().setBackNavigation(context),
                        // onPressed: context.read<MenuController>().controlMenu,
                      ),
                      if(!Responsive.isMobile(context))
                        Text("Create Party",style: Theme.of(context).textTheme.headline6!.copyWith(color: txtColor),),
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
        child: Column(
          children: [
             Row(
                children: [
                  Column(
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
                    ],
                  ),
                  SizedBox(width:defaultPadding),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Mobile Number",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
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
                              hintText: "Enter mobile number",
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
                      Text("Email",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
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
                              hintText: "Enter email",
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
                        Text("Opening Balance",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
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
                                    hintText: "Party balance",
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
                                  value: selectedVal,
                                  items: ["To Pay","To Collect"].map((e) {
                                    return DropdownMenuItem<String>(
                                      value: e,
                                      child: Text(e,style: Theme.of(context).textTheme.subtitle2!.copyWith(color: txtColor),),
                                    );
                                  }).toList(),
                                  onChanged: (val){
                                    setState(() {
                                      selectedVal = val!;
                                    });
                                  },
                                )
                            )
                          ],
                        )
                      ]
                  )
                ],
              ),
            Container(
              margin: EdgeInsets.all(defaultPadding*2),
              height: 1,
              color: Colors.black38,
            ),
            Row(
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Party Type",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
                      Row(
                        children: [
                          Container(
                            width: 300,
                              height: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(color: primaryColor,width: 1),
                                  borderRadius: BorderRadius.all(Radius.circular(4))
                              ),
                              padding: EdgeInsets.all(defaultPadding/2),
                              child: DropdownButton<String>(
                                value: partyType,
                                isExpanded: true,
                                underline: Container(),
                                items: ["Customer","Supplier"].map((e) {
                                  return DropdownMenuItem<String>(
                                    value: e,
                                    child: Text(e,style: Theme.of(context).textTheme.subtitle2!.copyWith(color: txtColor)),
                                  );
                                }).toList(),
                                onChanged: (val){
                                  setState(() {
                                    partyType = val!;
                                  });
                                },
                              )
                          )
                        ],
                      )
                    ]
                ),
                SizedBox(width:defaultPadding),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("GSTIN",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
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
                            hintText: "ex: 29XXXXXXXX990909",
                            hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.black38)
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width:defaultPadding),
                DropDownSearch(
                    searchList: ["Tamil Nadu","Gujarat"],
                    controller: TextEditingController(),
                    onClick: (val){},
                    isFocus: false
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
                      Text("Billing Address",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
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
                                hintText: "Enter billing address",
                                hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.black38)
                            ),
                          ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width:defaultPadding),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Shipping Address",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
                      SizedBox(
                        height: 80,
                        child: TextFormField(
                          maxLines: 5,
                          decoration: new InputDecoration(
                              contentPadding: EdgeInsets.all(defaultPadding/2),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryColor, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryColor, width: 1.0),
                              ),
                              hintText: "Enter shipping address",
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
      )
    );
  }
}
