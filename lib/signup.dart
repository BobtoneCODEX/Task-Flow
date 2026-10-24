import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_flow/login.dart';
import 'otp.dart';

 class Signup extends StatefulWidget {
 const Signup({super.key});

    @override
    State<Signup> createState() => _LoginState();
}

  class _LoginState extends State<Signup> {
    final TextEditingController fullNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isObscure = true;






Future<void> signUp() async {
  if (!_formKey.currentState!.validate()) {
    return;
  }

  try {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text,
    );

    final user = credential.user;

    if (user != null) {
      await user.sendEmailVerification();
    }

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Account created successfully!'),
      ),
    );

    print('Account created: ${credential.user?.uid}');
  } on FirebaseAuthException catch (e) {
    if (!mounted) return;

    String message;

    if (e.code == 'email-already-in-use') {
      message = 'This email is already registered.';
    } else if (e.code == 'weak-password') {
      message = 'Please choose a stronger password.';
    } else if (e.code == 'invalid-email') {
      message = 'Please enter a valid email address.';
    } else {
      message = 'Signup failed: ${e.message ?? e.code}';
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  } catch (e) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Something went wrong. Please try again.'),
      ),
    );

    print(e);
  }
}








// 




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

                 Form(
                   key: _formKey,
                    child: Column(
                    children: [   

                        // FULL NAME
                        TextFormField  (
                          controller: fullNameController,
                          validator: (value) {
                          
                            if (value == null || value.isEmpty) {
                              return "Fullname is required";
                            }

                            return null;
                          },

                            style: const TextStyle(
                            color: Colors.white,
                          ),
                            decoration: InputDecoration(
                            hintText: "Fullname",  
                            prefixIcon: const Icon(
                            Icons.person,
                            color: Color.fromARGB(255, 138, 130, 130),
                          ),
                            hintStyle: const TextStyle(
                            color: Colors.grey,
                         ),
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
                            TextFormField(
                              controller: emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Email is required";
                                }

                                if (!value.contains('@')) {
                                  return "Please enter a valid email";
                                }

                                return null;
                              },
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                hintText: "Email",
                                prefixIcon: const Icon(
                                  Icons.email,
                                  color: Color.fromARGB(255, 138, 130, 130),
                                ),
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                ),
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
                              TextFormField(
                                controller: passwordController,
                                obscureText: isObscure,

                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Password is required";
                                  }

                                  if (value.length < 8) {
                                    return "Password must be at least 8 characters";
                                  }

                                 
                                  return null;
                                },

                                style: const TextStyle(
                                  color: Colors.white,
                                ),

                                decoration: InputDecoration(
                                  hintText: "Password", 
                                  prefixIcon: Transform.rotate(
                                    angle: 0.8,
                                    child: const Icon(
                                      Icons.key,
                                      color: Color.fromARGB(255, 138, 130, 130),
                                    ),
                                  ),

                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                  ),

                                  filled: true,
                                  fillColor: Colors.grey[900],

                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),

                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      isObscure
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: const Color.fromARGB(
                                        255,
                                        255,
                                        232,
                                        232,
                                      ),
                                    ),

                                    onPressed: () {
                                      setState(() {
                                        isObscure = !isObscure;
                                      });
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

                                         onPressed: signUp,
                                        //
                                        //
                                        // () {
                                        //     if (_formKey.currentState!.validate()) {
                                        //       Navigator.push(
                                        //         context,
                                        //         MaterialPageRoute(
                                        //           builder: (context) => const otp(),
                                        //         ),
                                        //       );
                                        //     }
                                        //   },

                                                  child: const Text(
                                                    "Signup",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                             ],
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
                     style: const TextStyle(color: Colors.white,fontSize:15,
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