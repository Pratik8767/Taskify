import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/authentication/SignUp.dart';
import 'package:todo_list/ui/homescreen.dart';
import 'package:todo_list/provider/appprovider.dart';
import 'package:todo_list/utils/const_widgets.dart';

class LogIn extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LogIn> {
  void navigateToSignUp(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: ((context) => const SignUp2())));
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailText = TextEditingController();
    TextEditingController passText = TextEditingController();
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);

    bool isObscure = appProvider.isVisible[0];

    final constWidgets = ConstWidgets();

    void login() async {
      String email = emailText.text.trim();
      String password = passText.text.trim();

      if (email == "" || password == "") {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Please fill all the information")));
      } else {
        try {
          UserCredential userCredential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);

          if (userCredential.user != null) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Good to see you again!")));
            Navigator.popUntil(context, (route) => route.isFirst);
            Navigator.pushReplacement(context,
                CupertinoPageRoute(builder: (context) => const HomeScreen()));
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
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
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
                        text: "Log-In",
                        fontSize: 25,
                        color: Colors.deepPurple.shade800),
                    const SizedBox(
                      height: 50,
                    ),
                    TextField(
                      controller: emailText,
                      decoration: const InputDecoration(
                          hintText: "Enter Your Email",
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.yellow,
                          )),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextField(
                      controller: passText,
                      obscureText: isObscure,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: "Enter Your Password",
                          prefixIcon: const Icon(
                            Icons.key,
                            color: Colors.white,
                          ),
                          suffixIcon: IconButton(
                            icon: IconButton(
                                onPressed: () {
                                  appProvider.toggleVisibility(0);
                                },
                                icon: Icon(
                                  isObscure
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.white,
                                )),
                            onPressed: () {},
                          )),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          login();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.only(
                                left: 100, right: 100, top: 15, bottom: 15)),
                        child: Text(
                          "Log-In",
                          style: TextStyle(
                              color: Colors.deepPurple.shade800,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        )),
                    const SizedBox(
                      height: 16,
                    ),
                    TextButton(
                        onPressed: () {
                          navigateToSignUp(context);
                        },
                        child: const Text(
                          "New user?Sign Up here",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
