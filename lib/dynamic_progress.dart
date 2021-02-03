import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DynamicProgressIndicator extends StatefulWidget {

  final double radius;

  const DynamicProgressIndicator({Key key, this.radius}) : super(key: key);


  @override
  _DynamicProgressIndicatorState createState() => _DynamicProgressIndicatorState();
}


class _DynamicProgressIndicatorState extends State<DynamicProgressIndicator> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(Platform.isAndroid){
      return CupertinoActivityIndicator(radius: widget.radius == null ? 10 : widget.radius,);
    }
    // else if(Platform.isAndroid){
    //   return CircularProgressIndicator();
    // }
  }
}
