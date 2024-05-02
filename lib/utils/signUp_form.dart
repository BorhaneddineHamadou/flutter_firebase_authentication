import 'package:firebaseauthproject/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';

class SignUpForm extends StatefulWidget{
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm>{

  final _signupFormKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? name;
  bool _obsecureText = true;
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var border = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(9)),
    );

    var spacer = const SizedBox(height: 20);

    return Form(
      key: _signupFormKey,
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
            controller: pass,
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
          ),
          spacer,
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock_outline),

              labelText: "Confirm Password",
              border: border,
            ),
            validator: (value){
              if(value != pass.text){
                return "Password not match";
              }
              return null;
            },
          ),
          spacer,
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.account_circle),
              labelText: "Full name",
              border: border,
            ),
            validator: (value){
              if(value!.isEmpty){
                return "This field is required";
              }
              return null;
            },
            onSaved: (val){
              name = val;
            },
          ),
          spacer,
          ElevatedButton(
              onPressed: (){
                if(_signupFormKey.currentState!.validate()){
                  _signupFormKey.currentState!.save();
                  AuthenticationHelper.
                  signUp(email: email!, password: pass.text).then((result){
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
              child: const Text("SignUp")
          )
        ],
      ),
    );
  }
}