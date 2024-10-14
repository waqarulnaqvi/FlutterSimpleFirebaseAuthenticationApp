import 'package:authentication/screens/screens/appbar.dart';
import 'package:authentication/screens/screens/mystyle.dart';
import 'package:authentication/screens/screens/post.dart';
import 'package:authentication/screens/screens/profile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    backgroundColor: mainColor,
    body: ListView(
    children: [
    Stack(
    children: [
    Profile(),
    MyAppBar(),
    const MyPost(),
    ],
    )
    ],
    ),
    );
  }
}

