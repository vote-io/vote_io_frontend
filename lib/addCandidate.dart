import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class AddCandidate extends StatefulWidget {
  const AddCandidate({Key? key, required this.candidates, required this.number})
      : super(key: key);
  final List<dynamic> candidates;
  final int number;

  @override
  State<AddCandidate> createState() => _AddCandidateState();
}

class _AddCandidateState extends State<AddCandidate> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.black87,
          ),
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 20, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/logo.png'),
                    const Text(
                      'VoteHub',
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(73, 132, 224, 1)),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Add a Candidate',
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
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Add details of the new Candidate here',
                      style: TextStyle(
                        color: Color.fromRGBO(170, 170, 170, 1),
                        fontSize: 18,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: SizedBox(
                    height: 420,
                    child: SingleChildScrollView(
                      child: AddCandidate_Form(
                        candidates: widget.candidates,
                        number: widget.number,
                      ),
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
  const AddCandidate_Form(
      {Key? key, required this.candidates, required this.number})
      : super(key: key);
  final List<dynamic> candidates;
  final int number;
  @override
  State<AddCandidate_Form> createState() => _AddCandidate_FormState();
}

class _AddCandidate_FormState extends State<AddCandidate_Form> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();

  String imageUrl =
      "https://www.icmetl.org/wp-content/uploads/2020/11/user-icon-human-person-sign-vector-10206693.png";

  Future<Map<String, dynamic>> uploadImage(File ppic) async {
    //create multipart request for POST or PATCH method
    var request = http.MultipartRequest(
        "POST", Uri.parse("http://localhost:3001/candidate/picture"));
    //add text fields

    //create multipart using filepath, string or bytes
    var pic = await http.MultipartFile.fromPath("ppic", ppic.path);
    //add multipart to request
    request.files.add(pic);
    var response = await request.send();
    //Get the response from the server
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);

    return json.decode(responseString);
    // return responseString;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            //  the image
            child: Container(
              width: 100,
              height: 100,
              child: Stack(children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(35, 35, 35, 0.4),
                        offset: Offset(
                          0,
                          4,
                        ),
                        blurRadius: 34,
                        spreadRadius: 1,
                      ),
                    ],
                    image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.6),
                          BlendMode.dstATop,
                        ),
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () async {
                      // _onLoading();
                      // Pick an image
                      final picker = ImagePicker();
                      final XFile? pickedFile = (await picker.pickImage(
                          source: ImageSource.gallery, imageQuality: 80));
                      if (pickedFile != null) {
                        File imageFile = File(pickedFile.path);
                        dynamic res = await uploadImage(imageFile);
                        setState(() {
                          imageUrl = res['link'];
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size.zero, // Set this
                        padding: const EdgeInsets.all(8), // and this
                        shape: const CircleBorder(),
                        primary: const Color.fromRGBO(22, 22, 22, 1),
                        elevation: 4),
                    child: const Icon(Icons.add, color: Colors.white),
                  ),
                )
              ]),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Enter name of the candidate',
            style: TextStyle(
              fontFamily: 'poppins',
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 10 / 2,
          ),
          Container(
            width: 300 + 100 - 50,
            height: 54,
            padding: const EdgeInsets.fromLTRB(40.0, 10, 40, 0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(43, 43, 43, 1)),
            child: TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Name of Candidate',
                hintStyle: TextStyle(color: Color.fromRGBO(170, 170, 170, 1)),
                border: OutlineInputBorder(),
                fillColor: Color.fromRGBO(43, 43, 43, 1),
                filled: true,
                enabledBorder: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Enter description of the candidate',
            style: TextStyle(
              fontFamily: 'poppins',
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 10 / 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 300 + 100 - 50,
                height: 54,
                padding: const EdgeInsets.fromLTRB(40.0, 10, 40, 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(43, 43, 43, 1)),
                child: TextFormField(
                  controller: descController,
                  decoration: const InputDecoration(
                    hintText: 'Poll Description',
                    hintStyle:
                        TextStyle(color: Color.fromRGBO(170, 170, 170, 1)),
                    border: OutlineInputBorder(),
                    fillColor: Color.fromRGBO(43, 43, 43, 1),
                    filled: true,
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300 + 100 - 50,
                height: 54,
                padding: const EdgeInsets.fromLTRB(40.0, 10, 40, 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(22, 86, 185, 1)),
                child: TextButton(
                  child: const Text(
                    'Add Candidate',
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 20,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    String name = nameController.text;
                    String desc = descController.text;

                    List<dynamic> cMap = widget.candidates;

                    cMap.add([
                      BigInt.from(widget.number),
                      name,
                      desc,
                      BigInt.from(0),
                      imageUrl
                    ]);
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
