import 'package:flutter/material.dart';
import 'package:vote_io_frontend/results.dart';

class ResultsDeclare extends StatefulWidget {
  const ResultsDeclare({Key? key}) : super(key: key);

  @override
  State<ResultsDeclare> createState() => _ResultsDeclareState();
}

class _ResultsDeclareState extends State<ResultsDeclare> {
  
  List<Map> res=[
    {'id':1,'name':'AAA','position':1},
    {'id':2,'name':'BBB','position':2},
    {'id':3,'name':'CCC','position':3},
      ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.black87,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 20,),
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
            SizedBox(height: 20,),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Results',
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
                      Text('The results of the Poll are',
                        style: TextStyle(
                          color: Color.fromRGBO(170,170,170, 1),
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
            margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
            width: 300+100-50,
            height: 54,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(43, 43, 43, 1)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text('Candidate',
                      style: TextStyle(
                        color: Color.fromRGBO(170, 170, 170, 1),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'poppins',
                        fontSize: 18,
                      ),
                    ),
                    Text('Id',
                      style: TextStyle(
                        color: Color.fromRGBO(170, 170, 170, 1),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'poppins',
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text('Candidate',
                      style: TextStyle(
                        color: Color.fromRGBO(170, 170, 170, 1),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'poppins',
                        fontSize: 18,
                      ),
                    ),
                    Text('Name',
                      style: TextStyle(
                        color: Color.fromRGBO(170, 170, 170, 1),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'poppins',
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text('Candidate',
                      style: TextStyle(
                        color: Color.fromRGBO(170, 170, 170, 1),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'poppins',
                        fontSize: 18,
                      ),
                    ),
                    Text('Position',
                      style: TextStyle(
                        color: Color.fromRGBO(170, 170, 170, 1),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'poppins',
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
            Expanded(
              child: ListView.builder(
                  itemCount: res.length,
                  itemBuilder: (context,index){
                    return Container(
                      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                      width: 300+100-50,
                      height: 54,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(43, 43, 43, 1)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('${res[index]['id']}',
                          style: TextStyle(
                              color: Color.fromRGBO(170, 170, 170, 1),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'poppins',
                            fontSize: 18,
                          ),
                          ),
                          Text('${res[index]['name']}',
                            style: TextStyle(
                              color: Color.fromRGBO(170, 170, 170, 1),
                              fontWeight: FontWeight.w600,
                              fontFamily: 'poppins',
                              fontSize: 18,
                            ),
                          ),
                          Text('${res[index]['position']}',
                            style: TextStyle(
                              color: Color.fromRGBO(170, 170, 170, 1),
                              fontWeight: FontWeight.w600,
                              fontFamily: 'poppins',
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              ),
            )
          ],
        ),
      ),
    ));
  }
}
