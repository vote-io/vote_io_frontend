import 'package:flutter/material.dart';

class Results extends StatefulWidget {
  const Results(
      {Key? key, required this.candidateName, required this.candidateId})
      : super(key: key);
  final String candidateName;
  final String candidateId;
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    String title = "Results are out!!!";
    String content =
        "the winner of the poll is candidate ${widget.candidateName} with ID ${widget.candidateId}";
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.black87,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/logo.png'),
                  Text(
                    'VoteHub',
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(73, 132, 224, 1)),
                  )
                ],
              ),
              Center(
                child: AlertDialog(
                  backgroundColor: Color.fromRGBO(170, 170, 170, 1),
                  title: Text(
                    '$title',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  content: Text('$content',
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () =>
                          Navigator.pushReplacementNamed(context, 'dashboard1'),
                      child: const Text(
                        'Got It',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(73, 132, 224, 1)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
