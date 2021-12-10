import 'package:flutter/material.dart';
import 'package:im_web/controllers/menu_controller.dart';

import '../constants.dart';
import '../responsive.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bright,
      padding: EdgeInsets.only(left:defaultPadding,right:defaultPadding),
      child: Row(
        children: [
          if(!Responsive.isDesktop(context))
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: context.read<MenuController>().controlMenu,
            ),
          if(!Responsive.isMobile(context))
            Text("Dashboard",style: Theme.of(context).textTheme.headline6!.copyWith(color: txtColor),),
          if(!Responsive.isMobile(context))
            Spacer(flex: Responsive.isDesktop(context) ? 2 : 1,),
          // Expanded(
          //     child: SearchField()
          // ),
          ProfileCard()
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: defaultPadding,top: defaultPadding/2,bottom: defaultPadding/2),
      padding: EdgeInsets.symmetric(
          horizontal: defaultPadding,
          vertical: 4
      ),
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: Colors.white10)
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: Image.asset(
              "assets/images/profile.jpeg",
              height: 28.0,
              width: 28.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding/2),
            child: Text("Jack Sparrow",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
          ),
          Icon(Icons.keyboard_arrow_down,color: txtColor,)
        ],
      ),
    );
  }
}


class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: "Search",
          hintStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(2))
          ),
          fillColor: secondaryColor,
          filled: true,
          suffixIcon: InkWell(
            onTap: (){},
            child: Container(
              padding: EdgeInsets.all(defaultPadding * 0.5),
              margin: EdgeInsets.symmetric(horizontal: defaultPadding/2),
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Icon(Icons.search,color: Colors.white,),
            ),
          )
      ),
    );
  }
}
