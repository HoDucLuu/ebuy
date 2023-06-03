import 'package:ebuy/screens/auth_ui/login/login.dart';
import 'package:ebuy/screens/auth_ui/sign_up/sign_up.dart';
import 'package:ebuy/widgets/primary_button/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ebuy/constants/assets_image.dart';
import 'package:ebuy/widgets/top_titles/top_titles.dart';
import 'package:ebuy/constants/routes.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopTitles(
              title: "Welcome", subtitle: "Buy any item from using app"),
          Center(
              child: Image.asset(
            AssetsImage.instance.welcomeImage,
            alignment: Alignment.center,
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  child: const Icon(
                    Icons.facebook,
                    size: 35,
                    color: Colors.blue,
                  )),
              const SizedBox(
                width: 5,
              ),
              CupertinoButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  child: Image.asset(
                    AssetsImage.instance.googleImge,
                    scale: 45.0,
                  ))
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          PrimaryButton(
            title: "Login",
            onPressed: () {
              Routes.instance.push(widget: const Login(), context: context);
            },
          ),
          const SizedBox(
            height: 18,
          ),
          PrimaryButton(
            title: "Sign Up",
            onPressed: () {
              Routes.instance.push(widget: const SingUp(), context: context);
            },
          ),
        ],
      ),
    ));
  }
}
