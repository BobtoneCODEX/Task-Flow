import 'package:flutter/material.dart';
import 'package:task_flow/signup.dart';

 class Login extends StatefulWidget {
 const Login({super.key});

    @override
    State<Login> createState() => _LoginState();
 }

  class _LoginState extends State<Login> {
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
                      text: "Welcome ",
                      style: TextStyle(
                      color: Colors.white,
                      fontSize: 37,
                      fontWeight: FontWeight.bold,
                    ),
                   ),


                    TextSpan(
                      text: "Back",
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


                 //TEXT 1
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


                const SizedBox(height: 8),
                  Align(
                   alignment: Alignment.centerRight,
                   child: TextButton(
                   onPressed: () {},
                   child: const Text(
                   "Forgot Password?",
                   style: TextStyle(
                   color: Colors.grey,
                ),
             ),
          ),
       ),


                // LOGIN BUTTON
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
               print(emailController.text);
               print(passwordController.text);
          },


                child: const Text(
                   "Login",
                    style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
              ),
           ),
        ),
      ),




                      SizedBox(height: 35),

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



                      const SizedBox(height: 15),

                           //ALREADY HAVE AN ACCOUNT
                           TextButton(
                              onPressed: () {
                                Navigator.push(
                                context,
                                MaterialPageRoute(
                                builder: (context) => const Signup(),
                           ),
                        );
                     },
                                 child: Text.rich(
                              TextSpan(
                              text: "New here? ",
                              style: const TextStyle(color: Colors.grey),
                              children: const [
                                  TextSpan(
                                     text: "CREATE AN ACCOUNT",
                                     style: TextStyle(color: Colors.lightBlue),
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