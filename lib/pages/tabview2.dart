import 'package:flutter/material.dart';

class tabview2 extends StatefulWidget {
  const tabview2({super.key});

  @override
  State<tabview2> createState() => _tabview2State();
}

class _tabview2State extends State<tabview2> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
    
             child: const Center(child: Text('Important',style: TextStyle(color: Colors.white,fontSize: 25),)),
    
      ),
    );
  }
}