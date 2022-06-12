import 'package:flutter/material.dart';

class DialogBox extends StatefulWidget {
  const DialogBox({Key? key}) : super(key: key);
  @override
  _DialogBoxState createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  Map data={};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;
    var title=data['title'];
    var content=data['content'];
    return SafeArea(
      child: Scaffold(

        body: Container(
          color: Colors.black87,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              Center(
                child:  AlertDialog(
                  backgroundColor: Color.fromRGBO(170, 170, 170, 1),
                      title:  Text('$title',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                      content: Text('$content',
                      style:TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pushReplacementNamed(context, 'dashboard1'),
                          child: const Text('Got It',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(73, 132, 224, 1)
                          ),),
                        ),
                      ],
                    ),
                ),
            ],
          ),
        ),
        ),
    );

      }
}

