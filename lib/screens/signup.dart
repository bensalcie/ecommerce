import 'package:ecommerce/screens/login.dart';
import 'package:ecommerce/widgets/changesreen.dart';
import 'package:ecommerce/widgets/mybutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUp extends StatefulWidget {
  // const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

final GlobalKey<FormState> _Formkey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
RegExp pregExp = new RegExp(pattern);
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp eregExp = new RegExp(p);
bool obscureText = true;
String email = "";
String username = "";
String phone = "";
String password = "";

class _SignUpState extends State<SignUp> {
  void validation() async {
    final FormState? _form = _Formkey.currentState;
    if (!_form!.validate()) {
      try {
        AuthResult result = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        print("User Id" + result.user.uid);
      } on PlatformException catch (e) {
        _scaffoldKey.currentState!.showSnackBar(SnackBar(
          content: Text(e.message.toString()),
        ));
        print(e.message.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _Formkey,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 50.0,
                      ),
                      Text(
                        "Register",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 400,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  username = value;
                                });
                              },
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value!.length < 6) {
                                  return "Username is too short";
                                } else if (value.isEmpty) {
                                  return "Please enter username";
                                }
                                return "";
                              },
                              decoration: InputDecoration(
                                  hintText: "Username",
                                  hintStyle: TextStyle(color: Colors.black)),
                            ),
                            TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  email = value;
                                });
                              },
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == "") {
                                  return "Please enter Email";
                                } else if (!eregExp.hasMatch(value!)) {
                                  return "Email is invalid";
                                }
                                return "";
                              },
                              decoration: InputDecoration(
                                  hintText: "Email",
                                  hintStyle: TextStyle(color: Colors.black)),
                            ),
                            TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  password = value;
                                });
                              },
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: obscureText,
                              validator: (value) {
                                if (value!.length < 8) {
                                  return "Password is too short";
                                } else if (value.isEmpty) {
                                  return "Please enter Password";
                                }
                                return "";
                              },
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        obscureText = !obscureText;
                                      });
                                      FocusScope.of(context).unfocus();
                                    },
                                    child: Icon(
                                      obscureText == true
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintStyle: TextStyle(color: Colors.black)),
                            ),
                            TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  phone = value;
                                });
                              },
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value!.length < 10) {
                                  return "Phone number is too short";
                                } else if (value.isEmpty) {
                                  return "Please enter Phone Number";
                                } else if (!pregExp.hasMatch(value)) {
                                  return "Enter a valid Phone number";
                                }
                                return "";
                              },
                              decoration: InputDecoration(
                                  hintText: "Phone Number",
                                  hintStyle: TextStyle(color: Colors.black)),
                            ),
                            Container(
                                height: 45.0,
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    validation();
                                  },
                                  child: Text("Sign Up"),
                                ))
                            // MyButton( onPressed:(){
                            //   validation();
                            // },name: "Sign Up",),

                            ,
                            Container(
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Text("I have an Account already !"),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  GestureDetector(
                                    child: Text(
                                      "Sign In",
                                      style: TextStyle(
                                          fontSize: 20.0, color: Colors.blue),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (ctx) => Login()));
                                    },
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
