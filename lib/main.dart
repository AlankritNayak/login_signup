import 'package:flutter/material.dart';
import 'checkAuth.dart';

import 'Login.dart';
import 'Signup.dart';

void main() {
     

      runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
          home:checkAuth(),
    routes: <String,WidgetBuilder>{

     
     "/login":(BuildContext context) => Login(),
      "/signup":(BuildContext context) => signup(),
    }
    );
  }
}