import 'package:flutter/material.dart';
import 'package:vote_io_frontend/blockchain/blockchainSetup.dart';

import 'dashboard_2.dart';

class JoinPoll extends StatefulWidget {
  const JoinPoll({Key? key, required this.phoneNo}) : super(key: key);
  final int phoneNo;

  @override
  State<JoinPoll> createState() => _JoinPollState();
}

class _JoinPollState extends State<JoinPoll> {
  TextEditingController idController = TextEditingController();
  TextEditingController keyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: Colors.black87,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 35,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Spacer(),
                  Image.asset('assets/logo.png'),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Join Poll',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 42,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Enter the Poll ID and Unique Key to join Poll',
                        style: TextStyle(
                          color: Color.fromRGBO(170, 170, 170, 1),
                          fontSize: 18,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 300 + 100 - 50,
                        height: 54,
                        padding: const EdgeInsets.fromLTRB(40.0, 10, 40, 0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromRGBO(43, 43, 43, 1)),
                        child: TextFormField(
                          controller: idController,
                          decoration: const InputDecoration(
                            hintText: 'Poll ID',
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(170, 170, 170, 1)),
                            border: OutlineInputBorder(),
                            fillColor: Color.fromRGBO(43, 43, 43, 1),
                            filled: true,
                            enabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     Container(
                  //       width: 300 + 100 - 50,
                  //       height: 54,
                  //       padding: const EdgeInsets.fromLTRB(40.0, 10, 40, 0),
                  //       child: TextFormField(
                  //         controller: keyController,
                  //         decoration: InputDecoration(
                  //           hintText: 'Unique Key',
                  //           hintStyle: TextStyle(
                  //               color: Color.fromRGBO(170, 170, 170, 1)),
                  //           border: OutlineInputBorder(),
                  //           fillColor: Color.fromRGBO(43, 43, 43, 1),
                  //           filled: true,
                  //           enabledBorder: InputBorder.none,
                  //         ),
                  //       ),
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(10),
                  //           color: Color.fromRGBO(43, 43, 43, 1)),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 300 + 100 - 50,
                        height: 54,
                        padding: const EdgeInsets.fromLTRB(40.0, 10, 40, 0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromRGBO(22, 86, 185, 1)),
                        child: TextButton(
                          child: const Text(
                            'Submit',
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 20,
                                fontFamily: 'poppins',
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () async {
                            BigInt pollId =
                                BigInt.from(int.parse(idController.text));

                            await joinPoll(BigInt.from(widget.phoneNo), pollId);

                            navigator.pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
