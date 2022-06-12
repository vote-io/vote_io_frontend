import 'package:flutter/material.dart';

class JoinPoll extends StatefulWidget {
  const JoinPoll({Key? key}) : super(key: key);

  @override
  State<JoinPoll> createState() => _JoinPollState();
}

class _JoinPollState extends State<JoinPoll> {
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
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Image.asset('assets/logo.png'),
                    Text('VoteHub',
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(73, 132, 224, 1)
                      ),)
                  ],
                ),
                 SizedBox(height: 25,),
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Join Poll',
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
                          Text('Enter the Poll ID and Unique Key to join Poll',
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

                 SizedBox(height: 20,),
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
                                hintText: 'Poll ID',
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
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 300+100-50,
                            height: 54,
                            padding: const EdgeInsets.fromLTRB(40.0,10,40,0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Unique Key',
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
                              child: Text('Submit',
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 20,
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.bold
                                ),),
                              onPressed: (){
                                Navigator.pushReplacementNamed(context, 'dialogBox',arguments: {
                                  'title':'Successful',
                                  'content':'You have successfully registered to vote for this poll. Find your poll on the dashboard.'
                                });
                              },
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

                // SizedBox(height: 10,),


              ],
            ),
          ),

        )
    );
  }
}
