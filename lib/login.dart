import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vote_io_frontend/otp.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController phoneNo = TextEditingController();

  Future<http.Response> login(String phone) async {
    return http.post(
      Uri.parse('http://localhost:3001/user/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(<String, String>{'phone': phone}),
    );
  }

  @override
  Widget build(BuildContext context) {
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
            // SizedBox(height: 30),
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
            // SizedBox(height: 25,),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hello Again!',
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
                        'Login to enter dashboard',
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

            // SizedBox(height: 20,),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 300 + 100 - 50,
                        height: 54,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(43, 43, 43, 1)),
                        child: TextFormField(
                          controller: phoneNo,
                          style: const TextStyle(
                            color: Color(0xffAAAAAA),
                          ),
                          decoration: const InputDecoration(
                            hintText: 'Phone Number',
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
                  SizedBox(
                    height: 10,
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
                            'Get OTP',
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 20,
                                fontFamily: 'poppins',
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () async {
                            String phone = phoneNo.text;
                            http.Response response = await login('+91${phone}');
                            Map res = json.decode(response.body);
                            print(res);

                            if (res.containsKey("_id")) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OTP(
                                          phoneNo: phone,
                                        )),
                              );
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
            // SizedBox(height: 20,),

            // SizedBox(height: 20,),
            Row(children: <Widget>[
              Expanded(
                child: new Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                    child: Divider(
                      color: Color.fromRGBO(175, 175, 178, 1),
                      height: 36,
                      thickness: 2,
                    )),
              ),
              Text(
                "OR",
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    //   color: Colors.black12,
                    fontSize: 14,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w600),
              ),
              Expanded(
                child: new Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                    child: Divider(
                      color: Color.fromRGBO(175, 175, 178, 1),
                      thickness: 2,
                      height: 36,
                    )),
              ),
            ]),
            // SizedBox(height: 10,),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'You can just',
                        style: TextStyle(
                            color: Color.fromRGBO(170, 170, 170, 1),
                            fontSize: 16,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, 'register');
                          // Navigator.push(context, new MaterialPageRoute(
                          //     builder: (context) => new Register())
                          // );
                        },
                        child: Text(
                          'Register as User',
                          style: TextStyle(
                              color: Color.fromRGBO(13, 153, 255, 1),
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
