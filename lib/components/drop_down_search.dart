import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class DropDownSearch extends StatefulWidget {
  final List<String> searchList;
  final ValueChanged onClick;
  final TextEditingController controller;
  final bool isFocus;

  DropDownSearch({
    required this.searchList,
    required this.controller,
    required this.onClick,
    required this.isFocus,
  });

  @override
  _DropDownSearchState createState() => _DropDownSearchState();
}

class _DropDownSearchState extends State<DropDownSearch> {

  final FocusNode _focusNode = FocusNode();

  late OverlayEntry _overlayEntry;

  final LayerLink _layerLink = LayerLink();
  List<dynamic> _searchResult = [];

  @override
  void initState() {
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        this._overlayEntry = this._createOverlayEntry();
      } else {
        this._overlayEntry.remove();
      }
    });
  }

  OverlayEntry _createOverlayEntry() {
    print("length is "+ widget.searchList.length.toString());
    RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    var size = renderBox!.size;

    return OverlayEntry(
        builder: (context) => Positioned(
          width: size.width,
          child: CompositedTransformFollower(
            link: this._layerLink,
            showWhenUnlinked: false,
            offset: Offset(0.0, size.height + 5.0),
            child: Material(
              elevation: 0.0,
              color: bright,
              child:Container(
                  color: bright,
                  child: Container(
                    constraints: BoxConstraints(
                        maxHeight: 300
                    ),
                    child: ListView.builder(
                        padding: EdgeInsets.only(left: 15,right: 15),
                        shrinkWrap: true,
                        itemCount: _searchResult.length,
                        itemBuilder: (BuildContext context,index){
                          return (_searchResult[index] !=null)
                          ?ListTile(
                            shape: Border(
                                bottom: BorderSide(
                                    width: 1,
                                    color: bright
                                )
                            ),
                            title: Text(_searchResult[index]),
                            onTap: () {
                              widget.onClick(_searchResult[index]);
                              _overlayEntry.remove();
                              _focusNode.unfocus();
                              setState(() {
                                _searchResult.clear();
                              });
                            },
                          ):Container();
                        }
                    ),
                  )
              ))
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: this._layerLink,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Place of supply",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),),
          SizedBox(
            width: 300,
            height: 40,
            child: TextFormField(
              focusNode: this._focusNode,
              controller: widget.controller,
              onChanged: onSearchTextChanged,
              decoration: new InputDecoration(
                  contentPadding: EdgeInsets.only(left: defaultPadding/2,right: defaultPadding/2,top: 0,bottom: 0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor, width: 1.0),
                  ),
                  hintText: "Place of supply (Enter state)",
                  hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.black38)
              ),
            ),
          ),
        ],
      ),
    );
  }

  onSearchTextChanged(String text) async {
    print(text);
    _searchResult.clear();
    if (text.isEmpty) {
      _overlayEntry.remove();
      setState(() {});
      return;
    }
    widget.searchList.forEach((item) {
      if (item.contains(text))
        _searchResult.add(item);
    });

    _searchResult.isNotEmpty
        ? Overlay.of(context)!.insert(this._overlayEntry)
        : _overlayEntry.remove();
    setState(() {});
  }
}