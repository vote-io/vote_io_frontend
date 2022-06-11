import 'package:flutter/material.dart';

class CreatedPollDone extends StatefulWidget {
  const CreatedPollDone({Key? key}) : super(key: key);

  @override
  State<CreatedPollDone> createState() => _CreatedPollDoneState();
}

class _CreatedPollDoneState extends State<CreatedPollDone> {
  var title='Poll';
  var description='This is the description of the poll';
  var startDateTime='start DateTime';
  var endDateTime='end DateTime';
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black87,
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(40, 20, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('$title',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 42,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w600,
                    ),)
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('$description',
                    style: TextStyle(
                      color: Color.fromRGBO(170, 170, 170, 1),
                      fontSize: 22,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w600,
                    ),)
                ],
              ),
              SizedBox(height: 25,),
              Container(
                width: 300+100-50,
                height: 75,
                padding: const EdgeInsets.fromLTRB(40.0,10,40,0),
                child: Column(
                  children: [
                    Text('$startDateTime',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 22,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w600,
                    ),),
                    Text('startDateTime',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 22,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w600,
                      ),),
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(43, 43, 43, 1)
                ),
              ),
              SizedBox(height: 25,),
              Container(
                width: 300+100-50,
                height: 75,
                padding: const EdgeInsets.fromLTRB(40.0,10,40,0),
                child: Column(
                  children: [
                    Text('$endDateTime',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 22,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w600,
                      ),),
                    Text('endDateTime',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 22,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w600,
                      ),),
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(43, 43, 43, 1)
                ),
              ),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300+100-50,
                    height: 54,
                    padding: const EdgeInsets.fromLTRB(40.0,10,40,0),
                    child: TextButton(
                      child: Text('Declare Results'
                          '',
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 20,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.bold
                        ),),
                      onPressed: (){
                        Navigator.pushReplacementNamed(context, 'declareResult');
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
      ),
    ));
  }
}
