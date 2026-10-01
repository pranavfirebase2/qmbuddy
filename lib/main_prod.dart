import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'main_dev.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // TODO: Initialize Firebase for PROD here
  // await Firebase.initializeApp();

  runApp(const ProviderScope(child: QmBuddyApp(flavor: 'prod')));
}
