import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_practice/crud_operations/crud.dart';
import 'package:hive_practice/pages/homescreen.dart';

class addScreen extends StatefulWidget {
  const addScreen({super.key});

  @override
  State<addScreen> createState() => _addScreenState();
}

class _addScreenState extends State<addScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 236, 201),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          InkWell(
            child: const Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(
                Icons.save,
                color: Colors.green,
              ),
            ),
            onTap: () {
              if (titleController.text.isNotEmpty &&
                  notesController.text.isNotEmpty) {
                addTask(titleController.text, notesController.text);
                final snackBar = SnackBar(
                  content: Text('Note Saved',
                      style: GoogleFonts.lora(
                          fontWeight: FontWeight.w300, color: Colors.black)),
                  duration: const Duration(seconds: 1),
                  backgroundColor: Colors.white,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Title and Notes cannot be empty',
                      style: GoogleFonts.lora(
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                    backgroundColor: Colors.white,
                  ),
                );
              }
            },
          ),
        ],
        leading: Align(
          alignment: const Alignment(1, 1),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
            child: InkWell(
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey.shade500.withOpacity(0.4)),
                child: const Align(
                  alignment: Alignment(0.3, 0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => const HomePage())));
              },
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: TextField(
              controller: titleController,
              cursorColor: Colors.red,
              // expands: true,
              maxLines: 3,

              style: GoogleFonts.lora(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                letterSpacing: 0,
                wordSpacing: 5,
              ),
              decoration: InputDecoration(
                  hintText: 'Heading',
                  hintStyle: GoogleFonts.lora(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0,
                    wordSpacing: 5,
                  ),
                  border: InputBorder.none),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: TextField(
                controller: notesController,
                expands: true,
                maxLines: null,
                cursorColor: Colors.red,
                style: GoogleFonts.lora(
                  fontSize: 20,
                  wordSpacing: 1,
                  fontWeight: FontWeight.w200,
                ),
                decoration: InputDecoration(
                  hintText: 'Write your note here',
                  hintStyle: GoogleFonts.lora(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
