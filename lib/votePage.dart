import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';

class VotePage extends StatefulWidget {
  const VotePage({Key? key}) : super(key: key);

  @override
  State<VotePage> createState() => _VotePageState();
}

class _VotePageState extends State<VotePage> {

  List<Map> candidate=[
    {'id':1,'name':'AAA','description':'This is candidate 1','picture':'assets/red.png'},
    {'id':2,'name':'BBB','description':'This is candidate 2','picture':'assets/blue.png'},
    {'id':3,'name':'CCC','description':'This is candidate 3','picture':'assets/green.png'},
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
                      Text('Vote now',
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
                      Text('The candidates for the poll are',
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
                  SizedBox(width: 10/2,),
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

              ]
              ),
            ),

            Expanded(
              child: ListView.builder(
                  itemCount: candidate.length,
                  itemBuilder: (context,index){
                    return ExpansionCard(
                      title: Container(
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
                            Text('${candidate[index]['id']}',
                              style: TextStyle(
                                color: Color.fromRGBO(170, 170, 170, 1),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'poppins',
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(width: 20,),
                            Text('${candidate[index]['name']}',
                              style: TextStyle(
                                color: Color.fromRGBO(170, 170, 170, 1),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'poppins',
                                fontSize: 18,
                              ),
                            ),

                          ],
                        ),
                      ),
                      children: [
                        SizedBox(height: 15,),
                        Container(margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                          width: 300+100-50,
                          height: 54,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(43, 43, 43, 1)
                          ),
                          child: Text('${candidate[index]['description']}',
                          style: TextStyle(
                            color: Color.fromRGBO(170, 170, 170, 1),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'poppins',
                            fontSize: 18,
                          ),
                          ),
                          ),
                        Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage('${candidate[index]['picture']}')
                              )
                          ),
                        ),
                      ],
                    );
                  }
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 300+100-50,
                        height: 75,
                        padding: const EdgeInsets.fromLTRB(40.0,10,40,0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter candidate id you want to vote for',
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(170, 170, 170, 1),
                              fontSize: 14
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
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 300+100-50,
                        height: 54,
                        padding: const EdgeInsets.fromLTRB(40.0,10,40,0),
                        child: TextButton(
                          child: Text('Vote',
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
          ],
        ),
      ),
    ));
  }
}
