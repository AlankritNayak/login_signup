
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './Home.dart';

import 'forget.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController p = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey();
  bool _autovalidate = false;
  String name, _email, mobile, _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: new AppBar(title: Text("lOG_IN")),
        body: Form(
          key: _formkey,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.person),
                  title: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return "enter email";
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: "Email"),
                    onSaved: (input) => _email = input,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return "enter pasward";
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: "enter pasward"),
                    onSaved: (input) => _password = input,
                  ),
                ),
                Container(
                  child: TextField(
                    decoration: InputDecoration(),
                    controller: p,
                  ),
                ),
                RaisedButton(
                  onPressed: signup,
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.lightBlue,
                ),
                RaisedButton(
                  onPressed: () => Navigator.of(context).pushNamed("/signup"),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.lightBlue,
                ),
                RaisedButton(
                  onPressed: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => forget())),
                  child: Text("forgot pasward"),
                ),
               
              ],
            ),
          ),
        ));
  }

  void signup() async {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      try {
        FirebaseAuth auth = await FirebaseAuth.instance;
        FirebaseUser user;
        user = (await auth.signInWithEmailAndPassword(
                email: _email, password: _password))
            .user;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Home(
                    user: user,
                  )),
        );
      } catch (e) {
        print(e.message);
      }
    }
  }
   
 
}
