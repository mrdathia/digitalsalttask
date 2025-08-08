import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';

void main() async {
  await initApp();
  runApp(const ProviderScope(child: MyApp()));
}

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}
