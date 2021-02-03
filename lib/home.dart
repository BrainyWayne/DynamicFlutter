import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation/dynamic_progress.dart';
import 'package:navigation/dynamic_scaffold.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DynamicScaffold(
      largeTitle: Container(child: Text("Home")),
      body: body(),
      leading: Container(
          child: Text("Edit", style: TextStyle(color: Colors.blue)),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 0)),
      trailing: Icon(Icons.airplay_sharp, size: 20),
    );
  }

  Widget body() {
    return Stack(
      children: [
        Center(
          child: DynamicProgressIndicator(),
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                color: Colors.blue,
                  child: Text("Show action sheet"), onPressed: () {
                final act = CupertinoActionSheet(
                    title: Text('Select Option'),
                    actions: <Widget>[
                      CupertinoActionSheetAction(
                        child: Text('Option 1'),
                        onPressed: () {
                          print('pressed');
                        },
                      ),
                      CupertinoActionSheetAction(
                        child: Text('Option 2'),
                        onPressed: () {
                          print('pressed');
                        },
                      ),
                    ],
                    cancelButton: CupertinoActionSheetAction(
                      child: Text('Cancel'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ));
                showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) => act);
              }),
            ],
          ),
        ),
      ],
    );
  }
}
