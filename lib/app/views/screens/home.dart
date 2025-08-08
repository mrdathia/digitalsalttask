import 'package:digitalsalttask/app/navigations/app_routes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onDoubleTap: (){
          Navigator.of(context).pushReplacementNamed(AppRoutes.login);
        },
        child: Text("Unleash Your Books"),
      ),
    );
  }

}