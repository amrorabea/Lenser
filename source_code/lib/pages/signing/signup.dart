import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(const SignUp());
}

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  get kPrimaryColor => null;
  get validator => null;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Center(
          child: Column(
            children: [
              SizedBox(height: 60),
              Text(
                "Welcome onboard!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(height: 10),
              Text(
                "let's help you meet up your tasks\nyour tasks",
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Enter email'),
                    EmailValidator(errorText: 'Please correct email filled'),
                  ]),
                  decoration: InputDecoration(
                      hintText: 'Enter your Email',
                      labelText: 'Enter Email',
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.lightBlue,
                      ),
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius:
                              BorderRadius.all(Radius.circular(9.0)))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Enter Full name'),
                    MinLengthValidator(3,
                        errorText: 'Minimum 3 charecter filled name'),
                  ]),
                  decoration: const InputDecoration(
                      hintText: 'Enter Full Name',
                      labelText: 'Full name',
                      //alignment: Alignment.center,

                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.green,
                      ),
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius:
                              BorderRadius.all(Radius.circular(9.0)))),
                ),
              ),
              Container(
                height: 400,
                alignment: Alignment.center,
                padding: EdgeInsets.all(11),
                child: Column(
                  children: [
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter Password Here",
                          labelText: "Password",
                          errorStyle: TextStyle(fontSize: 18.0),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)))),
                    ),
                    Container(
                        height: 300,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(30),
                        child: Column(
                          children: [
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: "confirm Password",
                                  labelText: "confirm Password",
                                  errorStyle: TextStyle(fontSize: 18.0),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)))),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ObjectDetection(),
                                  ),
                                );
                              }, // takes us to the home page
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(200, 60),
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              child: const Text(
                                "Sign up",
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}

class ObjectDetection extends StatelessWidget {
  const ObjectDetection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
