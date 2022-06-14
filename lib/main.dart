import 'package:flutter/material.dart';
import 'package:vote_io_frontend/DialogBox.dart';
import 'package:vote_io_frontend/addCandidate.dart';
import 'package:vote_io_frontend/createPoll.dart';
import 'package:vote_io_frontend/createdPollDone.dart';
import 'package:vote_io_frontend/dashboard_1.dart';
import 'package:vote_io_frontend/dashboard_2.dart';
import 'package:vote_io_frontend/joinPoll.dart';
import 'package:vote_io_frontend/login.dart';
import 'package:vote_io_frontend/register.dart';
import 'package:vote_io_frontend/resultsDeclaration.dart';
import 'package:vote_io_frontend/userAccInfo.dart';

import 'blockchain/blockchainSetup.dart';

void main() async {
  runApp(
    MaterialApp(
      initialRoute: 'dashboard1',
      routes: {
        'login': (context) => Login(),
        'register': (context) => Register(),
        'accountInfo': (context) => UserAccount(),
        'joinPoll': (context) => JoinPoll(),
        'createPoll': (context) => CreatePoll(),
        'createdPollDone': (context) => CreatedPollDone(),
        'declareResult': (context) => ResultsDeclare(),
        // 'votePoll': (context) => VotePage(),
        'dashboard1': (context) => Dashboard1(),
        'dashboard2': (context) => Dashboard2(),
        //'otp':(context)=>OTP(phoneNo: '911'),
        // 'candidate_card': (context) => CandidateCard(),
        'dialogBox': (context) => DialogBox(),
        // 'results': (context) => Results(),
        // 'adminPoll': (context) => AdminPoll(),
        'addCandidate': (context) => AddCandidate(
              candidates: [{}, {}],
              number: 0,
            ),
      },
    ),
  );

  await initialBlockChainSetup();
}
