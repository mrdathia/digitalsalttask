import 'package:digitalsalttask/app/navigations/app_routes.dart';
import 'package:digitalsalttask/app/views/atoms/expanded_elevated_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                ExpandedElevatedButton(childWidget: childWidget, onPressed: ()=>)
              ],
            )
          ],
        ),
      )
    );
  }
}