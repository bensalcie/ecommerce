import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'detailsscreen.dart';
class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  int qty =1 ;
  Widget _buildSingleProduct (){
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 130,
                      // width: 110,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("images/mozzarella.jpg"))),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      // height: 140,
                      // width: 350,
                      child: ListTile(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Mozarella",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text("Food"),
                            Text(
                              "Ksh. 400",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff9b96d6)),
                            ),
                            Container(
                              height: 30,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (qty > 1) {
                                            qty -= 1;
                                          }
                                        });
                                      },
                                      child: Container(
                                          width: 30,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius:
                                              BorderRadius.circular(20)),
                                          child: Padding(
                                            padding:
                                            const EdgeInsets.all(1.0),
                                            child: Center(child: Icon(Icons.remove)),
                                          ))),
                                  Text(
                                    "$qty",
                                    style: DetailsScreen.myTextStyle,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          qty += 1;
                                        });
                                      },
                                      child: Container(
                                          width: 30,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius:
                                              BorderRadius.circular(20)),
                                          child: Padding(
                                            padding:
                                            const EdgeInsets.all(1.0),
                                            child: Center(child: Icon(Icons.add)),
                                          ))),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.infinity,
                              height: 40,
                              child: RaisedButton(
                                color: Colors.blue,
                                splashColor: Colors.blueGrey,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                onPressed: () {},
                                child: Text(
                                  "Checkout",
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Checkout",style: TextStyle(fontSize: 28),),
                  _buildSingleProduct()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
