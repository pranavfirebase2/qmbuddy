import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    return MaterialApp(
      title: 'QMBUDDY ($flavor)',
      home: Scaffold(
        appBar: AppBar(title: Text('QMBUDDY Customer/Shop/Staff - $flavor')),
        body: const Center(child: Text('Unified App')),
      ),
    );
  }
}
