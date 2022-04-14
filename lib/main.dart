import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testnet/providers/auth.dart';
import 'package:testnet/providers/user.dart';
import 'package:testnet/theme/theme.dart';
import 'package:testnet/view/auth/log_in.dart';
import 'package:testnet/view/auth/sign_up.dart';
import 'package:testnet/view/auth/sign_up_password.dart';
import 'package:testnet/view/edit_job.dart';
import 'package:testnet/view/menu/menu.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        title: 'Testnet',
        theme: ThemeSettings.myTheme,
        routes: {
          LogInScreen.route: (_) => const LogInScreen(),
          SignUpScreen.route: (_) => const SignUpScreen(),
          SignUpPasswordScreen.route: (_) => const SignUpPasswordScreen(),
          MenuScreen.route: (_) => const MenuScreen(),
          EditJobScreen.route: (_) => const EditJobScreen(),
        },
        home: const LogInScreen(),
      ),
    );
  }
}
