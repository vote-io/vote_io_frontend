import 'package:flutter/material.dart';
import 'package:vote_io_frontend/results.dart';

class AdminPoll extends StatefulWidget {
  const AdminPoll(
      {Key? key,
      required this.candidates,
      required this.startTime,
      required this.endTime})
      : super(key: key);
  final List candidates;
  final BigInt startTime;
  final BigInt endTime;

  @override
  State<AdminPoll> createState() => _AdminPollState();
}

class _AdminPollState extends State<AdminPoll> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    List candidate = widget.candidates;
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.black87,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 35,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Spacer(),
                Image.asset('assets/logo.png'),
                // Text(
                //   'VoteHub',
                //   style: TextStyle(
                //       fontSize: 24,
                //       fontFamily: 'poppins',
                //       fontWeight: FontWeight.w600,
                //       color: Color.fromRGBO(73, 132, 224, 1)),
                // )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Vote now',
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
                    children: [
                      Text(
                        'The candidates for the poll are',
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
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Candidate',
                                  style: TextStyle(
                                      fontFamily: 'montserrat',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Color.fromRGBO(251, 251, 251, 1)),
                                ),
                                Text(
                                  'Picture',
                                  style: TextStyle(
                                      fontFamily: 'montserrat',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Color.fromRGBO(251, 251, 251, 1)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Candidate',
                                  style: TextStyle(
                                      fontFamily: 'montserrat',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Color.fromRGBO(251, 251, 251, 1)),
                                ),
                                Text(
                                  'Name',
                                  style: TextStyle(
                                      fontFamily: 'montserrat',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Color.fromRGBO(251, 251, 251, 1)),
                                ),
                              ],
                            ),
                            // Image.asset('assets/ticket_fill_2.png'),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Candidate',
                              style: TextStyle(
                                  fontFamily: 'montserrat',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: Color.fromRGBO(251, 251, 251, 1)),
                              textAlign: TextAlign.end,
                            ),
                            Text(
                              'ID',
                              style: TextStyle(
                                  fontFamily: 'montserrat',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Color.fromRGBO(251, 251, 251, 1)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: candidate.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                    child: Card(
                      color: Color.fromRGBO(38, 38, 38, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 10,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 25 + 5,
                                        width: 25 + 5,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    '${candidate[index][4]}'))),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${candidate[index][1]}',
                                        style: TextStyle(
                                            fontFamily: 'montserrat',
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20,
                                            color: Color.fromRGBO(
                                                251, 251, 251, 1)),
                                      ),

                                      SizedBox(
                                        height: 20,
                                      ),

                                      // Image.asset('assets/ticket_fill_2.png'),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '${candidate[index][0].toInt() + 1}',
                                        style: TextStyle(
                                            fontFamily: 'montserrat',
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                            color: Color.fromRGBO(
                                                251, 251, 251, 1)),
                                        textAlign: TextAlign.end,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Container(
            //       width: 300 + 100 - 50,
            //       height: 54,
            //       padding: const EdgeInsets.fromLTRB(40.0, 10, 40, 0),
            //       child: TextButton(
            //         child: Text(
            //           'Add a new candidate',
            //           style: TextStyle(
            //               color: Color.fromRGBO(255, 255, 255, 1),
            //               fontSize: 20,
            //               fontFamily: 'poppins',
            //               fontWeight: FontWeight.bold),
            //         ),
            //         onPressed: () {
            //           Navigator.pushReplacementNamed(context, 'addCandidate');
            //         },
            //       ),
            //       decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(10),
            //           color: Color.fromRGBO(22, 86, 185, 1)),
            //     ),
            //   ],
            // ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300 + 100 - 50,
                  height: 54,
                  padding: const EdgeInsets.fromLTRB(40.0, 10, 40, 0),
                  child: TextButton(
                    child: Text(
                      'View Results',
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 20,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      if (DateTime.now().toUtc().millisecondsSinceEpoch >
                          widget.endTime.toInt()) {
                        String winnerName = '';
                        String winnerId = '';
                        BigInt maxNumberOfVotes = BigInt.from(0);
                        for (List x in widget.candidates) {
                          if (x[3] > maxNumberOfVotes) {
                            winnerName = x[1];
                            winnerId = x[0].toString();
                          }
                        }
                        //print(widget.candidates);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Results(
                                    candidateName: winnerName,
                                    candidateId: winnerId,
                                  )),
                        );
                      } else {
                        const snackBar = SnackBar(
                          content: Text('The poll has not ended yet!!'),
                          backgroundColor: Colors.red,
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(22, 86, 185, 1)),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
