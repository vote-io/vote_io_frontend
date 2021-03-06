import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:vote_io_frontend/constants.dart';
import 'package:vote_io_frontend/dashboard_1.dart';

import 'blockchain/blockchainSetup.dart';

class OTP extends StatefulWidget {
  const OTP(
      {Key? key,
      required this.registering,
      required this.phoneNo,
      required this.name,
      required this.email})
      : super(key: key);

  final bool registering;
  final String phoneNo;
  final String name;
  final String email;

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  late TextEditingController otp;

  late String phoneNo;

  @override
  void initState() {
    super.initState();
    otp = TextEditingController();
    phoneNo = widget.phoneNo;
  }

  // @override
  // void dispose() {
  //   otp.dispose();
  //   super.dispose();
  // }

  Future<http.Response> verify(String phone, String otp) async {
    return http.post(
      Uri.parse('$serverUrl/user/verify'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(<String, String>{'phone': phone, "otp": otp}),
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
          children: [
            const SizedBox(
              height: 45,
            ),
            Row(
              children: [
                const Spacer(),
                Image.asset('assets/logo.png'),
                const SizedBox(
                  width: 15,
                ),
              ],
            ),
            const SizedBox(
              height: 92,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Enter OTP',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 42,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'A OTP has been sent to your mobile number',
                      style: TextStyle(
                        color: Color.fromRGBO(170, 170, 170, 1),
                        fontSize: 14,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Enter it to continue to the dashboard',
                      style: TextStyle(
                        color: Color.fromRGBO(170, 170, 170, 1),
                        fontSize: 14,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 37,
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                child: PinCodeTextField(
                  controller: otp,
                  appContext: context,
                  textStyle: const TextStyle(
                    color: Color(0xffAAAAAA),
                  ),
                  pastedTextStyle: const TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
                  length: 6,
                  obscureText: true,
                  obscuringCharacter: '*',
                  blinkWhenObscuring: true,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    activeColor: const Color.fromRGBO(52, 52, 52, 1),
                    inactiveColor: Colors.white70,
                    selectedColor: Colors.white70,
                    activeFillColor: const Color.fromRGBO(52, 52, 52, 1),
                    selectedFillColor: const Color.fromRGBO(52, 52, 52, 1),
                    inactiveFillColor: const Color.fromRGBO(52, 52, 52, 1),
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                  ),
                  cursorColor: Colors.black,
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  //errorAnimationController: errorController,
                  //controller: textEditingController,
                  keyboardType: TextInputType.number,
                  boxShadows: const [
                    BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.black12,
                      blurRadius: 10,
                    )
                  ],
                  onCompleted: (v) {
                    debugPrint("Completed");
                    print(otp.text);
                  },
                  // onTap: () {
                  //   print("Pressed");
                  // },
                  onChanged: (value) {},
                  beforeTextPaste: (text) {
                    debugPrint("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                )),
            const SizedBox(
              height: 37,
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
                      'CONFIRM',
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 20,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () async {
                      print(otp.text);
                      print(phoneNo);

                      http.Response response =
                          await verify('+91${phoneNo}', otp.text);
                      Map res = json.decode(response.body);
                      print(res);

                      if (res["message"] == "OTP correct") {
                        if (widget.registering) {
                          await addNewUser(
                              BigInt.parse(phoneNo), widget.name, widget.email);
                        }
                        // navigator.push(
                        //   MaterialPageRoute(
                        //     builder: (context) => Dashboard1(
                        //       phoneNo: int.parse(phoneNo),
                        //     ),
                        //   ),
                        // );
                        navigator.pushReplacement(
                          MaterialPageRoute(
                            settings: const RouteSettings(name: "/dashboard1"),
                            builder: (context) =>
                                Dashboard1(phoneNo: int.parse(phoneNo)),
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
      ),
    ));
  }
}
