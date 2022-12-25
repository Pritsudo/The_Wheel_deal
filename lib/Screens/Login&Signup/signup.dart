import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:the_wheel_deal/Screens/Login&Signup/login.dart';
import '../../components/input_container.dart';
import '../../constants.dart';

class SecondRoute extends StatefulWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  FirebaseAuth auth = FirebaseAuth.instance;
  _signup(String _email, String _password , String _role)  async {
    try {
       //UserCredential userCredential =
      await auth
          .createUserWithEmailAndPassword(email: _email, password: _password)
          .then((value) {
        FirebaseFirestore.instance
            //   After Setting User is regesterd setting data to
            .collection('UserData')
            .doc(value.user!.uid)
            .set(
          {'email': value.user!.email, 'uid': value.user!.uid , 'role':_role},
        );
      });

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginScreen()));
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(
          msg: error.message.toString(), gravity: ToastGravity.TOP);
    }
  }

  @override
  Widget build(BuildContext context) {
    late var email, password,role;

    return Scaffold(
      body: Stack(
        children: [
          //LOGIN FORM
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              // ignore: sized_box_for_whitespace
              child: Container(
                // width: size.width,
                // height: defaultLoginSize,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,

                 
                  children: [
                    Text(
                      'Sign in now!',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                    SizedBox(height: 40),
                    SvgPicture.asset('assets/images/login.svg'),
                    SizedBox(height: 40),
                    InputContainer(
                      child: Column(
                        children: [
                          TextFormField(
                            cursorColor: kPrimaryColor,
                            obscureText: false,
                            decoration: InputDecoration(
                                icon: Icon(Icons.mail,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                                hintText: "email",
                                border: InputBorder.none),
                            onChanged: (value) {
                              email = value;
                            },
                            validator: (email) {
                              if (email!.isEmpty) {
                                return "Email cannot be empty";
                              } else
                                return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    InputContainer(
                      child: TextFormField(
                        cursorColor: kPrimaryColor,
                        obscureText: true,
                        decoration: InputDecoration(
                            icon: Icon(Icons.lock,
                                color: Color.fromARGB(255, 0, 0, 0)),
                            hintText: 'Password',
                            border: InputBorder.none),
                        onChanged: (value) {
                          password = value;
                        },
                        validator: (password) {
                          if (password!.isEmpty) {
                            return "Password cannot be empty";
                          } else
                            return null;
                        },
                      ),
                    ),
                    // RoundedPasswordInput(hint: 'Confirm Password'),
                    SizedBox(
                      height: 10,
                    ),
                     InputContainer(
                  child: TextFormField(
                    cursorColor: kPrimaryColor,
                   
                    decoration: InputDecoration(
                        icon: Icon(Icons.lock,
                            color: Color.fromARGB(255, 0, 0, 0)),
                        hintText: 'Role',
                        border: InputBorder.none),
                    onChanged: (value) {
                      role = value;
                    },
                    validator: (role) {
                      if (role!.isEmpty) {
                        return "Role cannot be empty";
                      } else
                        return null;
                    },
                  ),
                ),

                    SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        _signup(email, password , role);
                      },
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: kPrimaryColor,
                        ),
                        padding: EdgeInsets.symmetric(vertical: 20),
                        alignment: Alignment.center,
                        child: Text(
                          "Signup",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    Row(
                      children: <Widget>[
                        const Text('Already have an account?'),
                        TextButton(
                          child: const Text(
                            'Log In',
                            style: TextStyle(fontSize: 18),
                          ),
                          onPressed: () {
                            //signup screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                            );
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
