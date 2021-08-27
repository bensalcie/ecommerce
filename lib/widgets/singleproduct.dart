import 'package:ecommerce/screens/detailsscreen.dart';
import 'package:flutter/material.dart';
class SingleProduct extends StatelessWidget {
  final String? image;
  final double? price;
  final String? name;
  const SingleProduct({this.name,this.price,this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>DetailsScreen(name: name,image: "images/$image",price: price,)));
      },
      child: Expanded(
        child: Card(
          child: Container(
            height: 250.0,
            width: 130.0,
            child: Column(
              children: [
                Container(
                  height: 170.0,
                  width: 160.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit:BoxFit.cover,
                          image: AssetImage("images/$image")
                      )),
                ),
                Text(
                  "Ksh $price",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Color(0xff9b96d6)),
                ),
                Text(
                  name!,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
