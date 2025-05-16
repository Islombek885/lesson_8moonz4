import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:lesson_8moonz4/firebase_options.dart';
import 'package:lesson_8moonz4/services/notification_service.dart';
import 'package:lesson_8moonz4/view/paroltikla.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lesson_8moonz4/view/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupFCM();
  runApp(const MainApp());
}

NotificationService notificationService = NotificationService();

Future<void> setupFCM() async {
  await notificationService.initNotifications();

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    notificationService.showNotification(message);
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          if (snapshot.hasData) {
            return Onboarding();
          } else {
            return Rotish();
          }
        },
      ),
      routes: {
        "onboarding": (context) => Onboarding(),
        "ro'yxatdan o'tish": (context) => Rotish(),
      },
    );
  }
}
