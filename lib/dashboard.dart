import 'package:flutter/material.dart';


class DashboardScreen extends StatelessWidget{
  const DashboardScreen ({super.key});

  @override 
  Widget build (BuildContext context){
    return Scaffold(
         backgroundColor: Colors.black,
         body: SafeArea(
         child: Padding(
         padding: const EdgeInsets.all(20),
         child: Column(
         crossAxisAlignment: CrossAxisAlignment.start, 
         children: [

          Row(
            children: [
              const Icon(
                Icons.menu,
                color: Color(0xFFB8860B),
              ),

              const Spacer(),

              const Icon(
                Icons.notifications,
                size: 28,
                color: Colors.white,
              ),

              const SizedBox(width: 12),

              const CircleAvatar(
                radius: 17,
                child: Icon(
                  Icons.person,
                  size: 20,
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "GoodMorning ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "Bob👋",
                  style: TextStyle(
                    color: Color(0xFFB8860B),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
                  SizedBox(height: 5,),
                 Text(
                  "Let's get your task done",
                  style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),

        ],
      ),
    ),
  ),
);
  }
}
  

