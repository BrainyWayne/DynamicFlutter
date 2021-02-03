import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

Widget cText(String text, bool bold, double size, Color color) {
  bool darkModeOn;
  var brightness = SchedulerBinding.instance.window.platformBrightness;
  darkModeOn = brightness == Brightness.dark;
  if(color == Colors.white || color == Colors.black) return Text(
    text,
    overflow: TextOverflow.fade,
    style: TextStyle(
        fontFamily: bold == true ? "nunitobold" : "nunito",
        fontSize: size,
        ),
  ); else{
    return Text(
      text,
      overflow: TextOverflow.fade,
      style: TextStyle(
          fontFamily: bold == true ? "nunitobold" : "nunito",
          fontSize: size,
          color: color),
    );
  }
}

void navigateTo(BuildContext context, Widget widget) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => Material(child: widget)));
}

void navigateToReplace(BuildContext context, Widget widget) {
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => Material(child: widget)));
}

void goBack(BuildContext context) {
  Navigator.pop(context);
}

Widget cButton(String text, Color textColor, Color color, BuildContext context,
    {double width}) {
  return Container(
    width: width ?? MediaQuery.of(context).size.width,
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
    child: Center(child: cText(text, true, 15, textColor)),
  );
}

Widget materialButton(String text, Color color) {
  return Row(
    children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20)),
        child: cText(text, false, 15, color),
      ),
    ],
  );
}

Widget backButton() {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: Icon(
        Icons.keyboard_backspace,
        size: 18,
      ),
    ),
  );
}

Widget greenBackButton() {
  return Container(
    decoration: BoxDecoration(
        color: Colors.green, borderRadius: BorderRadius.circular(5)),
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: Icon(
        Icons.keyboard_backspace,
        color: Colors.white,
        size: 18,
      ),
    ),
  );
}

Widget transparentBackButton() {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(5)),
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: Icon(
        Icons.keyboard_backspace,
        color: Colors.white,
        size: 18,
      ),
    ),
  );
}

Widget transparentSearchButton() {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Icon(
        Icons.search,
        color: Colors.white,
      ),
    ),
  );
}

//! TODO taske Icon parameter
InputDecoration textFieldDecoration() {
  return InputDecoration(
      fillColor: Colors.black,
      suffixIcon: Icon(Icons.lock),
      errorBorder: InputBorder.none,
      border: InputBorder.none,
      disabledBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      focusedErrorBorder: InputBorder.none);
}
