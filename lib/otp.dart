import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTP extends StatefulWidget {
  const OTP({Key? key}) : super(key: key);

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 30),
                    Image.asset('assets/logo.png'),
                  ],
                ),
                // SizedBox(height: 25,),
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Enter OTP',
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 42,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w600,
                            ),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('A OTP has been sent to your mobile number',
                            style: TextStyle(
                              color: Color.fromRGBO(170, 170, 170, 1),
                              fontSize: 18,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w600,
                            ),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Enter it to continue to the dashboard',
                            style: TextStyle(
                              color: Color.fromRGBO(170, 170, 170, 1),
                              fontSize: 18,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w600,
                            ),)
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 30),
                    child: PinCodeTextField(

                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 6,
                      obscureText: true,
                      obscuringCharacter: '*',
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        activeColor: Color.fromRGBO(52 ,52,  52  , 1),
                        inactiveColor: Colors.white70,
                        selectedColor: Colors.white70,
                        activeFillColor:Color.fromRGBO(52 ,52,  52  , 1),
                        selectedFillColor: Color.fromRGBO(52 ,52,  52  , 1),
                        inactiveFillColor: Color.fromRGBO(52 ,52,  52  , 1),
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
                      },
                      // onTap: () {
                      //   print("Pressed");
                      // },
                      onChanged: (value) {

                      },
                      beforeTextPaste: (text) {
                        debugPrint("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    )),
          // SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300+100-50,
                      height: 54,
                      padding: const EdgeInsets.fromLTRB(40.0,10,40,0),
                      child: TextButton(
                        child: Text('CONFIRM',
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 20,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.bold
                          ),),
                        onPressed: (){
                            Navigator.pushReplacementNamed(context, 'dashboard1');
                        },
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(22, 86, 185, 1)
                      ),
                    ),
                  ],
                ),
                // SizedBox(height: 20,),

                // SizedBox(height: 20,),

              ],
            ),
          ),

        )
    );
  }
}
