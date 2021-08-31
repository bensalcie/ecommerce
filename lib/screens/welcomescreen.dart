import 'package:ecommerce/screens/login.dart';
import 'package:ecommerce/screens/signup.dart';
import 'package:flutter/material.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F7F7),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 370,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("images/shopping.png")
                  )
                ),
              ),
              Text("Welcome",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.blue[300]),),
              Container(
                height:60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Ready to start Shopping, signup now",style: TextStyle(fontSize: 18,)),
                    Text("To Get Started",style: TextStyle(fontSize: 18,)),

                  ],
                ),
              ),
              Container(
                height: 50,
                margin: EdgeInsets.fromLTRB(45, 15, 45, 15),
                width: double.infinity,
                child: RaisedButton(
                  color: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (ctx)=>SignUp()));

                  },
                  child: Text("Sign Up",style: TextStyle(fontSize: 18,color: Colors.white)),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 15, 20, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Already have an Account?  ",style: TextStyle(fontSize: 15,)),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (ctx)=>Login()));
                      },
                      child: Text("Sign In",style: TextStyle(fontSize: 18,color: Colors.blue)),
                    )
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
