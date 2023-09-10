import 'package:flutter/material.dart';
import 'package:hive_practice/auth/signIn.dart';
import 'package:hive_practice/authfunctions/signup_func.dart';
import 'package:hive_practice/pages/homescreen.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formkey = GlobalKey<FormState>();
  var _email = '';
  var _password = '';
  var _username = '';
  bool isLoginPage = false;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            Align(
              alignment: const Alignment(-0.8, 1),
              child: Text(
                'Welcome to Notes',
                style: GoogleFonts.lato(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 3),
              child: TextFormField(
                keyboardType: TextInputType.name,
                key: const ValueKey('Username'),
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  filled: false,
                  label: const Text('Username'),
                  labelStyle: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  // hintStyle: TextStyle(
                  //   color: Colors.grey,
                  //   fontFamily: 'Poppins',
                  //   fontWeight: FontWeight.w400
                  // ),
                ),
                validator: (value) {
                  if (value!.toString().length < 4) {
                    return 'username too small';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  setState(() {
                    _username = value!;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                key: const ValueKey('email'),
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  label: const Text('Email'),
                  labelStyle: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                validator: (value) {
                  if (!value!.contains('@')) {
                    return 'invalid email';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                obscureText: _obscureText,
                key: const ValueKey('password'),
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                    label: const Text('password'),
                    labelStyle: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ))),
                validator: (value) {
                  if (value!.toString().length < 6) {
                    return 'password should be greater than 6 characters';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  _password = value!;
                },
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    _formkey.currentState!.save();
                    signup(_email, _password);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const HomePage()));
                  }
                },
                child: Text('SignUp',
                    style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already Signed Up?',
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const signIn()));
                    },
                    child: const Text('Login')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
