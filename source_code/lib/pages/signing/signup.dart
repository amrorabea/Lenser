// ignore_for_file: must_be_immutable, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:source_code/Auth/Auth.dart';
import 'package:source_code/components/containers.dart';
import 'package:source_code/pages/signing/login.dart';

void main() {
  runApp(signupScreen());
}

class signupScreen extends StatelessWidget {
  signupScreen({super.key});

  get kPrimaryColor => null;
  get validator => null;
  final _Key = GlobalKey<FormState>();
  Auth auth = Auth();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerpassword = TextEditingController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<UiProvider>(
      builder: (context, UiProvider notifier, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Form(
            key: _Key,
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 140),
                  const Text(
                    "Welcome onboard!",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Let's help you meet up\nyour tasks",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 50),
                    child: TextFormField(
                      controller: controllerEmail,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This email is a required';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: '    Email',
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 3,
                            color: buttonColor,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        labelStyle: TextStyle(
                          color: buttonColor,
                          fontWeight: FontWeight.bold,
                        ),
                        errorStyle: TextStyle(fontSize: 18.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 20, bottom: 10),
                    child: TextFormField(
                      controller: controllerpassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This password is a required';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "    Password",
                        hintStyle: TextStyle(color: buttonColor),
                        filled: true,
                        fillColor: Colors.white,
                        errorStyle: TextStyle(fontSize: 18.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 3,
                            color: buttonColor,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        labelStyle: TextStyle(
                          color: buttonColor,
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 30, right: 30, top: 10),
                    child: Divider(thickness: 2),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_Key.currentState!.validate()) {
                        auth.createUserWithEmailAndPassword(
                            controllerEmail.text,
                            controllerpassword.text,
                            context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(260, 60),
                      backgroundColor: buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => loginScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          " Login",
                          style: TextStyle(
                            fontSize: 15,
                            color: buttonColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
