import 'package:flutter/material.dart';

class Accordian extends StatefulWidget {

  final Widget child;
  final String accordianHeader;

  Accordian({
    required this.child,
    required this.accordianHeader
  });

  @override
  _AccordianState createState() => _AccordianState();
}

class _AccordianState extends State<Accordian> {

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Material(
            color: isVisible?Colors.transparent:Colors.white,
            child: InkWell(
              child: Row(
                children: [
                  Icon(isVisible?Icons.cancel:Icons.add_circle),
                  Text(widget.accordianHeader)
                ],
              ),
              onTap: (){
                setState(() {
                  isVisible = !isVisible;
                });
              },
            ),
          ),
          Visibility(
            visible: isVisible,
            child: Container(
              color: Colors.white,
              child: widget.child,
            )
          )
        ],
      ),
    );
  }
}
