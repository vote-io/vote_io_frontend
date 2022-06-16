import 'package:flutter/material.dart';
import 'package:vote_io_frontend/DialogBox.dart';
import 'package:vote_io_frontend/addCandidate.dart';
import 'package:vote_io_frontend/blockchain/blockchainSetup.dart';

class pollStep2 extends StatefulWidget {
  const pollStep2(
      {Key? key,
      required this.pollName,
      required this.desc,
      required this.startDate,
      required this.endDate,
      required this.phoneNo})
      : super(key: key);

  final String pollName;
  final String desc;
  final int startDate;
  final int endDate;
  final int phoneNo;

  @override
  State<pollStep2> createState() => _pollStep2State();
}

class _pollStep2State extends State<pollStep2> {
  int cCount = 0;

  List<dynamic> candidate = [];

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(45, 45, 46, 1),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'VoteHub',
              style: TextStyle(
                color: Color.fromRGBO(73, 132, 224, 1),
              ),
            ),
            TextButton(
              child: const Icon(
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
                children: const [
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
                        color: const Color.fromRGBO(38, 38, 38, 1),
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
                                                  image: NetworkImage(
                                                      '${candidate[index][4]}'))),
                                        ),
                                        const SizedBox(
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
                                          '${candidate[index][1]}',
                                          style: const TextStyle(
                                              fontFamily: 'montserrat',
                                              fontWeight: FontWeight.w700,
                                              fontSize: 20,
                                              color: Color.fromRGBO(
                                                  251, 251, 251, 1)),
                                        ),

                                        const SizedBox(
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
                                          '${candidate[index][0].toInt() + 1}',
                                          style: const TextStyle(
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
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(22, 86, 185, 1)),
                    child: TextButton(
                      child: const Text(
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
                                    number: cCount,
                                  )),
                        ).then((_) {
                          print(candidate);
                          setState(() {
                            if (candidate.length != cCount) {
                              cCount += 1;
                            }
                            candidate = candidate;
                          });
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 350,
                    height: 54,
                    padding: const EdgeInsets.fromLTRB(40.0, 10, 40, 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(22, 86, 185, 1)),
                    child: TextButton(
                      child: const Text(
                        'Publish poll',
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 20,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () async {
                        dynamic reply = await createPoll(
                            widget.pollName,
                            BigInt.from(widget.phoneNo),
                            candidate,
                            BigInt.from(widget.startDate),
                            BigInt.from(widget.endDate));
                        print(reply);

                        navigator.push(
                          MaterialPageRoute(
                            builder: (context) => DialogBox(
                              phoneNo: widget.phoneNo,
                              title: 'Successful',
                              content: 'You have successfully created a poll',
                            ),
                          ),
                        );
                      },
                    ),
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
