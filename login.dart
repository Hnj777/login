import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopapi/view/register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

   chechAuthentification() async {
    FirebaseAuth.instance.authStateChanges().listen(
      (user) async {
        if (user != null) {
          Navigator.pushReplacementNamed(context, "/");
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    this.chechAuthentification();
  }


  login() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();

      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: userNameController.text, password: passwordController.text);
      } catch (e) {
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
        key: formKey,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "User Name",
                    border: OutlineInputBorder(),
                  ),
                  controller: userNameController,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "PassWord",
                    border: OutlineInputBorder(),
                  ),
                  controller: passwordController,
                  obscureText: true,
                ),
                ElevatedButton(onPressed: login, child: Text("Submit")),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("New User"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()));
                        },
                        child: Text("Register Now"))
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
