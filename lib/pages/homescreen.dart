import 'package:flutter/material.dart';
import 'package:hive_practice/auth/auth_form.dart';
import 'package:hive_practice/pages/tabview1.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // int current = 0;
  // String uid = '';

  // @override
  // void initState() {
  //   getuid();
  //   super.initState();
  //   //getUID();
  // }

  // getuid() async {
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   User? user = auth.currentUser;
  //   setState(() {
  //     uid = user!.uid;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    // final List<String> tabtext = ["All", "Important", "To-do"];
    // final List<double> tabwidth = [70, 120, 80];

    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: h,
        width: w,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My',
                        style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Notes',
                          style: TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.logout_rounded,
                        color: Colors.red,
                      ),
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false, // user must tap button!
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text(
                              'Logout',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            content:
                                const Text('Are you sure you want to logout?'),
                            actions: [
                              TextButton(
                                child: const Text('Yes'),
                                onPressed: () async {
                                  await FirebaseAuth.instance.signOut();
                                  Navigator.pop(context); // Close the dialog
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AuthForm())); // Navigate to signup page
                                },
                              ),
                              TextButton(
                                child: const Text('No'),
                                onPressed: () {
                                  Navigator.pop(context); // Close the dialog
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: SizedBox(
            //     height: 60,
            //     child: ListView.builder(
            //         scrollDirection: Axis.horizontal,
            //         // shrinkWrap: true,
            //         itemCount: 3,
            //         //scrollDirection: Axis.vertical,
            //         itemBuilder: (context, index) {
            //           return GestureDetector(
            //             onTap: () {
            //               setState(() {
            //                 current = index;
            //               });
            //             },
            //             child: Container(
            //               height: 40,
            //               width: tabwidth[index],
            //               margin: const EdgeInsets.all(8),
            //               decoration: BoxDecoration(
            //                 border: Border.all(
            //                     color: current == index
            //                         ? Colors.white
            //                         : Colors.grey),
            //                 borderRadius: BorderRadius.circular(30),
            //                 color: Colors.transparent,
            //               ),
            //               child: Center(
            //                   child: Text(
            //                 tabtext[index],
            //                 style: TextStyle(
            //                     color: current == index
            //                         ? Colors.white
            //                         : Colors.grey,
            //                     fontSize: 20,
            //                     fontWeight: FontWeight.w400),
            //               )),
            //             ),
            //           );
            //         }),
            //   ),
            // ),

            const tabview1(),
          ],
        ),
      ),
      // bottomNavigationBar:
      //     // alignment: Alignment(0, 1),
      //     FloatingActionButton(
      //   backgroundColor: Colors.white,
      //   onPressed: () {
      //     Navigator.push(
      //         context, MaterialPageRoute(builder: ((context) => addScreen())));
      //   },
      //   child: const Icon(
      //     Icons.add,
      //     color: Colors.black,
      //   ),
      // ),
    );
  }
}
