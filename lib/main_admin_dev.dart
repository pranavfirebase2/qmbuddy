import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // TODO: Initialize Firebase for ADMIN DEV here
  // await Firebase.initializeApp();

  runApp(const ProviderScope(child: QmBuddyAdminApp(flavor: 'dev')));
}

class QmBuddyAdminApp extends StatelessWidget {
  final String flavor;
  const QmBuddyAdminApp({super.key, required this.flavor});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QMBUDDY Admin ($flavor)',
      home: Scaffold(
        appBar: AppBar(title: Text('Super Admin Dashboard - $flavor')),
        body: const Center(child: Text('Super Admin App')),
      ),
    );
  }
}
