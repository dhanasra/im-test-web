import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:im_web/components/sidemenu.dart';
import 'package:im_web/controllers/menu_controller.dart';
import 'package:im_web/responsive.dart';

class ScreenWrapper extends StatelessWidget {
  const ScreenWrapper({
    Key? key,
    required this.index,
    required this.screen
  }) : super(key: key);

  final int index;
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(index: index,),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(Responsive.isDesktop(context))
              Expanded(
                  child: SideMenu(index: index,)
              ),
            Expanded(
                flex: 5,
                child: screen
            )
          ],
        ),
      ),
    );
  }
}


