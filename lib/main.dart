import 'package:flutter/material.dart';
import 'package:vote_io_frontend/register.dart';
import 'package:vote_io_frontend/regDetails.dart';
import 'package:vote_io_frontend/otp.dart';
import 'package:vote_io_frontend/login.dart';
import 'package:vote_io_frontend/dashboard_1.dart';
void main() {
  runApp(MaterialApp(

    initialRoute: 'dashboard1',


    routes:{
      'login': (context)=> Login(),
      'register': (context)=> Register(),
      'regDetails': (context)=> RegDetails(),
      'otp':(context)=>OTP(),
      'dashboard1':(context)=>Dashboard1(),
    }
  ));
}
