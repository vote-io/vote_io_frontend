import 'package:flutter/material.dart';
import 'package:vote_io_frontend/candidateCard.dart';

class VotePage extends StatefulWidget {
  const VotePage(
      {Key? key,
      required this.candidates,
      required this.pollId,
      required this.votingRange,
      required this.phoneNo})
      : super(key: key);
  final List candidates;
  final int pollId;
  final List votingRange;
  final int phoneNo;
  @override
  State<VotePage> createState() => _VotePageState();
}

class _VotePageState extends State<VotePage> {
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
            const SizedBox(
              height: 20,
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
                //
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
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
                    children: const [
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
            const SizedBox(
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
                              children: const [
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
                              children: const [
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
                          children: const [
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
                      color: const Color.fromRGBO(38, 38, 38, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 10,
                      child: GestureDetector(
                        onTap: () {
                          print(candidate[index]);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CandidateCard(
                                data: candidate[index],
                                pollId: widget.pollId,
                                phoneNo: widget.phoneNo,
                              ),
                            ),
                          );
                        },
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
                                      const SizedBox(
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
                                    crossAxisAlignment: CrossAxisAlignment.end,
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
          ],
        ),
      ),
    ));
  }
}
