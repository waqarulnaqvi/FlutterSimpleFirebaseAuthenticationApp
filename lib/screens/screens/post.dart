import 'package:authentication/screens/screens/singlepost.dart';
import 'package:flutter/material.dart';


class MyPost extends StatelessWidget {
  const MyPost({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 460.0),
      child: Column(
        children: [
          Column(
            children: [
              SinglePost(image: 'assets/images/image1.jpg',),
              SinglePost(image: 'assets/images/image2.jpeg',),
              SinglePost(image: 'assets/images/image1.jpg',),
              SinglePost(image: 'assets/images/image2.jpeg',),
              SinglePost(image: 'assets/images/image1.jpg',),
              SinglePost(image: 'assets/images/image2.jpeg',),
              SinglePost(image: 'assets/images/image1.jpg',),
              SinglePost(image: 'assets/images/image2.jpeg',),
              SinglePost(image: 'assets/images/image1.jpg',),
              SinglePost(image: 'assets/images/image2.jpeg',),
              SinglePost(image: 'assets/images/image1.jpg',),
              SinglePost(image: 'assets/images/image2.jpeg',),
            ],
          )
        ],
      ),
    );
  }
}
