import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../service/auth_service.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  Future<void> _handleSignIn(BuildContext context) async {
    final isAuthenticated =
        await Provider.of<AuthenticationProvider>(context, listen: false)
            .signInWithGoogle();

    if (isAuthenticated) {
      Fluttertoast.showToast(msg: 'Login Successful');
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handleSignIn(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Wereal",
          style: GoogleFonts.pacifico(
            fontSize: 70,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
