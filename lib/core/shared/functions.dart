import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void navigateAndRelease(context, Widget screen) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) => screen,
    ),
        (route) => false,
  );
}


void showToastMessage({required String message, Color? toastColor})
{
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: toastColor,
      textColor: Colors.white,
      fontSize: 16.0
  );

}