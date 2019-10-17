import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './Home.dart';
import './Login.dart';

class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  final GlobalKey<FormState> _formkey = GlobalKey();
  bool _autovalidate = false;
  String name, _email, mobile, _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: new AppBar(title: Text("Signup")),
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
                        return "enter name";
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: "name"),
                    onSaved: (input) => name = input,
                  ),
                ),
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
                        return "enter Mobile No.";
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: "Mobile"),
                    onSaved: (input) => mobile = input,
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
                RaisedButton(
                  onPressed: signup,
                  child: Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.lightBlue,
                ),
                RaisedButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Login()
                  )),
                  child: Text(
                    "Log_in if already acc",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.lightBlue,
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
        user = (await auth.createUserWithEmailAndPassword(
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
