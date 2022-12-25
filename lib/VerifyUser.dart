import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:the_wheel_deal/HomePage.dart';
import 'package:the_wheel_deal/admin.dart';
import 'package:the_wheel_deal/bookdriver.dart';


class VerifyUser extends StatefulWidget {
  var usid;
  var email;
  VerifyUser({Key? key, required this.usid, required this.email})
      : assert(usid != null),
        super(key: key);

  @override
  State<VerifyUser> createState() => _VerifyUserState();
}

class _VerifyUserState extends State<VerifyUser> {
  verify() {
    late String role;
    // final String documentId;

    CollectionReference users =
        FirebaseFirestore.instance.collection('UserData');
    print(widget.usid);
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(widget.usid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        // if (snapshot.hasData && !snapshot.data!.exists) {
        //   return Text("Document does not exist");
        // }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          print("You Are in Printing methode");
          role = "${data['role']}";
          print("Role is :::::: ${role}");

          if (role == 'admin') {
            Future.delayed(Duration(milliseconds: 500), () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AdminPage()));
            });
          }

          if (role == 'user') {
            Future.delayed(Duration(milliseconds: 500), () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => home()));
            });
          }
       
        }

        return SizedBox(
          height: 600,
          width: 500,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: Container(
        decoration: BoxDecoration(
          color: Colors.lightGreen
        ),
          child: Column(
        children: [
          verify(),
         
        ],
      )),
    );
  }
}
