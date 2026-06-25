import 'package:flutter/material.dart';
import 'package:task_flow/otp.dart';
import 'package:pinput/pinput.dart';
import 'login.dart';


  class otp extends StatefulWidget{
  const otp ({super.key});

  @override
 State<otp> createState() => _otpState();

}


   class _otpState extends State<otp> {
   final TextEditingController emailController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();

   bool isObscure = true;

  @override
      Widget build (BuildContext){
      return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
      padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                

                Align(
                 alignment: Alignment.topLeft,
                 child: IconButton(
                 onPressed: () {
                 Navigator.pushReplacement(
                 context,
                 MaterialPageRoute(
                 builder: (context) => const Login(),
              ),
           );
         },

            icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
           ),
         ),
      ),


            const SizedBox(height: 20),

                  //TEXT1
                Align(
                 alignment: Alignment.centerLeft,
                 child: RichText(
                 text: const TextSpan(
                 children: [

                   TextSpan(
                      text: "OTP",
                      style: TextStyle(
                      color: Colors.white,
                      fontSize: 37,
                      fontWeight: FontWeight.bold,
                    ),
                   ),


                    TextSpan(
                      text: "Verification",
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
                  "Enter the 4-digit verification code we sent to bob******@gmail.com",
                  style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),

                

               const SizedBox(height: 30),

             Pinput(
               length: 6,
               defaultPinTheme: PinTheme(
               width: 60,
               height: 60,
               textStyle: const TextStyle(
               fontSize: 24,
               fontWeight: FontWeight.bold,
               color: Colors.blue, // Color of the numbers
           ),
               decoration: BoxDecoration(
               color: Colors.grey[900], // Background color of the boxes
               border: Border.all(
               color: const Color.fromARGB(255, 145, 151, 157), // Border color
               width: 2,
           ),
        borderRadius: BorderRadius.circular(12),
    ),
  ),

          onCompleted: (pin) {
             print("OTP Entered: $pin");
       },
     ),


         const SizedBox(height: 20,),
           Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
            onPressed: () {
      // Resend OTP code here
       },


           child: const Text(
               "Didn't receive the code?",
                style: TextStyle(
                color: Colors.white,
                fontSize: 18,
      ),
    ),
  ),
),
             

             const SizedBox(height: 5,),
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
               print(emailController.text);
               print(passwordController.text);
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
     const SizedBox(height: 100,)
             
              ],
            ),
          ),
        ),
       ),  
      );
    }
 }
