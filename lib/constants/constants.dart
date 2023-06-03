import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showMessage(String message) {
  Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: Builder(builder: (context) {
      return SizedBox(
        width: 100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(
              color: Color(0xffe16555),
            ),
            const SizedBox(
              height: 18.0,
            ),
            Container(
              margin: const EdgeInsets.only(left: 7),
              child: const Text("Loading..."),
            )
          ],
        ),
      );
    }),
  );

  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}

String getMessageFromErrorCode(String errorCode) {
  switch (errorCode) {
    //1.37
  }
  return errorCode;
}

bool loginVaidation(String email, String password) {
  if (email.isEmpty && password.isEmpty) {
    showMessage("Vui lòng nhập Email và Mật khẩu");
    return false;
  } else if (email.isEmpty) {
    showMessage("Vui lòng nhập Email");
    return false;
  } else if (password.isEmpty) {
    showMessage("Vui lòng nhập Mật khẩu");
    return false;
  } else {
    return true;
  }
}

bool signUpVaidation(String email, String password, String name, String phone) {
  if (email.isEmpty && password.isEmpty && name.isEmpty && phone.isEmpty) {
    showMessage("Vui lòng nhập thông tin tài khoản");
    return false;
  } else if (email.isEmpty) {
    showMessage("Vui lòng nhập Email");
    return false;
  } else if (password.isEmpty) {
    showMessage("Vui lòng nhập Mật khẩu");
    return false;
  } else if (name.isEmpty) {
    showMessage("Vui lòng nhập tên");
    return false;
  } else if (phone.isEmpty) {
    showMessage("Vui lòng nhập Số điện thoại");
    return false;
  } else {
    return true;
  }
}
