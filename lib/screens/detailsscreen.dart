
import 'package:ecommerce/screens/cartscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final String? image;
  final String? name;
  final double? price;
  DetailsScreen({this.name,this.image,this.price}) ;
  static const TextStyle myTextStyle = TextStyle(fontSize: 18);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  Widget _buildSizeProduct({String? name}){
    return Container(
      height: 40,
      width: 40,
      color: Color(0xfff2f2f2),
      child: Center(child: Text(name!,style: DetailsScreen.myTextStyle)),
    );
  }

  Widget _buildColorProduct({Color? color}){
    return Container(
      height: 40,
      width: 40,
      color: color,
    );
  }
  Widget _buildImage(){
    return  Center(
      child: Card(
        elevation: 10,
        child: Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(widget.image!)
              ),
          ),
        ),
      ),
    );
  }
  Widget _buildNameToDescriptionPart(){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(widget.name!,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Ksh. ${widget.price}",style: TextStyle(fontSize: 14),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Description",style: DetailsScreen.myTextStyle,),
        ),
      ],
    );
  }
  Widget _buildDescription(){
    return Container(
      height: 100,
      child: Wrap(
        children: [
          Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text",style: TextStyle(fontSize: 12.0))
        ],
      ),
    );
  }
  Widget _buildSizePart(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Size",style: DetailsScreen.myTextStyle,),
        SizedBox(height: 10,),
        Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildSizeProduct(name:"S"),
              _buildSizeProduct(name:"M"),
              _buildSizeProduct(name:"L"),
              _buildSizeProduct(name:"XL"),
              _buildSizeProduct(name:"XXL"),

            ],
          ),
        ),
      ],
    );
  }
  Widget _buildColorPart(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Color",style: DetailsScreen.myTextStyle,),
        SizedBox(height: 10,),
        Container(
          width: 265,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildColorProduct(color: Colors.green),
              _buildColorProduct(color: Colors.pinkAccent),
              _buildColorProduct(color: Colors.amber),
              _buildColorProduct(color: Colors.blueGrey),
              _buildColorProduct(color: Colors.blue),



            ],
          ),
        ),
      ],
    );
  }
  Widget _buildQuantityPart(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Quantity",style: DetailsScreen.myTextStyle,),
        SizedBox(height: 10,),
        Container(
          height: 40,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              GestureDetector(onTap: (){
                setState(() {
                  if(qty>1){
                    qty-=1;
                  }
                });
              }, child: Container(
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.remove),
                  ))),
              Text("$qty",style: DetailsScreen.myTextStyle,),
              GestureDetector(onTap: (){
                setState(() {
                  qty+=1;
                });
              }, child: Container(
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.add),
                  ))),

            ],
          ),
        ),
      ],
    );
  }
  Widget _buildButtonPart(){
    return Container(
      width: double.infinity,
      height: 60,
      child: RaisedButton(
        color: Colors.blue,
        splashColor: Colors.blueGrey,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>CartScreen(name: widget.name,image: widget.image,price: widget.price,)));
        },
        child: Text("Add to Cart",style: TextStyle(fontSize: 17,color: Colors.white),),
      ),
    );

  }

  late int qty = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details Page"),
        // leading: IconButton(
        //
        //   onPressed: () {}, icon: Icon(Icons.arrow_back_ios),
        // ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               _buildImage(),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      _buildNameToDescriptionPart(),
                      _buildDescription(),
                      _buildSizePart(),
                      SizedBox(height: 10,),
                     _buildColorPart(),
                      SizedBox(height: 10,),
                    _buildQuantityPart(),
                      SizedBox(height: 15,),
                      _buildButtonPart()



                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
