import 'package:flutter/material.dart';

import 'mystyle.dart';

class SinglePost extends StatelessWidget {
  final String image; // Field to store the image path

  // Constructor to accept the image parameter
  const SinglePost({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 30.0),
          height: 150,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50.0),
              topLeft: Radius.circular(50.0),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(50.0),
              topLeft: Radius.circular(50.0),
            ),
            child: Image.asset(
              image, // Using the image parameter
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          margin: const EdgeInsets.only(left: 80.0, right: 5, bottom: 30),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Welcome to Flutter", style: postText),
              Row(
                children: [
                  Icon(
                    Icons.comment_outlined,
                    size: 16.0,
                    color: Colors.white,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "15",
                    style: postText,
                  ),
                  SizedBox(width: 15),
                  Icon(
                    Icons.favorite_border,
                    size: 16.0,
                    color: Colors.white,
                  ),
                  SizedBox(width: 5),
                  Text("150k", style: postText),
                  SizedBox(width: 10),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}


// import 'mystyle.dart';
//
// class SinglePost extends StatelessWidget {
//
//   SinglePost(Image image);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//        child:  Column(
//           children: [
//             Container(
//               margin: const EdgeInsets.only(left: 30.0),
//               height: 150,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50.0),
//                   topLeft: Radius.circular(50.0)) ,
//
//             ),
//               child: ClipRRect(
//                   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50.0),
//                       topLeft: Radius.circular(50.0)),
//
//                   child: Image.asset(image,fit: BoxFit.cover,)),
//             ),
//             SizedBox(height: 8),
//             Container(
//               margin: const EdgeInsets.only(left: 80.0,right: 5,bottom: 30),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("Welome to Flutter",style:postText),
//                   Row(
//                     children: [
//                       Icon(Icons.comment_outlined,
//                           size: 16.0,
//                           color:Colors.white
//                       ),
//                       SizedBox(width: 5),
//                       Text(
//                         "15",
//                         style: postText,
//                       ),
//                       SizedBox(width: 15),
//                       Icon(Icons.favorite_border,
//                         size: 16.0,
//                         color:Colors.white,
//                       ),
//                       SizedBox(width: 5),
//                       Text("150k",style: postText,),
//                       SizedBox(width: 10),
//
//                     ],
//                   )
//                 ],
//               ),
//             )
//           ],
//         )
//     );
//   }
// }
