import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qmbuddy/core/routing/customer_router.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // TODO: Initialize Firebase for DEV here
  // await Firebase.initializeApp();

  runApp(const ProviderScope(child: QmBuddyApp(flavor: 'dev')));
}

class QmBuddyApp extends StatelessWidget {
  final String flavor;
  const QmBuddyApp({super.key, required this.flavor});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'QMBUDDY ($flavor)',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: customerRouter,
    );
  }
}
