import 'package:flutter/material.dart';
import 'package:vote_io_frontend/addCandidate.dart';
import 'package:vote_io_frontend/createdPollDone.dart';
import 'package:vote_io_frontend/login.dart';
import 'package:vote_io_frontend/register.dart';
import 'package:vote_io_frontend/resultsDeclaration.dart';
import 'package:vote_io_frontend/userAccInfo.dart';

import 'blockchain/blockchainSetup.dart';

void main() async {
  runApp(
    MaterialApp(
      initialRoute: 'login',
      routes: {
        'login': (context) => Login(),
        'register': (context) => Register(),
        'accountInfo': (context) => UserAccount(),
        'createdPollDone': (context) => CreatedPollDone(),
        'declareResult': (context) => ResultsDeclare(),
        //'otp':(context)=>OTP(phoneNo: '911'),
        'addCandidate': (context) => AddCandidate(
              candidates: [{}, {}],
              number: 0,
            ),
      },
    ),
  );

  await initialBlockChainSetup();
}
