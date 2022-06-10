import 'package:flutter/material.dart';
import 'package:vote_io_frontend/register.dart';
import 'package:vote_io_frontend/regDetails.dart';
import 'package:vote_io_frontend/otp.dart';
import 'package:vote_io_frontend/login.dart';
void main() {
  runApp(MaterialApp(
    initialRoute: 'login',

    routes:{
      'login': (context)=> Login(),
      'register': (context)=> Register(),
      'regDetails': (context)=> RegDetails(),
      'otp':(context)=>OTP(),
    }
  ));
}
