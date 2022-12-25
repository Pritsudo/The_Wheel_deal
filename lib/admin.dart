import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AdminPage extends StatefulWidget {
  // String usid;
  // AdminPage({Key? key}) : super(key: key);

  // AdminPage({Key? key, required this.usid})
  //     : assert(usid != null),
  //       super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    // late var name, index;

    // final namefield = TextFormField(
    //   decoration: InputDecoration(
    //     hintText: "name",
    //     label: Text("name"),
    //   ),
    //   onChanged: (value) {
    //     name = value;
    //   },
    // );

    // final indexfield = TextFormField(
    //   decoration: InputDecoration(
    //     hintText: "Password",
    //     label: Text("Password"),
    //   ),
    //   onChanged: (value) {
    //     index = value;
    //   },
    // );

    return Scaffold(
      appBar: AppBar(
        title: Text("Admin"),
      ),
      
      body: Center(
        child: Text("This is Admin Page"),
      ),
  //     body: Form(
  //       key: _formKey,
  //       child: Column(
  //         children: [
  //           Text("This is Admin Page"),
  // //           SizedBox(
  // //             height: 15,
  // //           ),
  // //           namefield,
  // //           SizedBox(
  // //             height: 15,
  // //           ),
  // //           indexfield,
  // //           SizedBox(
  // //             height: 15,
  // //           ),

  // //           ElevatedButton(
  // //             child: Text("Add Data"),
  // //             onPressed: (() {
  // //               // if (_formKey.currentState!.validate()) {
  // //               // }
  // //               FirebaseFirestore.instance
  // //                   .collection('CarDetails')
  // //                   .add({
  // //                 'name': name,
  // //                 'index':index,
  // //               });
  // //             }),
  // //           ),

  // //            ElevatedButton(
  // //             child: Text("nextpage"),
  // //             onPressed: (() {
  // //            FirebaseFirestore.instance
  // //     .collection("CarDetails")
  // //     .where("index", isGreaterThan: "1")
  // //     .snapshots()
  // //     .listen((result) {
  // //   result.docs.forEach((result) {
  // //     print(result.data());
  // //   });
  // // });
  // //             }),
  // //           ),
            
  //         ],
  //       ),
  //     ),
    );
  }
}
