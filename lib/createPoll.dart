import 'package:flutter/material.dart';

class CreatePoll extends StatefulWidget {
  const CreatePoll({Key? key}) : super(key: key);

  @override
  State<CreatePoll> createState() => _CreatePollState();
}




class _CreatePollState extends State<CreatePoll> {
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
                    Text('Create Poll',
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
                    Text('Create a new Poll',
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
                      child: create_poll_form(),
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

class create_poll_form extends StatefulWidget {
  const create_poll_form({Key? key}) : super(key: key);

  @override
  State<create_poll_form> createState() => _create_poll_formState();
}

class _create_poll_formState extends State<create_poll_form> {
  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    Future<void> _selectDate(BuildContext context) async{
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2022),
          lastDate: DateTime(2025));
      if(picked!=null && picked!=selectedDate)
        setState(() {
          selectedDate= picked;
        });
    }
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Text('Enter name of the poll',style: TextStyle(
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
                hintText: 'Name of Poll',
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


          Text('Enter poll description',style: TextStyle(
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

          Text('Enter date',style: TextStyle(
            fontFamily: 'poppins',
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 18,),),

          Container(
            width: 350,
            height: 54,
            padding:EdgeInsets.fromLTRB(40, 10, 40, 0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(43, 43, 43, 1)
            ),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${selectedDate.toLocal()}".split(' ')[0],style: TextStyle(
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(198, 198, 198, 1),
                  fontSize: 18,),),

                RaisedButton(
                  onPressed: () => _selectDate(context), // Refer step 3
                  child: Text(
                    'Select date',
                    style:
                    TextStyle(color: Color.fromRGBO(198, 198, 198, 1), fontWeight: FontWeight.bold),
                  ),
                  color:Color.fromRGBO(33, 33, 33, 1),
                  elevation: 0,
                ),
              ],
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
                  child: Text('Create Poll',
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 20,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.bold
                    ),),
                  onPressed: (){

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
