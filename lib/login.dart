import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vote_io_frontend/otp.dart';

import 'constants.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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

  Future<http.Response> login(String phone) async {
    return http.post(
      Uri.parse('$serverUrl/user/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(<String, String>{'phone': phone}),
    );
  }

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
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
              children: [
                const Spacer(),
                Image.asset('assets/logo.png'),
                const SizedBox(
                  width: 15,
                ),
              ],
            ),
            // SizedBox(height: 25,),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
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
                  children: const [
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

            // SizedBox(height: 20,),
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
                          color: const Color.fromRGBO(43, 43, 43, 1)),
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
                          http.Response response = await login('+91${phone}');
                          Map res = json.decode(response.body);
                          print(res);

                          if (res.containsKey("_id")) {
                            navigator.pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => OTP(
                                  registering: false,
                                  phoneNo: phone,
                                  name: '',
                                  email: '',
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // SizedBox(height: 20,),

            // SizedBox(height: 20,),
            Row(children: <Widget>[
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
            Column(
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
                        Navigator.pushReplacementNamed(context, 'register');
                      },
                      child: const Text(
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
          ],
        ),
      ),
    ));
  }
}
