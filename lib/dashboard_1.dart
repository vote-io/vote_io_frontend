import 'package:flutter/material.dart';
import 'package:vote_io_frontend/blockchain/blockchainSetup.dart';

import 'adminPoll.dart';

class Dashboard1 extends StatefulWidget {
  const Dashboard1({Key? key}) : super(key: key);

  @override
  State<Dashboard1> createState() => _Dashboard1State();
}

class _Dashboard1State extends State<Dashboard1> {
  // List<Map> createdPolls2 = [
  //   {'title': 'Election1', 'date': 'date', 'time_left': 'time'},
  //   {'title': 'Election1', 'date': 'date', 'time_left': 'time'},
  //   {'title': 'Election1', 'date': 'date', 'time_left': 'time'},
  // ];

  List createdPolls = [
    [
      0,
      "poll 1",
      123,
      [
        [
          0,
          "some cand",
          "I’ m wht",
          0,
          "https://www.icmetl.org/wp-content/uploads/2020/11/user-icon-human-person-sign-vector-10206693.png"
        ]
      ],
      200,
      400,
      0
    ],
    [
      1,
      "poll 2",
      123,
      [
        [
          0,
          "some name",
          "desc",
          0,
          "https://storage.googleapis.com/download/storage/v1/b/fishing-backend.appspot.com/o/candidatePics%2Fa7806aa6-22cc-4593-a7a6-b47546fc028f.octet-stream?generation=1655210590561018&alt=media"
        ],
        [
          1,
          "candidate 2",
          "some desc",
          0,
          "https://www.icmetl.org/wp-content/uploads/2020/11/user-icon-human-person-sign-vector-10206693.png"
        ]
      ],
      200,
      400,
      0
    ]
  ];

  dynamic getCPolls() async {
    return getCreatedPolls(BigInt.from(123));
  }

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
        color: Colors.black87,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 10,),
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
                          Navigator.pushReplacementNamed(context, 'dashboard1');
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
                                  color: Color.fromRGBO(27, 27, 27, 1)),
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
                                  color: Color.fromRGBO(80, 80, 80, 1)),
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
                  future: getCreatedPolls(BigInt.from(12345)),
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
                                    print(snapshot.data[0][index][4]);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AdminPoll(
                                                candidates: snapshot.data[0]
                                                    [index][3],
                                                startTime: snapshot.data[0]
                                                    [index][4],
                                                endTime: snapshot.data[0][index]
                                                    [5],
                                              )),
                                    );
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
                                          '${snapshot.data[0][index][1]}',
                                          style: TextStyle(
                                            color: Color.fromRGBO(
                                                170, 170, 170, 1),
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'poppins',
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          '${DateTime.fromMillisecondsSinceEpoch(snapshot.data[0][index][4].toInt()).toString().substring(0, 10)}',
                                          style: TextStyle(
                                            color: Color.fromRGBO(
                                                170, 170, 170, 1),
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'poppins',
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          '${DateTime.fromMillisecondsSinceEpoch(snapshot.data[0][index][5].toInt()).toString().substring(0, 10)}',
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
                      'Create a new Poll',
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 20,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'createPoll');
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
