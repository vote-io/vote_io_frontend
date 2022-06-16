import 'package:flutter/material.dart';
import 'package:vote_io_frontend/blockchain/blockchainSetup.dart';

class CandidateCard extends StatefulWidget {
  const CandidateCard(
      {Key? key,
      required this.data,
      required this.pollId,
      required this.phoneNo})
      : super(key: key);
  final List data;
  final int pollId;
  final int phoneNo;
  @override
  State<CandidateCard> createState() => _CandidateCardState();
}

class _CandidateCardState extends State<CandidateCard> {
  List data = [];

  @override
  Widget build(BuildContext context) {
    data = widget.data;
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
                Spacer(),
                Image.asset('assets/logo.png'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              color: const Color.fromRGBO(20, 20, 20, 1),
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Candidate Information',
                          style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage('${data[4]}'))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${data[1]}',
                          style: const TextStyle(
                              fontSize: 24,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        Text(
                          '${data[0]}',
                          style: const TextStyle(
                              fontSize: 24,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Candidate Name',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        Text(
                          'Candidate Id',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Card(
                      color: const Color.fromRGBO(20, 20, 20, 1),
                      elevation: 10,
                      child: Text(
                        '${data[2]}',
                        style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
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
                      'Vote',
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 20,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () async {
                      dynamic res = await castVote(BigInt.from(widget.phoneNo),
                          BigInt.from(widget.pollId), data[0]);
                      print(res);
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
