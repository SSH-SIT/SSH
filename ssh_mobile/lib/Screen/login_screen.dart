import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:ssh_mobile/screen/product.dart';
import './signup_screen.dart';
import '../providers/auth.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  static const routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String statusText = '';

  void setStatus(int status) {
    setState(() {
      statusText =
          status == 1 ? 'Log In Success.' : 'Email or Password is incorrect.';
    });
  }

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<Auth>(context);

    final userNameField = TextField(
      obscureText: false,
      style: GoogleFonts.montserrat().copyWith(
          color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 20),
      decoration: InputDecoration(
          fillColor: Color(0xffF6D796),
          filled: true,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(color: Color(0xffFEC10E)))),
      controller: _emailController,
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
      controller: _passwordController,
    );

    final loginButton = ConstrainedBox(
        constraints: BoxConstraints.tightFor(
            width: MediaQuery.of(context).size.width * 0.3),
        child: ElevatedButton(
          onPressed: () {
            auth
                .login(_emailController.text.toString(),
                    _passwordController.text.toString())
                .then((status) {
              if (status == true) {
                Navigator.pushReplacementNamed(context, ProductPage.routeName);
                setStatus(1);
              } else
                setStatus(0);
            });
          },
          style: ElevatedButton.styleFrom(
              elevation: 8,
              primary: Color(0xffF6D796),
              padding: EdgeInsets.all(12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32))),
          child: Text('Login',
              style: GoogleFonts.montserrat().copyWith(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
        ));
    final signupButton = ConstrainedBox(
        constraints: BoxConstraints.tightFor(
            width: MediaQuery.of(context).size.width * 0.3),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, SignUp.routeName);
          },
          style: ElevatedButton.styleFrom(
              elevation: 8,
              primary: Color(0xffF6D796),
              padding: EdgeInsets.all(12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32))),
          child: Text('Sign Up',
              style: GoogleFonts.montserrat().copyWith(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
        ));

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/LoginWallpaper.jpg'))),
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(36),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 155.0,
                          child: Image.asset(
                            "assets/images/SSHicon.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(height: 45.0),
                        userNameField,
                        SizedBox(height: 25.0),
                        passwordField,
                        SizedBox(height: 15),
                        Text(
                          statusText,
                          style: GoogleFonts.montserrat(
                              fontSize: 15, color: Colors.red),
                        ),
                        SizedBox(height: 25.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [loginButton, signupButton],
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                      ],
                    )))));
  }
}
