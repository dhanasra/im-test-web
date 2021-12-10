import 'package:flutter/material.dart';

import '../constants.dart';

class ChargeField extends StatefulWidget {
  final Widget child;
  final bool isAmountLabel;
  final bool isNone;
  final bool isCloseable;
  final VoidCallback onClick;
  final bool addInput;

  ChargeField({
    required this.child,
    this.isAmountLabel = false,
    this.isNone = false,
    this.isCloseable = true,
    required this.onClick,
    this.addInput = true
  });

  @override
  _ChargeFieldState createState() => _ChargeFieldState();
}

class _ChargeFieldState extends State<ChargeField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Visibility(
            visible: widget.isCloseable,
            child: Container(
              child: SizedBox(
                width: 40,
                child: IconButton(
                    onPressed: widget.onClick,
                    icon: Icon(Icons.cancel,size: 20,color: Colors.black26,)
                ),
              ),
            )
          ),
          Visibility(
            visible: !widget.addInput,
            child:
            Expanded(child: widget.child),
          ),
          Visibility(
            visible: widget.addInput ,
              child: Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: bright,
                        border: Border(bottom: BorderSide(
                            color: bright,
                            width: 1,
                            style: BorderStyle.solid
                        ))
                    ),
                    child: SizedBox(
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
                        )
                    )
                  )
              )
          ),
          Container(
              decoration: BoxDecoration(
                  color: bright,
                  border: Border(bottom: BorderSide(
                      color: bright,
                      width: 1,
                      style: BorderStyle.solid
                  ))
              ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.add,size: 16,),
                widget.isAmountLabel?
                Text("00.00"):
                TextFormField(
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
                )
              ],
            )
          )
        ],
      ),
    );
  }
}
