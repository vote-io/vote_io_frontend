import 'package:flutter/material.dart';

import 'dashboard_1.dart';

class DialogBox extends StatefulWidget {
  const DialogBox(
      {Key? key,
      required this.phoneNo,
      required this.content,
      required this.title})
      : super(key: key);
  final int phoneNo;
  final String title;
  final String content;
  @override
  _DialogBoxState createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    var title = widget.title;
    var content = widget.content;
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.black87,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/logo.png'),
                  const Text(
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
                  backgroundColor: const Color.fromRGBO(170, 170, 170, 1),
                  title: Text(
                    '$title',
                    style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  content: Text(content,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .popUntil(ModalRoute.withName("/dashboard1"));
                        //   Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) =>
                        //         Dashboard1(phoneNo: widget.phoneNo),
                        //   ),
                        // );
                      },
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
