import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../reuseable_widget/reuseable_widget.dart';
import '../utils/color_utils.dart';
import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _userTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white, size: 40),
        title: const Text("Sign Up", style: TextStyle(
            fontWeight: FontWeight.bold,
            color:Colors.white,
            fontSize: 24)) // iconTheme: IconThemeData(color: Colors.white,size: 40),
      ),
      body: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            hexStringToColor('CB2B93'),
            hexStringToColor('9546C4'),
            hexStringToColor('5E61F4'),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),),

        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: [
                const SizedBox(height: 30,),
                reusableTextField("Enter Username", Icons.person_outline, false,
                    _userTextController),
                const SizedBox(height: 30,),
                reusableTextField(
                    "Enter Email Id", Icons.email, false, _emailTextController),
                const SizedBox(height: 20,),
                reusableTextField("Enter Password", Icons.lock, true,
                    _passwordTextController),
                const SizedBox(height: 20,),
                signInSignUpButton(context, false, () {
                  FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailTextController.text, password: _passwordTextController.text)
                  .then((value){//we will navigae to the home screen only when username and account is created
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const HomeScreen()));
                  }).onError((error, stackTrace){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Invalid Email or Password")));
                    });
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
