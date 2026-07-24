import 'package:flutter/material.dart';



class DashboardScreen extends StatelessWidget{
  const DashboardScreen ({super.key});

  @override 
  Widget build (BuildContext context){
    var child;
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
                  SizedBox(height: 7,),
                 Text(
                  "Let's get your task done",
                  style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
                SizedBox(height: 20,),
                   TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search,
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

            SizedBox(height: 20,),
                Row(
                 children: [

                      Card(
                        color:  Colors.grey[900],
                           shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10),
                      ),
                          child: Container(
                          width: 80,
                          height: 130,
                      ),
                    ),

                  Spacer(),

                      Card(
                        color:  Colors.grey[900],
                           shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10),
                      ),
                          child: Container(
                          width: 80,
                          height: 130,
                        ),
                      ),

                    Spacer(),

                       Card(
                        color:  Colors.grey[900],
                           shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10),
                      ),
                          child: Container(
                          width: 80,
                          height: 130,
                        ),
                      ),

                      Spacer(),

                          Card(
                           color:  Colors.grey[900],
                           shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10),
                      ),
                              child: Container(
                              width: 80,
                              height: 130,
                            ),
                          ),
                      ],
                   ),
                      
                   SizedBox(height: 10,),

                    Card(
                      color:  Colors.grey[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Container(
                      width: 585,
                      height: 270,
                  ),
                ),

              SizedBox(height: 5,),
                
                    Card(
                      color:  Colors.grey[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                      width: 585,
                      height: 100,
                  ),
                ),
                  

             SizedBox(height: 12,),

                Row(
                   children: [
                      Card(
                        color: Colors.red,
                        child:Container (
                          width: 363,
                          height: 27,
                        ),
                      ),
                   ],
                ),

              ], 
            ),
          ),
        ),
      );
    }
  }
  

