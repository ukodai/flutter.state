import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "login_provider.dart";

class LoginExample extends StatefulWidget {
  const LoginExample({super.key});

  @override
  State<LoginExample> createState() => _LoginExampleState();
}

class _LoginExampleState extends State<LoginExample> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    debugPrint("Building UI: Login Example");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Example"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Email",
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Password",
              ),
            ),
          ),
          const SizedBox(height: 50),
          Consumer<LoginProvider>(
            builder: (context, value, child) => ElevatedButton(
              onPressed: () async {
                bool isLogged = await value.getLogged(
                  emailController.text,
                  passwordController.text,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      isLogged ? "Login Successful" : "Login Unsuccessful",
                    ),
                  ),
                );
              },
              child: value.getLoading
                  ? const Text("Loading...")
                  : const Text("Login"),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
