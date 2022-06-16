import 'package:flutter/material.dart';
import 'package:vote_io_frontend/pollStep2.dart';

class CreatePoll extends StatefulWidget {
  const CreatePoll({Key? key, required this.phoneNo}) : super(key: key);
  final int phoneNo;

  @override
  State<CreatePoll> createState() => _CreatePollState();
}

class _CreatePollState extends State<CreatePoll> {
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
                    TextButton(
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 35,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Spacer(),
                    Image.asset('assets/logo.png'),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Create Poll',
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
                      'Create a new Poll',
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
                      child: create_poll_form(
                        phoneNo: widget.phoneNo,
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

class create_poll_form extends StatefulWidget {
  const create_poll_form({Key? key, required this.phoneNo}) : super(key: key);
  final int phoneNo;

  @override
  State<create_poll_form> createState() => _create_poll_formState();
}

class _create_poll_formState extends State<create_poll_form> {
  final _formKey = GlobalKey<FormState>();
  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();

  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void> _selectStartDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedStartDate,
          firstDate: DateTime(2022),
          lastDate: DateTime(2025));
      if (picked != null && picked != selectedStartDate) {
        setState(() {
          selectedStartDate = picked;
        });
      }
    }

    Future<void> _selectEndDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedEndDate,
          firstDate: DateTime(2022),
          lastDate: DateTime(2025));
      if (picked != null && picked != selectedEndDate) {
        setState(
          () {
            selectedEndDate = picked;
          },
        );
      }
    }

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Enter name of the poll',
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
                color: Color.fromRGBO(43, 43, 43, 1)),
            child: TextFormField(
              style: const TextStyle(
                color: Color(0xffAAAAAA),
              ),
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Name of Poll',
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
            'Enter poll description',
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
                    color: Color.fromRGBO(43, 43, 43, 1)),
                child: TextFormField(
                  style: const TextStyle(
                    color: Color(0xffAAAAAA),
                  ),
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
            height: 10,
          ),
          const Text(
            'Enter start date',
            style: TextStyle(
              fontFamily: 'poppins',
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          Container(
            width: 350,
            height: 54,
            padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(43, 43, 43, 1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${selectedStartDate.toLocal()}".split(' ')[0],
                  style: const TextStyle(
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(198, 198, 198, 1),
                    fontSize: 18,
                  ),
                ),
                RaisedButton(
                  onPressed: () => _selectStartDate(context),
                  color: const Color.fromRGBO(33, 33, 33, 1),
                  elevation: 0, // Refer step 3
                  child: const Text(
                    'Select date',
                    style: TextStyle(
                        color: Color.fromRGBO(198, 198, 198, 1),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            'Enter Finish date',
            style: TextStyle(
              fontFamily: 'poppins',
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          Container(
            width: 350,
            height: 54,
            padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(43, 43, 43, 1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${selectedEndDate.toLocal()}".split(' ')[0],
                  style: const TextStyle(
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(198, 198, 198, 1),
                    fontSize: 18,
                  ),
                ),
                RaisedButton(
                  onPressed: () => _selectEndDate(context),
                  color: const Color.fromRGBO(33, 33, 33, 1),
                  elevation: 0, // Refer step 3
                  child: const Text(
                    'Select date',
                    style: TextStyle(
                        color: Color.fromRGBO(198, 198, 198, 1),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
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
                    'Next',
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 20,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    String name = nameController.text;
                    String desc = descController.text;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => pollStep2(
                            pollName: name,
                            desc: desc,
                            startDate: selectedStartDate
                                .toUtc()
                                .millisecondsSinceEpoch,
                            endDate:
                                selectedEndDate.toUtc().millisecondsSinceEpoch,
                            phoneNo: widget.phoneNo),
                      ),
                    );
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
