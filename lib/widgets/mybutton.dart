import 'package:flutter/material.dart';
class MyButton extends StatelessWidget {

  dynamic  onPressed ;
  dynamic name ="";
  MyButton({this.name,  this.onPressed});



  @override
  Widget build(BuildContext context) {
  return Container(
  height: 45.0,
  width: double.infinity,
  child: ElevatedButton(
  onPressed: onPressed(),
  child: Text(name),
  ));
  }
}
