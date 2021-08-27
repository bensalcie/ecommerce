import 'package:carousel_pro/carousel_pro.dart';
import 'package:ecommerce/screens/listproduct.dart';
import 'package:ecommerce/widgets/singleproduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  // const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _buildCategoryProduct({String? image, String? title, int? color}) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            maxRadius: 25,
            backgroundColor: Color(color!),
            child: Container(
              height: 40.0,
              child: Image(
                image: AssetImage("images/$image"),
              ),
            ),
            // backgroundImage: AssetImage(),
          ),
          // Text(title!),
        ],
      ),
    );
  }
  Widget _buildMyDrawer(){
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 70, 0),
      child: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                maxRadius: 45,
                backgroundImage: AssetImage("images/profile.jfif"),
              ),
              // decoration: BoxDecoration(
              //   color: Colors.blueGrey
              // ),
              accountName: Text("Ben Salcie"),
              accountEmail: Text("bensalcie@gmail.com"),
            ),
            ListTile(
              selected: homeColor,
              onTap: (){
                setState(() {
                  homeColor= true;
                  cartColor = false;
                  contactColor = false;
                  aboutColor= false;
                  logoutColor = false;
                });
              },
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            ListTile(
              selected: cartColor,
              onTap: (){
                setState(() {
                  homeColor = false;
                  contactColor = false;
                  aboutColor= false;
                  logoutColor = false;
                  cartColor= true;
                });
              },
              leading: Icon(Icons.shopping_cart),
              title: Text("Cart"),

            ),
            ListTile(
              selected: contactColor,
              onTap: (){
                setState(() {
                  cartColor = false;
                  homeColor = false;
                  aboutColor= false;
                  logoutColor = false;
                  contactColor = true;
                });
              },
              leading: Icon(Icons.phone),
              title: Text("Contact Us"),
            ),
            ListTile(
              selected: aboutColor,
              onTap: (){
                setState(() {
                  cartColor = false;
                  contactColor = false;
                  homeColor= false;
                  logoutColor = false;
                  aboutColor = true;
                });
              },
              leading: Icon(Icons.info),
              title: Text("About"),
            ),
            ListTile(
              onTap: (){

              },
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
            )
          ],
        ),
      ),
    );
  }
  Widget _buildImageSlider(){
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      height: 200.0,
      width: double.infinity,
      child: Carousel(
        dotColor: Colors.white,
        autoplay: true,
        borderRadius: true,
        radius: Radius.circular(10),
        // dotBgColor: Colors.pinkAccent,
        // dotIncreaseSize: 10,
        dotIncreasedColor: Colors.blue,
        images: [
          AssetImage("images/spinachsalad.jpg"),
          AssetImage("images/tuscangrilled.jpg"),
          AssetImage("images/lobsterroll.jpg"),
        ],
      ),
    );
  }
  Widget _buidlCategories(){
    return Column(
      children: [
        Container(
          height: 70.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style: TextStyle(
                    fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Text(
                "View More",
                style: TextStyle(
                    fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCategoryProduct(
                  image: "shirt.png",
                  title: "Fruits",
                  color: 0xff33dcfd),
              _buildCategoryProduct(
                  image: "dress.png",
                  title: "Foods",
                  color: 0xfff38cdd),
              _buildCategoryProduct(
                  image: "shoes.png",
                  title: "Snacks",
                  color: 0xff4ff2af),
              _buildCategoryProduct(
                  image: "pant.png",
                  title: "Pants",
                  color: 0xff74acf7),
              _buildCategoryProduct(
                  image: "tie.png",
                  title: "Tie",
                  color: 0xfffc6c8d)
            ],
          ),
        ),
      ],
    );
  }
  Widget _buildFeature(){
    return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                    "Featured",
                    style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (ctx) =>
                                  ListProduct(name: "Featured")));
                    },
                    child: Text("View More",
                        style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),
        ),
        Row(
          children: [
            SingleProduct(
                name: "Spinach Salad",
                price: 340.0,
                image: "spinachsalad.jpg"),
            SingleProduct(
                name: "Muzzarella",
                price: 3400.0,
                image: "mozzarella.jpg")
          ],
        ),
      ],
    );
  }
  Widget _buildNewArchives(){
    return        Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "New Archives",
              style: TextStyle(
                  fontSize: 17.0, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (ctx) =>
                            ListProduct(name: "New Archives")));
              },
              child: Text("View All",
                  style: TextStyle(
                      fontSize: 17.0, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            SingleProduct(
                name: "Lobster Roll",
                price: 90.0,
                image: "lobsterroll.jpg"),
            SingleProduct(
                name: "Lobster Bisque",
                price: 500.0,
                image: "lobsterbisque.jpg")
          ],
        ),
      ],
    );
  }

   bool homeColor = true;

   bool cartColor = false;

   bool contactColor = false;

   bool aboutColor = false;

   bool logoutColor = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: _buildMyDrawer(),
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none))
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            Column(
              children: [
                _buildImageSlider(),
                _buidlCategories(),
                _buildFeature(),
                _buildNewArchives(),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
