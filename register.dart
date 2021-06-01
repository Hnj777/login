import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  checkAuthentification() async {
    FirebaseAuth.instance.authStateChanges().listen((user) async { 
      if(user != null){
        Navigator.pushReplacementNamed(context, '/');
      }
    });
  }

 @override
  void initState() {
    super.initState();
    this.checkAuthentification();
  }



  onPressButton() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      try {
        UserCredential user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: usernameController.text,
                password: passwordController.text);
        if (user != null) {
          Map userData = {
            "name": nameController.text,
            "email": usernameController.text,
            "password": passwordController.text
          };
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.all(10),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Name",
                      border: OutlineInputBorder(),
                    ),
                    controller: nameController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Name",
                      border: OutlineInputBorder(),
                    ),
                    controller: usernameController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Name",
                      border: OutlineInputBorder(),
                    ),
                    controller: passwordController,
                    obscureText: true,
                  ),
                  ElevatedButton(onPressed: onPressButton, child: Text("Register")),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already User"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          },
                          child: Text("Login")),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
