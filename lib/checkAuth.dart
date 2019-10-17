import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Home.dart';
import './Signup.dart';

class checkAuth extends StatefulWidget {
  @override
  _checkAuthState createState() => _checkAuthState();
}

class _checkAuthState extends State<checkAuth> {
  bool isloggedin;
  var user; 
  @override
  void initState() {
    isloggedin = false;
    FirebaseAuth.instance.currentUser().then((user) => user != null
        ? setState(() {
            isloggedin = true;
            user = user;
          })
        : null);
    super.initState();
  }

  Widget build(BuildContext context) {
    return isloggedin ? Home(user: user) : signup();
  }
}
