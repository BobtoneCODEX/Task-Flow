import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'login.dart';
import 'signup.dart';

    void main() {
      runApp(const MyApp());
   }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.black,
       body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
          children: [


             DefaultTextStyle(
                style: const TextStyle(
                color: Color(0xFFB8860B),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),

              child: AnimatedTextKit(
                animatedTexts: [
                TypewriterAnimatedText(
                  'TaskFlow',
                    speed: const Duration(milliseconds: 100),
                  ),
                ],

                totalRepeatCount: 1,
                onFinished: () {
                  Navigator.pushReplacement(
                    context,
                      MaterialPageRoute(
                     builder: (context) => const Login(),
                    ),
                  );

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}