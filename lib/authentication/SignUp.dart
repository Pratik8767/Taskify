import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/provider/appprovider.dart';

import '../utils/const_widgets.dart';

class SignUp2 extends StatefulWidget {
  const SignUp2({super.key});

  @override
  State<SignUp2> createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passcontroller = TextEditingController();
    TextEditingController cpasscontroller = TextEditingController();
    final constWidgets = ConstWidgets();
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);

    bool isObscure = appProvider.isVisible[1];

    void createAccount() async {
      String email = emailcontroller.text.trim();
      String password = passcontroller.text.trim();
      String cpassword = cpasscontroller.text.trim();
      if (email == "" || password == "" || cpassword == "") {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Please fill all the information")));
      } else if (password != cpassword) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Row(
          children: [
            Icon(
              Icons.cancel,
              color: Colors.red,
            ),
            SizedBox(
              width: 10,
            ),
            Text("Password do not match!"),
          ],
        )));
      } else {
        try {
          //create new account
          UserCredential userCredential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password);
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Row(
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
              SizedBox(
                width: 10,
              ),
              Text("Success! Let's dive in."),
            ],
          )));

          if (userCredential.user != null) {
            Navigator.pop(context);
          }
        } on FirebaseAuthException catch (ex) {
          print(ex.code.toString());
        }
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Colors.white,
              Colors.deepPurple.shade500,
            ])),
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                ),
                SvgPicture.asset(
                  "assets/images/Gemini_Generated_Image_vlu3oavlu3oavlu3.svg",
                  height: 200,
                  width: 200,
                ),
                constWidgets.logoTextWidget(
                    text: "Sign-Up",
                    fontSize: 25,
                    color: Colors.deepPurple.shade800),
                const SizedBox(
                  height: 50,
                ),
                TextField(
                  controller: emailcontroller,
                  decoration: const InputDecoration(
                      hintText: "Enter Email",
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.yellow,
                      )),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: passcontroller,
                  obscureText: isObscure,
                  decoration: InputDecoration(
                      hintText: "Enter Your Password",
                      prefixIcon: const Icon(
                        Icons.key,
                        color: Colors.white,
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            appProvider.toggleVisibility(1);
                          },
                          icon: Icon(
                            isObscure ? Icons.visibility_off : Icons.visibility,
                            color: Colors.white,
                          ))),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: cpasscontroller,
                  decoration: const InputDecoration(
                    hintText: "Confirm your Password",
                    prefixIcon: Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    onPressed: () {
                      createAccount();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.only(
                            left: 100, right: 100, top: 15, bottom: 15)),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.deepPurple.shade800,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ))
              ],
            ),
          ),
        ),
      ),
      // Add sign-up content here
    );
  }
}
