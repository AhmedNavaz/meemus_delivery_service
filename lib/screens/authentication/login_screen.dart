import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meemus_delivery_service/constants/controllers.dart';
import 'package:meemus_delivery_service/router_generator.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool obSecure = true;

  void _submitForm() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      navigationController.getOffAll(homeRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/auth_background.png",
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              decoration:
                  BoxDecoration(color: Colors.grey.shade800.withOpacity(0.4)),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 100),
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Hello Again!',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      const Text(
                        'Welcome back you\'ve been missed!',
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Card(
                              elevation: 5,
                              color: Colors.grey.shade100,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 10),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !value.contains('@')) {
                                      return 'Please enter a valid email';
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: emailController,
                                  cursorColor: Colors.pink.shade400,
                                  decoration: InputDecoration(
                                    hintText: 'Enter Your Email',
                                    hintStyle: TextStyle(
                                      color: Colors.grey.shade600,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01),
                            Card(
                              elevation: 5,
                              color: Colors.grey.shade100,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 10),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty || value.length <= 6) {
                                      return 'Password must be atleast 6 characters';
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: passwordController,
                                  cursorColor: Colors.pink.shade400,
                                  obscureText: obSecure,
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    hintStyle: TextStyle(
                                      color: Colors.grey.shade600,
                                    ),
                                    border: InputBorder.none,
                                    suffixIcon: obSecure
                                        ? IconButton(
                                            icon: Icon(
                                                Icons.visibility_off_outlined,
                                                color: Colors.grey.shade600),
                                            onPressed: () => setState(
                                                () => obSecure = !obSecure),
                                          )
                                        : IconButton(
                                            icon: Icon(
                                              Icons.visibility_outlined,
                                              color: Colors.pink.shade400,
                                            ),
                                            onPressed: () => setState(
                                                () => obSecure = !obSecure),
                                          ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.04),
                            ElevatedButton(
                              onPressed: () {
                                _submitForm();
                              },
                              child: const Text('Sign In'),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                primary: Colors.pink.shade200,
                                onPrimary: Colors.white,
                                minimumSize: const Size(300, 60),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06),
                      Row(children: [
                        Expanded(child: Divider(color: Colors.grey.shade800)),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Or Continue With",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Expanded(child: Divider(color: Colors.grey.shade800)),
                      ]),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.white54,
                                  )),
                              child: Image.asset(
                                  'assets/images/google_logo.png',
                                  width: 30,
                                  height: 30)),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.white54,
                                  )),
                              child: Image.asset('assets/images/apple_logo.png',
                                  width: 30, height: 30)),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.white54,
                                  )),
                              child: Image.asset(
                                  'assets/images/facebook_logo.png',
                                  width: 30,
                                  height: 30)),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Not a member?'),
                          TextButton(
                            onPressed: () {
                              navigationController.getOffAll(signupRoute);
                            },
                            child: const Text('Register Now',
                                style:
                                    TextStyle(fontWeight: FontWeight.normal)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
