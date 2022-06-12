import 'package:flutter/material.dart';

class CandidateCard extends StatefulWidget {
  const CandidateCard({Key? key}) : super(key: key);

  @override
  State<CandidateCard> createState() => _CandidateCardState();
}

class _CandidateCardState extends State<CandidateCard> {

  Map data={};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;
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
            Card(
              color: Color.fromRGBO(20, 20, 20, 1),
              elevation: 10
              ,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(

                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Candidate Information',style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w700,
                            color: Colors.white
                        ),),],
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(
                            '${data['picture']}'
                          )
                        )
                      ),
                    ),

                    SizedBox(height: 20,),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${data['name']}',style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w700,
                            color: Colors.white
                        ),),


                        Text('${data['id']}',style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w700,
                            color: Colors.white
                        ),),

                      ],),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Candidate Name',style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w700,
                            color: Colors.white
                        ),),


                        Text('Candidate Id',style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w700,
                            color: Colors.white
                        ),),

                      ],),
                    SizedBox(height: 20,),
                    Container(
                      child: Card(
                          color: Color.fromRGBO(20, 20, 20, 1),
                        elevation: 10,
                        child: Text(
                          '${data['description']}',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w700,
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            ),
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
    ));
  }
}
