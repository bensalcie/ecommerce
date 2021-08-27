import 'package:ecommerce/screens/signup.dart';
import 'package:ecommerce/widgets/changesreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp eregExp = new RegExp(p);
bool obscure = true;
String email = "";
String password = "";


Future<void> validation() async {
  final FormState? state = _formKey.currentState;
  if (!state!.validate()) {
    try {
      AuthResult result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      _scaffoldKey.currentState!.showSnackBar(SnackBar(
        backgroundColor: Colors.blueGrey,
        content: Text("Signed in Successfully: \nUser:"+result.user.email,style: TextStyle(color: Colors.green),),
      ));    } on PlatformException catch (e) {
      _scaffoldKey.currentState!.showSnackBar(SnackBar(
        content: Text(e.message.toString()),
      ));
      print(e.message.toString());
    }
  } else {
    print("Noo");
  }
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 350,
                width: double.infinity,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 50.0, fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        onChanged: (value){
                          setState(() {
                            email = value;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter a  email";
                          } else if (!eregExp.hasMatch(value)) {
                            return "Please enter a valid email";
                          }
                          return "";
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: "Email", border: OutlineInputBorder()),
                      ),
                      TextFormField(
                        onChanged: (value){
                          setState(() {
                            password =value;
                          });
                        },
                        obscureText: obscure,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value == "") {
                            return "Please enter a valid Password";
                          } else if (value!.length < 8) {
                            return "Password is too short";
                          }
                          return "";
                        },
                        decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  FocusScope.of(context).unfocus();
                                  obscure = !obscure;
                                });
                              },
                              child: obscure == true
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off),
                            ),
                            hintText: "Password",
                            border: OutlineInputBorder()),
                      ),
                      Container(
                          height: 45.0,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              validation();
                            },
                            child: Text("Sign In"),
                          ))
                      //  MyButton(onPressed: (){
                      //   validation();
                      // },name: "Login",),

                      ,
                      Row(
                        children: [
                          Text("Do not have an Account?"),
                          SizedBox(
                            width: 15,
                          ),
                          GestureDetector(
                            child: Text(
                              "Sign Up",
                              style:
                                  TextStyle(fontSize: 20.0, color: Colors.blue),
                            ),
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (ctx) => SignUp()));
                            },
                          )
                        ],
                      )
                    ]),

                //button
                //change screen
              )
            ],
          ),
        ),
      ),
    );
  }
}
