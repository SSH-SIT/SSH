import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './login_screen.dart';

import 'package:provider/provider.dart';
import '../providers/auth.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  static const routeName = '/signup';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<Auth>(context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Theme(
            data: Theme.of(context).copyWith(
              primaryColor: Color(0xFFFEC10E),
            ),
            child: Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/SignUpWallpaper.png'))),
              child: SingleChildScrollView(
                child: Container(
                  child: Padding(
                      padding: EdgeInsets.all(36),
                      child: Column(
                        children: [
                          Text('Be our member!',
                              style: GoogleFonts.montserrat().copyWith(
                                  fontSize: 36, fontWeight: FontWeight.bold)),
                          SizedBox(height: 10.0),
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, LoginPage.routeName);
                              },
                              child: Text('Already have account? Sign In Here.',
                                  style: GoogleFonts.montserrat().copyWith(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold))),
                          SizedBox(height: 45.0),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Name',
                                  style: GoogleFonts.montserrat().copyWith(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold))),
                          SizedBox(height: 15.0),
                          TextField(
                            obscureText: false,
                            style: GoogleFonts.montserrat().copyWith(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                            decoration: InputDecoration(
                                fillColor: Color(0xffF6D796),
                                filled: true,
                                hintText: 'First Name',
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide:
                                        BorderSide(color: Color(0xffFEC10E)))),
                            controller: _firstNameController,
                          ),
                          SizedBox(height: 15.0),
                          TextField(
                            obscureText: false,
                            style: GoogleFonts.montserrat().copyWith(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                            decoration: InputDecoration(
                                fillColor: Color(0xffF6D796),
                                filled: true,
                                hintText: 'Last Name',
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide:
                                        BorderSide(color: Color(0xffFEC10E)))),
                            controller: _lastNameController,
                          ),
                          SizedBox(height: 15.0),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Email',
                                  style: GoogleFonts.montserrat().copyWith(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold))),
                          SizedBox(height: 15.0),
                          TextField(
                            obscureText: false,
                            style: GoogleFonts.montserrat().copyWith(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                            decoration: InputDecoration(
                                fillColor: Color(0xffF6D796),
                                filled: true,
                                hintText: 'Email',
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide:
                                        BorderSide(color: Color(0xffFEC10E)))),
                            controller: _emailController,
                          ),
                          SizedBox(height: 15.0),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Password',
                                  style: GoogleFonts.montserrat().copyWith(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold))),
                          SizedBox(height: 15.0),
                          TextField(
                            obscureText: true,
                            style: GoogleFonts.montserrat().copyWith(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                            decoration: InputDecoration(
                                fillColor: Color(0xffF6D796),
                                filled: true,
                                hintText: 'Password',
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide:
                                        BorderSide(color: Color(0xffFEC10E)))),
                            controller: _passwordController,
                          ),
                          SizedBox(height: 15.0),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Phone Number',
                                  style: GoogleFonts.montserrat().copyWith(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold))),
                          SizedBox(height: 15.0),
                          TextField(
                              obscureText: false,
                              style: GoogleFonts.montserrat().copyWith(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                              decoration: InputDecoration(
                                  fillColor: Color(0xffF6D796),
                                  filled: true,
                                  hintText: 'Phone Number',
                                  contentPadding: EdgeInsets.fromLTRB(
                                      20.0, 15.0, 20.0, 15.0),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(
                                          color: Color(0xffFEC10E)))),
                              controller: _phoneNumberController),
                          SizedBox(height: 30),
                          ConstrainedBox(
                              constraints: BoxConstraints.tightFor(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6),
                              child: ElevatedButton(
                                onPressed: () {
                                  auth
                                      .signup(
                                          _firstNameController.text.toString(),
                                          _lastNameController.text.toString(),
                                          _emailController.text.toString(),
                                          _phoneNumberController.text
                                              .toString(),
                                          _passwordController.text.toString())
                                      .then((_) =>
                                          Navigator.pushReplacementNamed(
                                              context, LoginPage.routeName));
                                },
                                style: ElevatedButton.styleFrom(
                                    elevation: 8,
                                    primary: Color(0xFFFEC10E),
                                    padding: EdgeInsets.all(12),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(24))),
                                child: Text('Sign Up',
                                    style: GoogleFonts.montserrat().copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                              ))
                        ],
                      )),
                ),
              ),
            )));
  }
}
