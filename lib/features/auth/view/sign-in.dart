import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../service/auth_service.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: Provider.of<AuthenticationProvider>(context, listen: false)
              .signInWithGoogle(),
          builder: (context, future) {
            if (future.data != null && future.data!) {
              WidgetsBinding.instance
                  .addPostFrameCallback((_) {
                
                Navigator.pushReplacementNamed(context, '/questions');
              });
              
              
            }
            return Text(
              "Wereal",
              style: GoogleFonts.pacifico(
                fontSize: 70,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      ),
    );
  }
}
