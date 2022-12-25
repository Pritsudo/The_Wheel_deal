import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:the_wheel_deal/Screens/Login&Signup/signup.dart';
import 'package:the_wheel_deal/constants.dart';
import '../../VerifyUser.dart';
import '../../components/input_container.dart';
import '../../selectdriver.dart';


class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;

  late var userId;

  _signin(String _email, String _password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: _email, password: _password);
      userId = userCredential.user!.uid;

      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => VerifyUser(
                usid: userId,
                email:_email
              )));

     
      // print(userId);
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(
          msg: error.message.toString(), gravity: ToastGravity.TOP);
    }
  }

  @override
  Widget build(BuildContext context) {
    late var password, email,role;
    Size size = MediaQuery.of(context).size;

    // ignore: unused_local_variable
    double viewInset = MediaQuery.of(context)
        .viewInsets
        .bottom; //we are used determine keyboard is open or not
    double defaultLoginSize = size.height - (size.height * 0.2);
    // ignore: unused_local_variable
    double defaultRegisterSize = size.height - (size.height * 0.1);

    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            width: size.width,
            height: defaultLoginSize,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome To The Wheel Deal',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
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
                      if (password!.isEmpty && password.length>6) {
                        return "Password must be greater than 6 digits";
                      } else
                        return null;
                    },
                  ),
                ),
                
                
                SizedBox(
                  height: 10,
                ), 
                
               
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: kPrimaryColor,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20),
                    alignment: Alignment.center,
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      print("Button Presses");
                      _signin(email, password);
                    }
                  },
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    const Text('Don\'t have account?'),
                    TextButton(
                      child: const Text(
                        'Sign up',
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SecondRoute()),
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
    );
  }
}
