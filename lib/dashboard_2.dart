import 'package:flutter/material.dart';
import 'package:vote_io_frontend/blockchain/blockchainSetup.dart';
import 'package:vote_io_frontend/results.dart';
import 'package:vote_io_frontend/votePage.dart';

class Dashboard2 extends StatefulWidget {
  const Dashboard2({Key? key}) : super(key: key);

  @override
  State<Dashboard2> createState() => _Dashboard2State();
}

class _Dashboard2State extends State<Dashboard2> {
  // List<Map> createdPolls = [
  //   {'title': 'Election1', 'date': 'date', 'time_left': 'time'},
  //   {'title': 'Election1', 'date': 'date', 'time_left': 'time'},
  //   {'title': 'Election1', 'date': 'date', 'time_left': 'time'},
  // ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(45, 45, 46, 1),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'VoteHub',
              style: TextStyle(
                color: Color.fromRGBO(73, 132, 224, 1),
              ),
            ),
            TextButton(
              child: Icon(
                Icons.account_circle_rounded,
                size: 35,
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'accountInfo');
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.black54,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Text(
                    '   Dashboard',
                    style: TextStyle(
                        color: Color.fromRGBO(231, 231, 231, 1),
                        fontSize: 22,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 0, 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(27, 27, 27, 1),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      TextButton(
                        child: Text(
                          'Upcoming ',
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 16,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w400),
                        ),
                        onPressed: () {
                          // Navigator.pushReplacementNamed(context, 'dashboard1');
                        },
                      ),
                      Icon(
                        Icons.arrow_downward_rounded,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 10, 0, 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // color: Color.fromRGBO(27, 27, 27, 1),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromRGBO(80, 80, 80, 1)),
                              child: TextButton(
                                child: Text(
                                  'Created ',
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontSize: 16,
                                      fontFamily: 'poppins',
                                      fontWeight: FontWeight.w400),
                                ),
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, 'dashboard1');
                                },
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromRGBO(27, 27, 27, 1)),
                              child: TextButton(
                                child: Text(
                                  'Joined ',
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontSize: 16,
                                      fontFamily: 'poppins',
                                      fontWeight: FontWeight.w400),
                                ),
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, 'dashboard2');
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: FutureBuilder(
                  future: getJoinedPolls(BigInt.from(123)),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return Container(
                        child: ListView.builder(
                            itemCount: snapshot.data[0].length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 10, 10, 10),
                                child: GestureDetector(
                                  onTap: () {
                                    print(snapshot.data[0][index][0]);
                                    if (DateTime.now()
                                                .toUtc()
                                                .millisecondsSinceEpoch >
                                            snapshot.data[0][index][0][4]
                                                .toInt() &&
                                        DateTime.now()
                                                .toUtc()
                                                .millisecondsSinceEpoch <
                                            snapshot.data[0][index][0][5]
                                                .toInt()) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => VotePage(
                                                  candidates: snapshot.data[0]
                                                      [index][0][3],
                                                  pollId: snapshot.data[0]
                                                          [index][0][0]
                                                      .toInt(),
                                                  votingRange: [
                                                    snapshot.data[0][index][0]
                                                        [4],
                                                    snapshot.data[0][index][0]
                                                        [5]
                                                  ],
                                                )),
                                      );
                                    } else if (DateTime.now()
                                            .toUtc()
                                            .millisecondsSinceEpoch <
                                        snapshot.data[0][index][0][4].toInt()) {
                                      const snackBar = SnackBar(
                                        content: Text(
                                            'The poll has not started yet!!'),
                                        backgroundColor: Colors.red,
                                      );

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    } else {
                                      String winnerName = '';
                                      String winnerId = '';
                                      BigInt maxNumberOfVotes = BigInt.from(0);
                                      for (List x in snapshot.data[0][index][0]
                                          [3]) {
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
                                    }
                                  },
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                                    width: 300 + 100 - 50,
                                    height: 54,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color.fromRGBO(43, 43, 43, 1)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          '${snapshot.data[0][index][0][1]}',
                                          style: TextStyle(
                                            color: Color.fromRGBO(
                                                170, 170, 170, 1),
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'poppins',
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          '${snapshot.data[0][index][0][4]}',
                                          style: TextStyle(
                                            color: Color.fromRGBO(
                                                170, 170, 170, 1),
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'poppins',
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          '${snapshot.data[0][index][0][5]}',
                                          style: TextStyle(
                                            color: Color.fromRGBO(
                                                170, 170, 170, 1),
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'poppins',
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      );
                    }
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300 + 100 - 50,
                  height: 54,
                  padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
                  child: TextButton(
                    child: Text(
                      'Join a Poll',
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 20,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'joinPoll');
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
