import 'package:firebaseauthproject/firebase_auth.dart';
import 'package:firebaseauthproject/screens/login_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("LogOut"),
              onTap: (){
                AuthenticationHelper.signOut().then(
                        (_) => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Login())
                    )
                );
              },
            ),

          ],
        ),
      ),
      body: const Center(
        child: Text("Welcome"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          AuthenticationHelper.signOut().then(
                  (_) => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                      (route) => false
                  )
          );
        },
        child: const Icon(Icons.logout),
      ),
    );
  }
}