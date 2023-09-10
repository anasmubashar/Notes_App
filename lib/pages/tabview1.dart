import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_practice/pages/addScreen.dart';
import 'package:hive_practice/pages/shownotes.dart';

class tabview1 extends StatefulWidget {
  const tabview1({super.key});

  @override
  State<tabview1> createState() => _tabview1State();
}

class _tabview1State extends State<tabview1> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // User? _user;

  // @override
  // void initState() {
  //   super.initState();

  //   _auth.authStateChanges().listen((User? user) {
  //     setState(() {
  //       _user = user;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // String? uid = Provider.of<UserProvider>(context).uid;

    // List<Color> gridColor = [
    //   const Color(0xfff7d44C),
    //   const Color(0xffeb7a53),
    //   const Color(0xff98b7db),
    //   const Color(0xffa8d672),
    //   const Color(0xfff6ecc9)
    // ];
    User? user = FirebaseAuth.instance.currentUser;
    String? uid = user?.uid;

    return Expanded(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('notes')
            .doc(uid)
            .collection('mynotes')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Stack(
              children: [
                GridView.builder(
                  itemCount: snapshot.data!.docs.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: ((context, index) {
                    DocumentSnapshot ds = snapshot.data!.docs[index];
                    return InkWell(
                      child: Container(
                        //margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 8,
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () async {
                                      await FirebaseFirestore.instance
                                          .collection('notes')
                                          .doc(uid)
                                          .collection('mynotes')
                                          .doc(ds.id)
                                          .delete();
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(ds['title'],
                                  style: GoogleFonts.lato(
                                      fontSize: 24,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(ds['notes'],
                                  style: GoogleFonts.lato(
                                      fontSize: 16, color: Colors.black)),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => shownotes(
                                      titleText: ds['title'],
                                      notesText: ds['notes'],
                                      doc_id: ds.id,
                                    ))));
                      },
                    );
                  }),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const addScreen())));
                    },
                    child: const Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
