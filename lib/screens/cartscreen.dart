import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'detailsscreen.dart';

class CartScreen extends StatefulWidget {
  final String? name;
  final double? price;
  final String? image;
  CartScreen({this.name,this.price,this.image});
  // const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

late int qty = 1;

class _CartScreenState extends State<CartScreen> {
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
                              image: AssetImage(widget.image!))),
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
                              widget.name!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text("Food"),
                            Text(
                              "Ksh. ${widget.price}",
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
      bottomNavigationBar: Container(
        height: 55,
        width: double.infinity,
        child: RaisedButton(
          color: Colors.blue[300],
          textColor: Colors.white,
          onPressed: (){},
          child: Container(child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Continue",style: DetailsScreen.myTextStyle,),
              Icon(Icons.arrow_forward_rounded)
            ],
          )),
        ),

      ),
      appBar: AppBar(
        title: Text("My Cart"),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none))
        ],
      ),
      body: ListView(
        children: [
          _buildSingleProduct(),
          _buildSingleProduct(),
          _buildSingleProduct(),
          _buildSingleProduct(),
          _buildSingleProduct(),


        ],
      ),
    );
  }
}
