import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../signin_screen.dart';
import 'mystyle.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User? user;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser; // Fetch the current user
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 170),
      width: double.infinity,
      height: 440,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80.0)),
      ),
      child: Column(
        children: [
          // Profile Image
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blue, width: 2),
            ),
            child: const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/image2.jpeg"),
            ),
          ),

          const SizedBox(height: 10),
          Text(user?.email ?? "No user signed in", style: heading4), // Display only email

          // Location and Logout Button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_on,
                size: 16.0,
                color: Colors.grey,
              ),
              const Text("Lucknow, India", style: heading4),
              const SizedBox(width: 10),

              // Logout Button
              InkWell(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  print("Signed out");
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const SigninScreen()),
                  );
                },
                child: PhysicalModel(
                  color: Colors.blue,
                  shadowColor: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  elevation: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black26, width: 2),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text("Logout", style: heading5),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Stats Section
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildStatColumn("121", "Posts"),
              const SizedBox(width: 24),
              buildStatColumn("10M", "Followers"),
              const SizedBox(width: 24),
              buildStatColumn("120", "Following"),
            ],
          ),
        ],
      ),
    );
  }

  // Helper function to build stat columns
  Column buildStatColumn(String count, String label) {
    return Column(
      children: [
        Text(count, style: countText),
        Text(label, style: followText),
      ],
    );
  }
}
