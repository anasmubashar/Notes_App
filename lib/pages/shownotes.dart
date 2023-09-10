import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_practice/pages/homescreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class shownotes extends StatefulWidget {
  final String notesText;
  final String titleText;
  final String doc_id;
  const shownotes({
    Key? key,
    required this.notesText,
    required this.titleText,
    required this.doc_id,
  }) : super(key: key);
  @override
  State<shownotes> createState() => _shownotesState();
}

class _shownotesState extends State<shownotes> {
  TextEditingController titleController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    titleController.text = widget.titleText;
    notesController.text = widget.notesText;
    super.initState();
  }

//changes made by the user to the text fields are properly managed:
  @override
  void dispose() {
    titleController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 236, 201),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
        actions: [
          IconButton(
              onPressed: () async {
                //update the document fields:
                await FirebaseFirestore.instance
                    .collection('notes')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection('mynotes')
                    .doc(widget.doc_id)
                    .update({
                  'title': titleController.text,
                  'notes': notesController.text,
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Note Updated',
                      style: GoogleFonts.lora(
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                    backgroundColor: Colors.white,
                  ),
                );
              },
              icon: const Icon(
                Icons.save,
                color: Colors.green,
              ))
        ],
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
