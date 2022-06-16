import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserAccount extends StatefulWidget {
  const UserAccount({Key? key}) : super(key: key);

  @override
  State<UserAccount> createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black87,
        ),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/logo.png'),
                Text(
                  'VoteHub',
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(73, 132, 224, 1)),
                )
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              'Edit Account',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 40.0,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                letterSpacing: 2.0,
              ),
            ),
            // SizedBox(height: 20,),
            // imageProfile(),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              // controller: Cname,
              decoration: InputDecoration(
                fillColor: Color.fromRGBO(53, 57, 53, 1),
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.teal,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.deepPurple,
                  width: 2,
                )),
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.white70,
                ),
                labelText: "Name",
                //helperText: "Name can't be empty",
                hintText: "Name",
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            //SizedBox(height: 30),
            TextFormField(
              // controller: Cemail,
              decoration: InputDecoration(
                fillColor: Color.fromRGBO(53, 57, 53, 1),
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.teal,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.deepPurple,
                  width: 2,
                )),
                prefixIcon: Icon(
                  Icons.email_rounded,
                  color: Colors.white70,
                ),
                labelText: "E-Mail Id",
                //helperText: "Name can't be empty",
                hintText: "E-Mail Id",
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            TextFormField(
              // controller: CphoneNo,
              decoration: InputDecoration(
                fillColor: Color.fromRGBO(53, 57, 53, 1),
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.teal,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.deepPurple,
                  width: 2,
                )),
                prefixIcon: Icon(
                  Icons.phone,
                  color: Colors.white70,
                ),
                labelText: "Phone no",
                // helperText: "phone no can't be empty",
                hintText: "Phone no",
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                  onPressed: () async {
                    // String name = Cname.text;
                    // String password = Cpassword.text;
                    // String phoneNo = CphoneNo.text;

                    // if(name == '' || name == null ){
                    //   name = data['name'];
                    // }
                    // if(phoneNo == '' || phoneNo == null){
                    //   print('entered if');
                    //   phoneNo = data['phone'].toString();
                    // }
                    //
                    // print(password);

                    // if(password != '') {
                    //   print('entered if password');
                    //   http.Response response = await change_password(data['userId'],password);
                    //   Map passData = json.decode(response.body);
                    //   print(passData);
                    // }
                    //
                    // http.Response response = await edit_userInfo(data['userId'],name, phoneNo);
                    // Map resData = json.decode(response.body);
                    // print(resData);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                          color: Color.fromRGBO(61, 137, 245, 1), width: 4)),
                  color: Color.fromRGBO(61, 137, 245, 1),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Text(
                      'Okay',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                          color: Color.fromRGBO(61, 137, 245, 1), width: 4)),
                  color: Color.fromRGBO(61, 137, 245, 1),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Text(
                      'Back',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: MaterialButton(
                minWidth: 180,
                height: 60,
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      'login', (Route<dynamic> route) => false);
                },
                color: const Color(0xff5ED5A8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: const Text(
                  "SIGN OUT",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
