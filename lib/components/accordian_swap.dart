import 'package:flutter/material.dart';

import '../constants.dart';

class AccordianSwap extends StatelessWidget {

  final String accordianHeader;
  final bool isSwap;
  final Widget child;
  final VoidCallback onClick;

  AccordianSwap({
    required this.accordianHeader ,
    this.isSwap = false,
    required this.child,
    required this.onClick
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Visibility(
                  visible: !isSwap,
                  child: Material(
                    color: bright,
                    child: InkWell(
                        onTap: onClick,
                        child:Text(accordianHeader)
                    ))
              ),
              Visibility(
                  visible: isSwap,
                  child: child
              )
            ],
      );
  }
}
