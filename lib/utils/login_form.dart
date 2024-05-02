import 'package:firebaseauthproject/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';

class LoginForm extends StatefulWidget{
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm>{

  final _loginFormKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool _obsecureText = true;

  @override
  Widget build(BuildContext context) {
    var border = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(9)),
    );

    var spacer = const SizedBox(height: 20);

    return Form(
      key: _loginFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email_outlined),
              labelText: "email",
              border: border,
            ),
            validator: (value){
              if(value!.isEmpty){
                return "This field is required";
              }
              return null;
            },
            onSaved: (val){
              email = val;
            },
            keyboardType: TextInputType.emailAddress,
          ),
          spacer,
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: GestureDetector(
                onTap: (){
                  setState(() {
                    _obsecureText = !_obsecureText;
                  });
                },
                child: Icon(
                  _obsecureText?Icons.visibility_rounded:Icons.visibility_off
                ),
              ),
              labelText: "Password",
              border: border,
            ),
            validator: (value){
              if(value!.isEmpty){
                return "This field is required";
              }
              return null;
            },
            obscureText: _obsecureText,
            onSaved: (val){
              password = val;
            },
          ),
          spacer,
          spacer,
          ElevatedButton(
              onPressed: (){
                if(_loginFormKey.currentState!.validate()){
                  _loginFormKey.currentState!.save();
                  AuthenticationHelper.
                  signIn(email: email!, password: password!).then((result){
                    if(result == null){
                      Navigator.pushReplacement(
                          context, 
                          MaterialPageRoute(builder: (context) => Home())
                      );
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(result))
                      );
                    }
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(9)),
                ),
              ),
              child: const Text("Login")
          )
        ],
      ),
    );
  }
}