import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:teleport/screens/home_screen.dart';
import 'package:teleport/screens/login_screen.dart';
import 'package:teleport/services/signin_with_google.dart';
import 'package:teleport/utils/colors.dart';
  
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen()
      },
      // initialRoute: '/login',
      home: StreamBuilder(
        stream: SignedInWithGoogle().authChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (snapshot.hasData) {
            return const HomeScreen();
          }

          return LoginScreen();
        },
      ),
    );
  }
}
