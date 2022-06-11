import 'package:flutter/material.dart';
import 'package:vote_io_frontend/register.dart';
import 'package:vote_io_frontend/regDetails.dart';
import 'package:vote_io_frontend/otp.dart';
import 'package:vote_io_frontend/login.dart';
import 'package:vote_io_frontend/userAccInfo.dart';
import 'package:vote_io_frontend/joinPoll.dart';
import 'package:vote_io_frontend/createPoll.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: 'createPoll',

    routes:{
      'login': (context)=> Login(),
      'register': (context)=> Register(),
      'regDetails': (context)=> RegDetails(),
      'otp':(context)=>OTP(),
      'accountInfo':(context)=>UserAccount(),
      'joinPoll':(context)=>JoinPoll(),
      'createPoll':(context)=>CreatePoll(),
    }
  ));
}
