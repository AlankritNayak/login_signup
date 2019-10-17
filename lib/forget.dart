import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class forget extends StatefulWidget {
  @override
  _forgetState createState() => _forgetState();
}

class _forgetState extends State<forget> {
  void forgot() async {
      if (_key.currentState.validate()) {
      _key.currentState.save();
          
        await FirebaseAuth.instance
        .sendPasswordResetEmail(email:email );
     
      }
  }

  final GlobalKey<FormState> _key = GlobalKey();

  String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: new AppBar(title: Text("Forget_password")),
        body: Form(
          key: _key,
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
                    onSaved: (input) => email = input,
                  ),
                ),
                RaisedButton(
                  onPressed: (){forgot();},
                  child: Text("forgot pasward"),
                )
              ],
            ),
          ),
        ));
  }
}
