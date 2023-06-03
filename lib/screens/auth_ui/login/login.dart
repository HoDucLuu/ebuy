import 'dart:html';

import 'package:ebuy/constants/constants.dart';
import 'package:ebuy/constants/routes.dart';
import 'package:ebuy/firebase/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:ebuy/screens/home/home.dart';
import 'package:ebuy/widgets/primary_button/primary_button.dart';
import 'package:ebuy/widgets/top_titles/top_titles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ebuy/screens/auth_ui/sign_up/sign_up.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isShowPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(),//nut back
        body: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopTitles(
              title: "Login", subtitle: "Welcome back to e buy App"),
          const SizedBox(
            height: 46.0,
          ),
          TextFormField(
            controller: email,
            decoration: const InputDecoration(
                hintText: "E-mail",
                prefixIcon: Icon(
                  Icons.email_outlined,
                )),
          ),
          const SizedBox(
            height: 12.0,
          ),
          TextFormField(
            controller: password,
            obscureText: isShowPassword, //an chu bang ky tu password
            decoration: InputDecoration(
              hintText: "Password",
              prefixIcon: const Icon(
                Icons.password_outlined,
              ),
              suffixIcon: CupertinoButton(
                onPressed: () {
                  setState(() {
                    isShowPassword = !isShowPassword;
                    print(isShowPassword);
                  });
                },
                padding: EdgeInsets.zero,
                child: const Icon(
                  Icons.visibility,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          PrimaryButton(
            title: "Login",
            onPressed: () async {
              Routes.instance.push(widget: const Home(), context: context);
              bool isVaildated = loginVaidation(email.text, password.text);
              if (isVaildated) {
                bool isLogined = await FirebaseAuthHelper.instance
                    .login(email.text, password.text, context);
                if (isLogined) {
                  Routes.instance.pushAndRemoveUntil(
                      widget: const Home(), context: context);
                }
              }
            },
          ),
          const SizedBox(
            height: 12.0,
          ),
          const Center(child: Text("Don't have an account?")),
          const SizedBox(
            height: 12.0,
          ),
          Center(
            child: CupertinoButton(
              onPressed: () {
                Routes.instance.push(widget: const SingUp(), context: context);
              },
              child: Text(
                "Create an account",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
