

import 'package:amazon/resources/authentication_methods.dart';
import 'package:amazon/screens/sign_in_screen.dart';
import 'package:amazon/utils/constants.dart';
import 'package:amazon/utils/utils.dart';
import 'package:amazon/widgets/custom_main_button.dart';
import 'package:amazon/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthenticationMethods authenticationMethods = AuthenticationMethods();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    amazonLogo,
                    height: screenSize.height * 0.10,
                  ),
                  SizedBox(
                    height: screenSize.height *0.7,
                    child: FittedBox(
                      child: Container(
                        height: screenSize.height * 0.85,
                        width: screenSize.width * 0.8,
                        padding: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        )),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Sign-Up",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 33),
                            ),
                            TextFieldWidget(
                                title: "Name",
                                controller: nameController,
                                obscureText: false,
                                hintText: "Enter your name"),
                            TextFieldWidget(
                                title: "Address",
                                controller: addressController,
                                obscureText: false,
                                hintText: "Enter your address"),
                            TextFieldWidget(
                                title: "Email",
                                controller: emailController,
                                obscureText: false,
                                hintText: "Enter your email"),
                            TextFieldWidget(
                                title: "Password",
                                controller: passwordController,
                                obscureText: true,
                                hintText: "Enter your password"),
                            Align(
                              alignment: Alignment.center,
                              child: CustomMainButton(
                                  color: Colors.yellow,
                                  isLoading: false,
                                  onPressed: () async{
                                    setState(() {
                                      isLoading = isLoading;
                                    });
                                   String output= await authenticationMethods.signUpUser(
                                      name: nameController.text,
                                       address: addressController.text,
                                        email: emailController.text,
                                         password: passwordController.text);
                                         setState(() {
                                           isLoading = false;
                                         });

                                         if (output== "success"){
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(builder: (_) =>
                                            const SignInScreen()));
                                         }else{
                                        //error
                                        Utils().showSnackBar(context: context, content: output);
                                         }
                                  },
                                  child: const Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        letterSpacing: 0.6, color: Colors.black),
                                  )
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              
                  CustomMainButton(
                      color: Colors.grey[400]!,
                      isLoading: false,
                      onPressed: () {
                        Navigator.pushReplacement(context,
                         MaterialPageRoute(builder: (context){
                          return const SignInScreen();
                        }));
                      },
                      child: Text(
                        "Back",
                        style:
                            TextStyle(letterSpacing: 0.6, color: Colors.black),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
