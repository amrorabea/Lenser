import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:source_code/components/colors.dart';
import 'package:source_code/components/theme.dart';
import 'package:source_code/pages/signing/signup.dart';

void main() {
  runApp(const SignUp());
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  get kPrimaryColor => null;
  get validator => null;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<UiProvider>(
      builder: (context, UiProvider notifier, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: Column(
              children: [
                const SizedBox(height: 140),
                const Text(
                  "Welcome Back!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
                  child: TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(
                        errorText: 'Enter Email',
                      ),
                      MinLengthValidator(
                        3,
                        errorText: 'Minimum 3 charecter filled name',
                      ),
                    ]),
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
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 20 , bottom: 10),
                  child: const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
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

                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
               child: Divider(thickness: 2),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // CHECK INFO HERE AND STORE IT IN THE FIREBASE
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
                    "Login",
                    
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
                      "Dont'n Have An Account?",
                      style: TextStyle(
                        
                        fontSize: 15,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUp(),
                          ),
                        );
                      },
                      child: const Text(
                        " Sign up",
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
        );
      },
    );
  }
}
