import 'package:flutter/material.dart';
class ChangeScreen extends StatelessWidget {

  final String name;
  final Function onTap;
  final String whichaccount;
  ChangeScreen({required this.name,required this.onTap,required this.whichaccount});


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(whichaccount),
        SizedBox(
          width: 15,
        ),
        GestureDetector(
          child: Text(
            name,
            style: TextStyle(fontSize: 20.0, color: Colors.blue),
          ),
          onTap: onTap(),
        )
      ],
    );
  }
}
