import 'package:flutter/material.dart';
import 'package:testnet/theme/theme.dart';
import 'package:testnet/view/auth/sign_up_password.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testnet',
      theme: ThemeSettings.myTheme,
      home: const SignUpPasswordScreen(),
    );
  }
}

//https://github.com/Enri-code/Testnet