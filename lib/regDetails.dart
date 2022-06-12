import 'package:flutter/material.dart';

class RegDetails extends StatefulWidget {
  const RegDetails({Key? key}) : super(key: key);

  @override
  State<RegDetails> createState() => _RegDetailsState();
}

class _RegDetailsState extends State<RegDetails> {

  late TextEditingController name, email;

  @override
  void initState() {
    super.initState();
    name = TextEditingController();
    email = TextEditingController();

  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: Colors.black87,
          width: double.infinity,
          height: double.infinity,
          child: Column(children: [
            const SizedBox(
              height: 45,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Image.asset('assets/logo.png'),
              ],
            ),
            const SizedBox(
              height: 92,
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Almost there!',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 42,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Fill in these details to register',
                        style: TextStyle(
                          color: Color.fromRGBO(170, 170, 170, 1),
                          fontSize: 18,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 300 + 100 - 50,
                        height: 54,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(43, 43, 43, 1)),
                        child: TextFormField(
                          controller: name,
                          style: const TextStyle(
                            color: Color(0xffAAAAAA),
                          ),
                          decoration: const InputDecoration(
                            hintText: 'Your Name',
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(170, 170, 170, 1)),
                            border: OutlineInputBorder(),
                            fillColor: Color.fromRGBO(43, 43, 43, 1),
                            filled: true,
                            enabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 300 + 100 - 50,
                        height: 54,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromRGBO(43, 43, 43, 1)),
                        child: TextFormField(
                          controller: email,
                          style: const TextStyle(
                            color: Color(0xffAAAAAA),
                          ),
                          decoration: const InputDecoration(
                            hintText: 'Your Email',
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(170, 170, 170, 1)),
                            border: OutlineInputBorder(),
                            fillColor: Color.fromRGBO(43, 43, 43, 1),
                            filled: true,
                            enabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300 + 100 - 50,
                  height: 54,
                  padding: const EdgeInsets.fromLTRB(40.0, 10, 40, 0),
                  child: TextButton(
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 20,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      print(name.text);
                      print(email.text);
                    },
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(22, 86, 185, 1)),
                ),
              ],
            ),
          ]),
        ),
      ),
      // SizedBox(height: 20,),
      // SizedBox(height: 20,),
    );
  }
}

uploadNewUser(context, name, email){

}
