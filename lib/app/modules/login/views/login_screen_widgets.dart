import 'package:flutter/material.dart';

class LoginWidgets {
  Widget social_media_login_button(
      {required Color container_color,
      required String buttonicon,
      required String buttontext,
      required Function() onTap}) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 130, top: 10, bottom: 10),
        decoration: BoxDecoration(
          color: container_color,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30, width: 30, child: Image.asset(buttonicon)),
            SizedBox(
              width: 110,
            ),
            Text(
              buttontext,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      onTap: onTap,
    );
  }

  Widget Spacer() {
    return SizedBox(
      height: 5,
    );
  }
}
