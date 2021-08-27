import 'package:ecommerce/screens/checkout.dart';
import 'package:ecommerce/screens/homepage.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity
        ),
        home: Checkout()
    )
  );
}