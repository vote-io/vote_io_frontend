import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                          Text('Register',
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
                          Text('Create a new account with us',
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

                // SizedBox(height: 20,),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 300+100-50,
                            height: 54,
                            padding: const EdgeInsets.fromLTRB(40.0,10,40,0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Phone no.',
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(170, 170, 170, 1)
                                ),
                                border: OutlineInputBorder(),
                                fillColor: Color.fromRGBO(43, 43, 43, 1),
                                filled: true,
                                enabledBorder: InputBorder.none,

                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromRGBO(43, 43, 43, 1)
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 300+100-50,
                            height: 54,
                            padding: const EdgeInsets.fromLTRB(40.0,10,40,0),
                            child: TextButton(
                              child: Text('Get OTP',
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 20,
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.bold
                                ),),
                              onPressed: (){},
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromRGBO(22, 86, 185, 1)
                            ),
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
                  Text("OR",
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        //   color: Colors.black12,
                        fontSize: 14,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w600
                    ),) ,
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
                          Text('You can just',
                            style: TextStyle(
                                color: Color.fromRGBO(170, 170, 170, 1),
                                fontSize: 16,
                                fontFamily: 'poppins',
                                fontWeight: FontWeight.w600
                            ),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(onPressed: (){
                            Navigator.pushReplacementNamed(context, 'otp');
                          },
                            child: Text(
                              'Login with existing account',
                              style: TextStyle(
                                  color: Color.fromRGBO(13, 153, 255, 1),
                                  fontFamily: 'poppins',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  decoration: TextDecoration.underline
                              ),
                            ),)
                        ],
                      )
                    ],
                  ),
                ),

              ],
            ),
          ),

        )
    );
  }
}
