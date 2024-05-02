import 'package:firebaseauthproject/screens/signUp_screen.dart';
import 'package:flutter/material.dart';

import '../utils/login_form.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(17),
        children: [
          const SizedBox(height: 80,),
          const Text("Welcome", style: TextStyle(fontSize: 30),),
          const Padding(
              padding: EdgeInsets.all(8),
              child: LoginForm(),
          ),
          const SizedBox(height: 18,),
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      const Text(
                        "You don't have an account ?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                          fontSize: 12
                        ),),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => SignUp())
                            );
                          },
                          child: const Text(
                              "Register",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.blue
                              )
                          ),
                        ),
                    ],
                  ),
                ],
              )
          )
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
