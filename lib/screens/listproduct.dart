import 'package:ecommerce/screens/homepage.dart';
import 'package:ecommerce/widgets/singleproduct.dart';
import 'package:flutter/material.dart';

class ListProduct extends StatelessWidget {
  final String? name;
  const ListProduct({this.name});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>HomePage()));

          },
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none)),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            name!,
                            style: TextStyle(
                                fontSize: 17.0, fontWeight: FontWeight.bold),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 1000,
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 100.0),
                  child: GridView.count(
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.6,
                    crossAxisCount: 2,
                    children: [
                      SingleProduct(
                          name: "Bread Barrel",
                          price: 90.0,
                          image: "breadbarrel.jpg"),
                      SingleProduct(
                          name: "Caesar",
                          price: 500.0,
                          image: "caesar.jpg"),
                      SingleProduct(
                          name: "Cake",
                          price: 90.0,
                          image: "cake.jpg"),
                      SingleProduct(
                          name: "Pant",
                          price: 500.0,
                          image: "pant.png"),
                      SingleProduct(
                          name: "Shirt",
                          price: 90.0,
                          image: "shirt.png"),
                      SingleProduct(
                          name: "Spinach Salad",
                          price: 500.0,
                          image: "spinachsalad.jpg"),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
