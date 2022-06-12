import 'package:flutter/material.dart';

class AddCandidate extends StatefulWidget {
  const AddCandidate({Key? key}) : super(key: key);

  @override
  State<AddCandidate> createState() => _AddCandidateState();
}

class _AddCandidateState extends State<AddCandidate> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //backgroundColor: Color.fromRGBO(33, 33, 33, 1),

      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration:BoxDecoration(
            color: Colors.black87,

          ),
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40,20,20,20),
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
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Add a Candidate',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 42,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w600,
                      ),)
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Add details of the new Candidate here',
                      style: TextStyle(
                        color: Color.fromRGBO(170, 170, 170, 1),
                        fontSize: 18,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w600,
                      ),)
                  ],
                ),
                SizedBox(height: 30,),

                Expanded(
                  child: SizedBox(
                    height: 420,
                    child: SingleChildScrollView(
                      child: AddCandidate_Form(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: bottom_bar(),
    );
  }
}


class AddCandidate_Form extends StatefulWidget {
  const AddCandidate_Form({Key? key}) : super(key: key);

  @override
  State<AddCandidate_Form> createState() => _AddCandidate_FormState();
}

class _AddCandidate_FormState extends State<AddCandidate_Form> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Text('Enter name of the candidate',style: TextStyle(
            fontFamily: 'poppins',
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 18,),),
          SizedBox(height: 10/2,),
          Container(
            width: 300+100-50,
            height: 54,
            padding: const EdgeInsets.fromLTRB(40.0,10,40,0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Name of Candidate',
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
          SizedBox(height: 10,),


          Text('Enter description of the candidate',style: TextStyle(
            fontFamily: 'poppins',
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 18,),),
          SizedBox(height: 10/2,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 300+100-50,
                height: 54,
                padding: const EdgeInsets.fromLTRB(40.0,10,40,0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Poll Description',
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

          Text('Upload Picture :)',style: TextStyle(
            fontFamily: 'poppins',
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 18,),),

          Container(
            width: 300+100-50,
            height: 54,
            padding: const EdgeInsets.fromLTRB(40.0,10,40,0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Candidate Picture',
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
          SizedBox(
            height: 20.0,
          ),

          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300+100-50,
                height: 54,
                padding: const EdgeInsets.fromLTRB(40.0,10,40,0),
                child: TextButton(
                  child: Text('Add Candidate',
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 20,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.bold
                    ),),
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, 'dialogBox',arguments: {
                      'title':'Successful',
                      'content':'You have successfully added a candidate to the poll'
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
    );
  }
}
