import 'package:flutter/material.dart';
import 'package:wereal_v2/features/account/view/profile/profile.dart';
import 'package:wereal_v2/features/auth/view/sign-in.dart';
import 'package:wereal_v2/features/roadmap/view/roadmap/questions.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/questions': (context) => QuestionsPage(),
    '/sign-in': (context) => SignInPage(),
    '/account': (context) => ProfilePage(),
  };
}
