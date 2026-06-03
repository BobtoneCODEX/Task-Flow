import 'Package:flutter/Material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main(){
   runApp(
     const MaterialApp(
     debugShowCheckedModeBanner: false,
     home:splashscreen(),
    ),
  );
}

class splashscreen extends StatelessWidget{
  const splashscreen({super.key});
      @override
        Widget build(BuildContext context) {
         return MaterialApp(
           debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                 child: Column(
                 mainAxisAlignment:MainAxisAlignment.center,

                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                       DefaultTextStyle(
                         style: const TextStyle(
                         color: Colors.black,
                         fontSize: 30,
                         fontWeight: FontWeight.bold,
                     ),

                      child: AnimatedTextKit(
                         animatedTexts: [
                         TypewriterAnimatedText(
                           'TaskFlow',
                            speed: const Duration(milliseconds: 300),
                        ),
                      ],
                           totalRepeatCount: 1,
                    ),
                  ),
                ]
             ),
           ),
         ),
       );
    }
  }
