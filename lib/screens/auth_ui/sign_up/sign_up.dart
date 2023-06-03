import 'package:ebuy/constants/constants.dart';
import 'package:ebuy/firebase/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:ebuy/screens/auth_ui/login/login.dart';
import 'package:ebuy/screens/home/home.dart';
import 'package:ebuy/widgets/primary_button/primary_button.dart';
import 'package:ebuy/widgets/top_titles/top_titles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ebuy/constants/routes.dart';

class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => _SignUpState();
}

class _SignUpState extends State<SingUp> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  bool isShowPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false, //cho phep tran hinh
      //appBar: AppBar(),//nut back
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopTitles(
                  title: "Create Account",
                  subtitle: "Welcome back to e buy App"),
              const SizedBox(
                height: 46.0,
              ),
              TextFormField(
                controller: name,
                decoration: const InputDecoration(
                    hintText: "Name",
                    prefixIcon: Icon(
                      Icons.person_outline,
                    )),
              ),
              const SizedBox(
                height: 12.0,
              ),
              TextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
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
                controller: phone,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    hintText: "Phone",
                    prefixIcon: Icon(
                      Icons.phone_outlined,
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
                        ))),
              ),
              const SizedBox(
                height: 24.0,
              ),
              PrimaryButton(
                title: "Create an Account",
                onPressed: () async {
                  bool isVaildated = signUpVaidation(
                      email.text, password.text, name.text, phone.text);
                  if (isVaildated) {
                    bool isLogined = await FirebaseAuthHelper.instance
                        .signUp(email.text, password.text, context);
                    if (isLogined) {
                      Routes.instance.pushAndRemoveUntil(
                          widget: const Login(), context: context);
                    }
                  }
                },
              ),
              const SizedBox(
                height: 12.0,
              ),
              const Center(child: Text("I have alredy an account?")),
              const SizedBox(
                height: 12.0,
              ),
              Center(
                child: CupertinoButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
