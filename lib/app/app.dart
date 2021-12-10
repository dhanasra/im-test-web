import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:im_web/controllers/menu_controller.dart';
import 'package:im_web/screens/dashboard/dashboard_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import 'app_routes.dart';

class App extends StatelessWidget {
  static const App _instance = App._internal();

  const App._internal();
  factory App() {
    return _instance;
  }

  @override
  Widget build(BuildContext context) {
    return getMaterialApp(widget: DashboardScreen(), title: 'Launch', buildContext: context);
  }

  AppRoutes getAppRoutes() {
    return AppRoutes();
  }

  Widget getMaterialApp({required Widget widget,required String title,required BuildContext buildContext}) {
    return
      MultiProvider(
        providers: [
          ChangeNotifierProvider<MenuController>(
              create: (_) => MenuController()
          )
        ],
        child: MaterialApp(
                title: title,
                initialRoute: "/",
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                    scaffoldBackgroundColor: bgColor,
                    canvasColor: secondaryColor,
                    textTheme: GoogleFonts.poppinsTextTheme(Theme.of(buildContext).textTheme.apply(bodyColor: txtColor))
                ),
                home: widget,
                onGenerateRoute: getAppRoutes().getRoutes,
        )
    );
  }

  Future<dynamic> setNavigation(
      BuildContext context, String appRouteName) async {
    Future.delayed(const Duration(milliseconds: 100), () async {
      final info = await Navigator.push(
          context,
          PageTransition(
              child: getAppRoutes().getWidget(context, appRouteName),
              type: PageTransitionType.fade,
              settings: RouteSettings(name: appRouteName),
              duration: const Duration(milliseconds: 0)));

      return info;
    });
  }

  void setBackNavigation(BuildContext context) {
    Navigator.pop(context, "inefr");
  }

  void closeApp() {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else {
      exit(0);
    }
  }
}
