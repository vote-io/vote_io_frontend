import 'package:flutter/material.dart';

class Dashboard1 extends StatefulWidget {
  const Dashboard1({Key? key}) : super(key: key);

  @override
  State<Dashboard1> createState() => _Dashboard1State();
}

class _Dashboard1State extends State<Dashboard1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(45, 45, 46, 1),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'VoteHub',
                  style: TextStyle(
                    color: Color.fromRGBO(73, 132, 224, 1),
                  ),
                ),
                Icon(
                  Icons.account_circle_rounded,
                  size: 35,
                ),
              ],
            ),
          ),
          body: Container(
            color: Colors.black54,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Text(
                      '   Dashboard',
                      style: TextStyle(
                          color: Color.fromRGBO(231, 231, 231, 1),
                          fontSize: 22,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w400
                      ),
                    ),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10,0, 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(27, 27, 27, 1),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          TextButton(
                            child: Text(
                                'Upcoming ',
                              style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                  fontSize: 16,
                                  fontFamily: 'poppins',
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                            onPressed: (){},
                          ),
                          Icon(
                            Icons.arrow_downward_rounded,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 10, 0, 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // color: Color.fromRGBO(27, 27, 27, 1),
                            ),
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color.fromRGBO(27, 27, 27, 1)
                                  ),
                                  child: TextButton(
                                    child: Text(
                                      'Created ',
                                      style: TextStyle(
                                          color: Color.fromRGBO(255, 255, 255, 1),
                                         fontSize: 16,
                                          fontFamily: 'poppins',
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                    onPressed: (){},
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color.fromRGBO(80, 80, 80, 1)
                                  ),
                                  child: TextButton(
                                    child: Text(
                                      'Joined ',
                                      style: TextStyle(
                                          color: Color.fromRGBO(255, 255, 255, 1),
                                          fontSize: 16,
                                          fontFamily: 'poppins',
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                    onPressed: (){},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}

