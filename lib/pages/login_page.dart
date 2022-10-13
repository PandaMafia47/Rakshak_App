import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rakshakapp/pages/forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage ({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

  // text controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
    );
  }
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(
                  height: 150,
                  width: 150,
                  child: Image(image:AssetImage(
                      'assets/logo.png',

                  ),
                  ),
                ),
                SizedBox(height: 10),
                //Welcome to Rakshak
              Text(
                  'Welcome to Rakshak!',
              style: GoogleFonts.bebasNeue(
                fontSize: 32
              )
        ),
              SizedBox(height: 10),
              Text(
                'Your Safety made simpler',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
                SizedBox(height: 50),

                //email field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                //password field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height:10),
                //Forgot Password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder:(context){
                            return ForgotPasswordPage();
                          },
                          ),
                        );
                        },
                        child: Text("Forgot Password?",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),

                //signin button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: signIn,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                          child: Text(
                              'Sign In',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                      ),
                    ),
                  ),
                ),

            SizedBox(height: 25),

                //new user? register
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(
                       'New User?',
                   style: TextStyle(
                     fontWeight: FontWeight.bold,
                   ),
                   ),
                   GestureDetector(
                     onTap: widget.showRegisterPage,
                     child: Text(
                         ' Register now',
                       style: TextStyle(
                         color: Colors.blue,
                         fontWeight: FontWeight.bold,
                       ),

                             ),
                   ),
                 ],
               ),
            ],),
          ),
        ),
      ),
    );
  }
}