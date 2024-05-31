import 'package:flutter/material.dart';
import 'package:getx_practice/components/textComponents.dart';
import 'package:getx_practice/ui/home/home.dart';
import 'package:getx_practice/ui/login/login.dart';
import 'package:getx_practice/utils/color.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.black,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Column(
                  children: <Widget>[
                    SizedBox(height: 60.0),
                    Text(
                      "Sign up",
                      style: TextStyles.header,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Create your account",
                      style: TextStyles.subHeader,
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    TextField(
                      style: TextStyles.inputText,
                      decoration: InputDecoration(
                          hintText: "Username",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none),
                          fillColor: AppColors.grey,
                          filled: true,
                          prefixIcon: const Icon(
                            Icons.person,
                            color: AppColors.black,
                          )),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      style: TextStyles.inputText,
                      decoration: InputDecoration(
                          hintText: "Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none),
                          fillColor: AppColors.grey,
                          filled: true,
                          prefixIcon: const Icon(
                            Icons.email,
                            color: AppColors.black,
                          )),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      style: TextStyles.inputText,
                      decoration: InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none),
                        fillColor: AppColors.grey,
                        filled: true,
                        prefixIcon: const Icon(
                          Icons.password,
                          color: AppColors.black,
                        ),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      style: TextStyles.inputText,
                      decoration: InputDecoration(
                        hintText: "Confirm Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none),
                        fillColor: AppColors.grey,
                        filled: true,
                        prefixIcon: const Icon(
                          Icons.password,
                          color: AppColors.black,
                        ),
                      ),
                      obscureText: true,
                    ),
                  ],
                ),
                Container(
                    padding: const EdgeInsets.only(top: 3, left: 3),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeView()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: AppColors.purple,
                      ),
                      child: const Text(
                        "Sign up",
                        style: TextStyles.buttonText,
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("Already have an account?",
                        style: TextStyles.subHeader),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                        child: const Text(
                          "Login",
                          style: TextStyles.linkText,
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
