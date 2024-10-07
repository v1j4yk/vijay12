import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wereal_v2/features/auth/service/auth_service.dart';
import 'package:wereal_v2/features/roadmap/service/roadmap_service.dart';
import 'package:wereal_v2/utils/routes/routes.dart';

import 'features/roadmap/view/roadmap/questions_page.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ListenableProvider(create: (context) => AuthenticationProvider()),
    ChangeNotifierProvider(create: (context) => RoadMapService()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var val = Provider.of<AuthenticationProvider>(context,listen: false).checkSignin();
    return MaterialApp(
      title: 'Wereal V2',
      debugShowCheckedModeBanner: false,
      initialRoute: val ? '/home' : '/sign-in',
      routes: AppRoutes.routes,
    );
  }
}
