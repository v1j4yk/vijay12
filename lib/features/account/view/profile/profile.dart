import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wereal_v2/features/auth/service/auth_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<AuthenticationProvider>(
        builder: (context, provider, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(provider.userCredential!.user!.displayName!),
                Text(provider.userCredential!.user!.email!),
                ElevatedButton(
                  onPressed: () {
                    provider.signOut();
                    Navigator.pushReplacementNamed(context, '/sign-in');
                  },
                  child: Text("Sign-Out"),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
