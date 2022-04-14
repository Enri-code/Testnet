import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final formKey = GlobalKey<FormState>();
  var hideText = true;
  var email = '';
  var password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 32),
              const Text('Log into your account',
                  style: TextStyle(
                    fontSize: 19,
                    color: Color(0xff787878),
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(height: 52),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        hintText: 'Email address',
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                      toolbarOptions:
                          const ToolbarOptions(selectAll: true, paste: true),
                      validator: (val) {
                        return null;
                      },
                    ),
                    const SizedBox(height: 18),
                    TextFormField(
                      obscureText: hideText,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'password',
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(hideText
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () => setState(() => hideText = !hideText),
                        ),
                      ),
                      validator: (val) {
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 58,
                      child: ElevatedButton(
                        child: const Text('Login'),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {}
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Divider(),
              const SizedBox(height: 8),
              SizedBox(
                height: 58,
                child: OutlinedButton(
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image(
                              image: AssetImage('assets/images/google.png')),
                        ),
                        Expanded(
                            child: Center(
                                child: Text('Continue with Google',
                                    style:
                                        TextStyle(color: Color(0xff787878))))),
                      ],
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Don't have an account? "),
                    const SizedBox(width: 2),
                    TextButton(
                      child: const Text('Sign Up'),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
