import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wereal_v2/features/auth/service/auth_service.dart';
import 'package:wereal_v2/utils/routes/routes.dart';

import 'features/roadmap/view/roadmap/questions.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider(create: (context) => AuthenticationProvider()),
      ],
      child: MaterialApp(
        title: 'Wereal V2',
        initialRoute: '/sign-in',
        routes: AppRoutes.routes,
      ),
    );
  }
}
