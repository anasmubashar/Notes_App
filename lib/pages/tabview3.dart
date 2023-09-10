import 'package:flutter/material.dart';

class tabview3 extends StatefulWidget {
  const tabview3({super.key});

  @override
  State<tabview3> createState() => _tabview3State();
}

class _tabview3State extends State<tabview3> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
    
             child: const Center(child: Text('To-do',style: TextStyle(color: Colors.white,fontSize: 25),)),
    
      ),
    );
  }
}