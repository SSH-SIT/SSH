import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:google_fonts/google_fonts.dart';

// import '../providers/auth.dart';

import '../models/http_exception.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final userNameField = TextField(
      obscureText: false,
      style: GoogleFonts.montserrat().copyWith(
          color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 20),
      decoration: InputDecoration(
          fillColor: Color(0xffF6D796),
          filled: true,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Username",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(color: Color(0xffFEC10E)))),
    );
    final passwordField = TextField(
      obscureText: true,
      style: GoogleFonts.montserrat().copyWith(
          color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 20),
      decoration: InputDecoration(
          fillColor: Color(0xffF6D796),
          filled: true,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xffF6D796),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {},
        child: Text("Login",
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat().copyWith(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
      ),
    );

    return Scaffold(
        body: Center(
            child: Container(
                constraints: BoxConstraints.expand(),
                decoration:
                    BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/LoginWallpaper.jpg'))),
                child: Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 155.0,
                          child: Image.asset(
                            "assets/logo.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(height: 45.0),
                        userNameField,
                        SizedBox(height: 25.0),
                        passwordField,
                        SizedBox(height: 25.0),
                        RichText(
                            text: TextSpan(
                                text: 'forgot password?',
                                style: GoogleFonts.montserrat().copyWith(
                                    color: Colors.black,
                                    fontSize: 15,
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print('Forget Password Ka');
                                  })),
                        SizedBox(
                          height: 35.0,
                        ),
                        loginButon,
                        SizedBox(
                          height: 15.0,
                        ),
                      ],
                    )))));
  }
}
