// import 'package:flutter/material.dart';

// class mytabs extends StatelessWidget {

//   final String text;
//   final double w;
//   final double h;
//   final int c_val;
//   final int i;
//   const mytabs({super.key, required this.text, required this.w, required this.h ,required this.c_val,required this.i});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//                     height: 40,
//                     width:  tabwidth[index],
//                     margin: EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       border: Border.all(color: current == index
//                                   ? Colors.white70
//                                   : Colors.white54),
//                       borderRadius: BorderRadius.circular(30),
//                       color: Colors.transparent,
//                     ),
//                     child: Center(child: Text(tabtext[index],style: TextStyle(color: current == index
//                                   ? Colors.white70
//                                   : Colors.white54,fontSize: 20,fontWeight: FontWeight.w400),)),
//                   );
//   }
// }