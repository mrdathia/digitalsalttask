import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/login.dart';
import 'login.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginNotifier = ref.watch(loginNotifierProvider.notifier);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ref.watch(loginNotifierProvider.select((s) => s.isFresh)) ? const LoginScreen() : const LoginScreen(),
          ],
        ),
      ),
    );
  }
}
