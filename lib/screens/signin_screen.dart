import 'package:authentication/screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../reuseable_widget/reuseable_widget.dart';
import '../utils/color_utils.dart';
import 'home_screen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SiState();
}

class _SiState extends State<SigninScreen> {

  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient:LinearGradient(colors: [
            hexStringToColor('CB2B93'),
            hexStringToColor('9546C4'),
            hexStringToColor('5E61F4'),
          ],begin: Alignment.topCenter,end:Alignment.bottomCenter),),

        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height*0.2, 20, 0),
            child: Column(
              children: [
                logoWidget("assets/images/meditation_bg.png"),
                const SizedBox(height: 30,),
                reusableTextField("Enter Email", Icons.person_outline, false, _emailTextController),
                const SizedBox(height: 20,),
                reusableTextField("Enter Password", Icons.lock, true, _passwordTextController),
                const SizedBox(height: 20,),
                signInSignUpButton(context, true, (){
                  FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text).then((value){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
                  }).onError((error, stackTrace){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Invalid Email or Password")));
                  });

                }),
                signUpOption()
              ],
            ),
          ),
        ),
      ),
    );
  }
  Row signUpOption()
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account? ",
          style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>const SignUpScreen()));
          },
          child: const Text("Sign Up",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
        )
      ],
    );
  }

}
