import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile page", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: Text("*Insert Carter's rippling muscles*"),
    );
  }
}
