import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:im_web/app/app.dart';
import 'package:im_web/components/screen_wrapper.dart';

import '../../constants.dart';
import '../../responsive.dart';

class CreateExpenses extends StatefulWidget {
  const CreateExpenses({Key? key}) : super(key: key);

  @override
  _CreateExpensesState createState() => _CreateExpensesState();
}

class _CreateExpensesState extends State<CreateExpenses> {
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
                        padding: EdgeInsets.all(defaultPadding/2),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_back),
                              onPressed: ()=>App().setBackNavigation(context),
                              // onPressed: context.read<MenuController>().controlMenu,
                            ),
                            if(!Responsive.isMobile(context))
                              Text("Create Expense",style: Theme.of(context).textTheme.headline6!.copyWith(color: txtColor),),
                            if(!Responsive.isMobile(context))
                              Spacer(flex: Responsive.isDesktop(context) ? 2 : 1,),
                            // Expanded(
                            //     child: SearchField()
                            // ),
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
                      addExpenseForm()
                    ]
                )
            )
        )
    );
  }

  Widget addExpenseForm(){
    return Form(
      child: Container(
        padding: EdgeInsets.all(defaultPadding),
        color: bright,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: expenseDetails()
            ),
            SizedBox(width: defaultPadding),
            Expanded(child: Container()
            )
          ],
        ),
      )
    );
  }

  Widget expenseDetails(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Expense Category",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
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
                hintText: "Select Category",
                hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.black38)
            ),
          ),
        ),
        SizedBox(height: defaultPadding),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Payment Mode",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
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
                        hintText: "Cash",
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
                Text("Date",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
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
                        hintText: "8 DEC 2021",
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: Text("Total Expense Amount",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: txtColor),),
              width: 300,
            ),
            SizedBox(width: defaultPadding),
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
        SizedBox(height: defaultPadding),
        Text("Notes (Optional)",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
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
                hintText: "Enter Note",
                hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.black38)
            ),
          ),
        ),
      ],
    );
  }
}
