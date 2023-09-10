import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_practice/auth/auth_form.dart';
import 'package:hive_practice/authfunctions/signin_func.dart';

import '../pages/homescreen.dart';

class signIn extends StatefulWidget {
  const signIn({super.key});

  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {
  final _formkey = GlobalKey<FormState>();
  var _email = '';
  final _password = '';
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Form(
            key: _formkey,
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.25),
                Align(
                  alignment: const Alignment(-0.8, 1),
                  child: Text(
                    'Login to Notes',
                    style: GoogleFonts.lato(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
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
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value!.toString().length < 6) {
                        return 'password should be greater than 6 characters';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    color: Colors.white,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          _formkey.currentState!.save();
                          signin(_email, _password);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: Text('Login',
                          style: GoogleFonts.lato(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Dont have an account?',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AuthForm()));
                        },
                        child: const Text(
                          'SignUp',
                          style: TextStyle(color: Colors.red),
                        )),
                  ],
                )
              ],
            )));
  }
}
