import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:the_wheel_deal/core/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:the_wheel_deal/secondDriverinfoPage.dart';
import 'package:the_wheel_deal/selectdriver.dart';

class BookDriver extends StatefulWidget {
  const BookDriver({Key? key}) : super(key: key);

  @override
  State<BookDriver> createState() => _BookDriverState();
}

class _BookDriverState extends State<BookDriver> {
  DateTime? startDate;
  DateTime? lastDate;
  bool isStartSelect = false;
  bool isEndtSelect = false;

  late String name;
  late String destAdd;
  late String currentLoc;
  final FirebaseAuth auth = FirebaseAuth.instance;

  void _sendData({
    required String name,
    required String destAdd,
    required String currentLoc,
    required String startDate,
    required String endDate,
  }) async {
// try{
    final User? user = auth.currentUser;
    final uid = user!.uid;

    FirebaseFirestore.instance.collection('Customer Info').add({
      'uid': uid,
      'name :': name,
      'Current-Address :': currentLoc,
      'Destination-Address': destAdd,
      'Starting-Date': startDate,
      'Last-Date': endDate,
    });

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SelectDriver()));
  }

  //  }

  void _startDatePicker(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        isStartSelect = true;
        startDate = pickedDate;
      });
    });
  }

  void _lastDatePicker(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime(2023))
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        isEndtSelect = true;
        lastDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: Container(
          width: size.width,
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: ColorConstant.whiteA700,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: getVerticalSize(
                          96.00,
                        ),
                        bottom: getVerticalSize(
                          20.00,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                17.00,
                              ),
                              right: getHorizontalSize(
                                17.00,
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.black, width: 2)),
                              child: ClipRRect(
                                child: Image.asset(
                                  ImageConstant.imgUndrawtravelb,
                                  height: getVerticalSize(
                                    250.00,
                                  ),
                                  width: getHorizontalSize(
                                    393.00,
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: getHorizontalSize(
                                324.00,
                              ),
                              margin: EdgeInsets.only(
                                left: getHorizontalSize(
                                  52.00,
                                ),
                                top: getVerticalSize(
                                  49.00,
                                ),
                                right: getHorizontalSize(
                                  52.00,
                                ),
                              ),
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  26.00,
                                ),
                                top: getVerticalSize(
                                  5.00,
                                ),
                                bottom: getVerticalSize(
                                  5.00,
                                ),
                              ),
                              decoration: BoxDecoration(
                                // color: ColorConstant.yellow200,
                                color: Color.fromARGB(120, 76, 175, 79),
                                borderRadius: BorderRadius.circular(
                                  getHorizontalSize(
                                    100.00,
                                  ),
                                ),
                              ),

                              child: TextFormField(
                                onChanged: (value) {
                                  name = value;
                                },
                                // cursorColor: Theme.of(context).,
                                obscureText: false,
                                decoration: InputDecoration(
                                    labelText: "Enter Your Name",
                                    hintText: 'Name',
                                    border: InputBorder.none),

                                validator: (email) {
                                  if (email!.isEmpty) {
                                    return "Name cannot be empty";
                                  } else
                                    return null;
                                },
                              ),
                              // fontFamily: 'Poppins',
                              // fontWeight: FontWeight.w400,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: getHorizontalSize(
                                324.00,
                              ),
                              margin: EdgeInsets.only(
                                left: getHorizontalSize(
                                  52.00,
                                ),
                                top: getVerticalSize(
                                  15.00,
                                ),
                                right: getHorizontalSize(
                                  52.00,
                                ),
                              ),
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  26.00,
                                ),
                                top: getVerticalSize(
                                  5.00,
                                ),
                                bottom: getVerticalSize(
                                  5.00,
                                ),
                              ),
                              decoration: BoxDecoration(
                                // color: ColorConstant.yellow200,
                                color: Color.fromARGB(120, 76, 175, 79),
                                borderRadius: BorderRadius.circular(
                                  getHorizontalSize(
                                    100.00,
                                  ),
                                ),
                              ),
                              child: TextFormField(
                                onChanged: (value) {
                                  destAdd = value;
                                },
                                // cursorColor: Theme.of(context).,
                                obscureText: false,
                                decoration: InputDecoration(
                                    hintText: "Enter Your Destination",
                                    labelText: 'Destination',
                                    border: InputBorder.none),

                                validator: (email) {
                                  if (email!.isEmpty) {
                                    return "Destination cannot be empty";
                                  } else
                                    return null;
                                },
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: getHorizontalSize(
                                324.00,
                              ),
                              margin: EdgeInsets.only(
                                left: getHorizontalSize(
                                  52.00,
                                ),
                                top: getVerticalSize(
                                  15.00,
                                ),
                                right: getHorizontalSize(
                                  52.00,
                                ),
                              ),
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  26.00,
                                ),
                                top: getVerticalSize(
                                  5.00,
                                ),
                                bottom: getVerticalSize(
                                  5.00,
                                ),
                              ),
                              decoration: BoxDecoration(
                                // color: ColorConstant.yellow200,

                                color: Color.fromARGB(120, 76, 175, 79),
                                borderRadius: BorderRadius.circular(
                                  getHorizontalSize(
                                    100.00,
                                  ),
                                ),
                              ),
                              child: TextFormField(
                                onChanged: (value) {
                                  currentLoc = value;
                                },
                                // cursorColor: Theme.of(context).,
                                obscureText: false,
                                decoration: InputDecoration(
                                    hintText: "Enter Your Current Location",
                                    labelText: 'Current Address',
                                    border: InputBorder.none),

                                validator: (email) {
                                  if (email!.isEmpty) {
                                    return "Current location cannot be empty";
                                  } else
                                    return null;
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                17.00,
                              ),
                              top: getVerticalSize(
                                8.00,
                              ),
                              right: getHorizontalSize(
                                17.00,
                              ),
                            ),
                            child: Text(
                              "Select date",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: ColorConstant.black900,
                                fontSize: getFontSize(
                                  20,
                                ),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: getVerticalSize(
                                  8.00,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: getHorizontalSize(
                                        53.00,
                                      ),
                                    ),
                                    child: InkWell(
                                      onTap: () => _startDatePicker(context),
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: getVerticalSize(
                                          59.00,
                                        ),
                                        width: getHorizontalSize(
                                          136.00,
                                        ),
                                        decoration: BoxDecoration(
                                          // color: ColorConstant.yellow200,
                                          color:
                                              Color.fromARGB(120, 76, 175, 79),
                                          borderRadius: BorderRadius.circular(
                                            getHorizontalSize(
                                              100.00,
                                            ),
                                          ),
                                        ),
                                        child: isStartSelect
                                            ? Text(startDate!.day.toString())
                                            : Text(
                                                "Start",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: ColorConstant.black900,
                                                  fontSize: getFontSize(
                                                    20,
                                                  ),
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: getHorizontalSize(
                                        13.00,
                                      ),
                                      top: getVerticalSize(
                                        15.00,
                                      ),
                                      bottom: getVerticalSize(
                                        14.00,
                                      ),
                                    ),
                                    child: Text(
                                      "To",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(
                                          20,
                                        ),
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: getHorizontalSize(
                                        14.00,
                                      ),
                                      right: getHorizontalSize(
                                        52.00,
                                      ),
                                    ),
                                    child: InkWell(
                                      onTap: () => _lastDatePicker(context),
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: getVerticalSize(
                                          59.00,
                                        ),
                                        width: getHorizontalSize(
                                          136.00,
                                        ),
                                        decoration: BoxDecoration(
                                          // color: ColorConstant.yellow200,
                                          color:
                                              Color.fromARGB(120, 76, 175, 79),
                                          borderRadius: BorderRadius.circular(
                                            getHorizontalSize(
                                              100.00,
                                            ),
                                          ),
                                        ),
                                        child: isEndtSelect
                                            ? Text(lastDate!.day.toString())
                                            : Text(
                                                "End",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: ColorConstant.black900,
                                                  fontSize: getFontSize(
                                                    20,
                                                  ),
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                17.00,
                              ),
                              top: getVerticalSize(
                                23.00,
                              ),
                              right: getHorizontalSize(
                                17.00,
                              ),
                            ),
                            child: InkWell(
                              onTap: () => _sendData(
                                  name: name,
                                  startDate: startDate!.day.toString(),
                                  currentLoc: currentLoc,
                                  destAdd: destAdd,
                                  endDate: lastDate!.day.toString()),
                              child: Container(
                                alignment: Alignment.center,
                                height: getVerticalSize(
                                  59.00,
                                ),
                                width: getHorizontalSize(
                                  324.00,
                                ),
                                decoration: BoxDecoration(
                                  // color: ColorConstant.yellowA200Bf,
                                  color: Color.fromARGB(255, 72, 146, 75),
                                  borderRadius: BorderRadius.circular(
                                    getHorizontalSize(
                                      100.00,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "Submit",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: ColorConstant.whiteA700,
                                    fontSize: getFontSize(
                                      24,
                                    ),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
