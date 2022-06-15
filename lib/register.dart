import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vote_io_frontend/otp.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late TextEditingController phoneNo;

  @override
  void initState() {
    super.initState();
    phoneNo = TextEditingController();
  }

  @override
  void dispose() {
    phoneNo.dispose();
    super.dispose();
  }

  TextEditingController emailCont = TextEditingController();
  TextEditingController name = TextEditingController();

  Future<http.Response> register(
      String email, String username, String phone) async {
    return http.post(
      Uri.parse('http://localhost:3001/user/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(<String, String>{
        'email': email,
        'username': username,
        'phone': phone
      }),
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
            children: [
              const SizedBox(
                height: 45,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset('assets/logo.png'),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Register',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 42,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Create a new account with us',
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
              const SizedBox(
                height: 40,
              ),
              Column(
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
                  const SizedBox(
                    height: 10,
                  ),
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
                          controller: name,
                          style: const TextStyle(
                            color: Color(0xffAAAAAA),
                          ),
                          decoration: const InputDecoration(
                            hintText: 'Your Name',
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 300 + 100 - 50,
                        height: 54,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromRGBO(43, 43, 43, 1)),
                        child: TextFormField(
                          controller: emailCont,
                          style: const TextStyle(
                            color: Color(0xffAAAAAA),
                          ),
                          decoration: const InputDecoration(
                            hintText: 'Your Email',
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
                  const SizedBox(
                    height: 18,
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
                            'Get OTP',
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 20,
                                fontFamily: 'poppins',
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () async {
                            String phone = phoneNo.text;
                            String username = name.text;
                            String email = emailCont.text;

                            http.Response response =
                                await register(email, username, '+91${phone}');
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

                            //sendOtp(context, phoneNo.text);

                            //await writeUser();
                            // await readUser();
                            // Navigator.pushReplacementNamed(context, 'otp');
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(children: [
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: const Divider(
                        color: Color.fromRGBO(175, 175, 178, 1),
                        height: 36,
                        thickness: 2,
                      )),
                ),
                const Text(
                  "OR",
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      //   color: Colors.black12,
                      fontSize: 14,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w600),
                ),
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                      child: const Divider(
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
                      children: const [
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
                            Navigator.pushReplacementNamed(context, 'login');
                          },
                          child: const Text(
                            'Login with existing account',
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
      ),
    );
  }
}

sendOtp(context, phoneNo) {
  //todo: send otp and verify

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => OTP(
        phoneNo: phoneNo,
      ),
    ),
  );
}
