import 'package:flutter/material.dart';

import '../utils/signUp_form.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
              child: SignUpForm(),
          ),
          const SizedBox(height: 18,),
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      const Text(
                        "You already have an account ?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                          fontSize: 12
                        ),),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                              "Login",
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
