import 'package:flutter/material.dart';
import 'package:task_flow/login.dart';
import 'otp.dart';

 class Signup extends StatefulWidget {
 const Signup({super.key});

    @override
    State<Signup> createState() => _LoginState();
}

  class _LoginState extends State<Signup> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isObscure = true;

   @override
    Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.black,
       body: Padding(
       padding: const EdgeInsets.all(20),
              child: Center(
              child: SingleChildScrollView(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [


                  //TEXT1
                Align(
                 alignment: Alignment.centerLeft,
                 child: RichText(
                 text: const TextSpan(
                 children: [

                   TextSpan(
                      text: "Create",
                      style: TextStyle(
                      color: Colors.white,
                      fontSize: 37,
                      fontWeight: FontWeight.bold,
                    ),
                   ),


                    TextSpan(
                      text: "Account",
                      style: TextStyle(
                      color: Color(0xFFB8860B), // Gold
                      fontSize: 37,
                      fontWeight: FontWeight.bold,
                    ),
                   ),


                 ],
                ),
               ),
             ),


                   //TEXT 2
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                  "Let's Continue Your Journey",
                  style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),

        const SizedBox(height: 20),

            //FULL NAME 
             TextField(
                style:const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: "Fullname",
                      prefixIcon: Icon(Icons.person,
                      color: const Color.fromARGB(255, 138, 130, 130),
                      ),
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.grey[900],
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
               ),
             ),
           ),

        const SizedBox(height: 10),

           
                // EMAIL
                TextField(
                  style:const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: Icon(Icons.email,
                      color: const Color.fromARGB(255, 138, 130, 130),
                      ),
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.grey[900],
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
               ),
             ),
           ),


       const SizedBox(height: 10),

                  // PASSWORD
                TextField(
                  controller: passwordController,
                  obscureText: isObscure,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                     hintText: "Password",
                     prefixIcon: Transform.rotate(
                     angle: 0.8, // adjust this value to tilt it
                     child: const Icon(Icons.key,
                     color: const Color.fromARGB(255, 138, 130, 130),
                  ),
                ),

                     hintStyle: const TextStyle(color: Colors.grey),
                     filled: true,
                     fillColor: Colors.grey[900],
                     border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(12),
                     borderSide: BorderSide.none,
                  ),


                    suffixIcon: IconButton(
                     icon: Icon(
                       isObscure ? Icons.visibility : Icons.visibility_off,
                       color: const Color.fromARGB(255, 255, 232, 232),
                     ),

                      onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                    }
                  );
                },
               ),
              ),
            ),


      const SizedBox(height: 37),

                // SIGNUP BUTTON
               SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB8860B),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                 ),
               ),

            onPressed: () {
             Navigator.pushReplacement(
              context, 
              MaterialPageRoute(
                builder: (context) => const otp(),
              ),
            );
          },


                child: const Text(
                   "Signup",
                    style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                ),
               ),
             ),
           ),




       SizedBox(height: 16),

                // DIVIDER WITH TEXT
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey.shade400)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "Or sign up with",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey.shade400))
                  ],
                ),




                 
       SizedBox(height: 20),
                      //ICONS
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [

                        Icon(
                          Icons.facebook,
                          color: Colors.grey,
                          size: 35,
                      ),


         SizedBox(width: 20),

                        Icon(
                          Icons.g_mobiledata,
                          color: Colors.grey,
                          size: 49,
                      ),

           SizedBox(width: 20),

                        Icon(
                          Icons.apple,
                          color: Colors.grey,
                          size: 43,
                      ),
                    ],
                   ),
                      SizedBox(height: 30),


                  //ALREADY HAVE AN ACCOUNT
                  TextButton(
                     onPressed: () {
                     Navigator.push(context,MaterialPageRoute(builder: (context) => const Login(), ),); },
                     child: Text.rich(
                  TextSpan(
                     text: "Already have an account? ",
                     style: const TextStyle(color: Colors.white,              fontSize:15,
               ),


                  children: const [
                     TextSpan(
                     text: "Login",
                     style: TextStyle(color: Color.fromARGB(255, 73, 179, 250),
                     fontSize:15,
               ),
            ),
          ],


        ),
      ),
    ),        

              ],
            ),
          ),
        ),
      ),
    );
  }
}