import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:your_plan_fitness/NavController.dart';
import 'package:your_plan_fitness/Animation/FadeAnimation.dart';
import 'auth.dart';
import 'QuestionnairePage.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  FirebaseUser user;
  String email, password, confirmPassword;

  void signupClick() {
    if (password == confirmPassword) {
      signUpWithEmail(email, password).then((user) => {
            this.user = user,
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => QuestionnairePage()))
          });
    } else {
      //display a toast that says the passwords don't match
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/girl-barbell-squat.jpg'),
        alignment: Alignment.topCenter,
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 125,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // FadeAnimation(
                //     1,
                //     FractionallySizedBox(
                //       widthFactor: .75,
                //       child: new Image(
                //           image:
                //               AssetImage('assets/images/logo_full_text.png')),
                //     )),
              ],
            ),
          ),
          SizedBox(height: 15),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60))),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(
                          1.3,
                          Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.grey, fontSize: 30),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      FadeAnimation(
                          1.4,
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      // color: Color.fromRGBO(11, 191, 255, .3),
                                      color: Colors.grey,
                                      blurRadius: 5,
                                      offset: Offset(0, 5))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[200]))),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: "Email",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                    onChanged: (input) {
                                      email = input.trim();
                                    },
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[200]))),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: "Password",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                    obscureText: true,
                                    onChanged: (input) {
                                      password = input.trim();
                                    },
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[200]))),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: "Confirm Password",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                    obscureText: true,
                                    onChanged: (input) {
                                      confirmPassword = input.trim();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      FadeAnimation(
                          1.6,
                          Material(
                              child: Ink(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          colors: [
                                            Color(0xFF00BFFF),
                                            Color(0xFF0BD600),
                                            Color(0xFF0BD600)
                                          ])),
                                  child: InkWell(
                                      borderRadius: BorderRadius.circular(50),
                                      onTap: this.signupClick,
                                      child: Container(
                                        height: 50,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 50),
                                        child: Center(
                                          child: Text(
                                            "Login",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ))))),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
