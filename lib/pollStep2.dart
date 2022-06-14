import 'package:flutter/material.dart';
import 'package:vote_io_frontend/addCandidate.dart';

class pollStep2 extends StatefulWidget {
  const pollStep2(
      {Key? key,
      required this.pollName,
      required this.desc,
      required this.date})
      : super(key: key);

  final String pollName;
  final String desc;
  final DateTime date;

  @override
  State<pollStep2> createState() => _pollStep2State();
}

class _pollStep2State extends State<pollStep2> {
  List<Map> createdPolls = [
    {'title': 'Election1', 'date': 'date', 'time_left': 'time'},
    {'title': 'Election1', 'date': 'date', 'time_left': 'time'},
    {'title': 'Election1', 'date': 'date', 'time_left': 'time'},
  ];

  List<Map> candidate = [
    {
      'id': 1,
      'name': 'AAA',
      'description': 'This is candidate 1',
      'picture': 'assets/red.png'
    },
    {
      'id': 2,
      'name': 'BBB',
      'description': 'This is candidate 2',
      'picture': 'assets/blue.png'
    },
    {
      'id': 3,
      'name': 'CCC',
      'description': 'This is candidate 3',
      'picture': 'assets/green.png'
    },
    {
      'id': 1,
      'name': 'AAA',
      'description': 'This is candidate 1',
      'picture': 'assets/red.png'
    },
    {
      'id': 2,
      'name': 'BBB',
      'description': 'This is candidate 2',
      'picture': 'assets/blue.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    print(widget.pollName);
    print(widget.desc);
    print(widget.date);

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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: Text(
                      'Add candidates',
                      style: TextStyle(
                          color: Color.fromRGBO(231, 231, 231, 1),
                          fontSize: 22,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 25 + 5,
                                          width: 25 + 5,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      '${candidate[index]['picture']}'))),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${candidate[index]['name']}',
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '${candidate[index]['id']}',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 350,
                    height: 54,
                    padding: const EdgeInsets.fromLTRB(40.0, 10, 40, 0),
                    child: TextButton(
                      child: Text(
                        'Add a new candidate',
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 20,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddCandidate(
                                    candidates: candidate,
                                  )),
                        ).then((_) {
                          print(candidate);
                        });
                      },
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(22, 86, 185, 1)),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 350,
                    height: 54,
                    padding: const EdgeInsets.fromLTRB(40.0, 10, 40, 0),
                    child: TextButton(
                      child: Text(
                        'Publish poll',
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 20,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'dialogBox',
                            arguments: {
                              'title': 'Successful',
                              'content': 'You have successfully created a poll'
                            });
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
      ),
    ));
  }
}
