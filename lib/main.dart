import 'package:amazon/layout/screen_layout.dart';
import 'package:amazon/screens/home_screen.dart';
import 'package:amazon/screens/sign_in_screen.dart';
import 'package:amazon/utils/color_themes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const  FirebaseOptions(
  apiKey: "AIzaSyA93y-NKjY941ae75QyfkXfsPFBcpxYU6U",
  authDomain: "clone-e8f8d.firebaseapp.com",
  projectId: "clone-e8f8d",
  storageBucket: "clone-e8f8d.appspot.com",
  messagingSenderId: "171330100983",
  appId: "1:171330100983:web:80965e4505c62089bcfdf2"));
  }else{
    await Firebase.initializeApp();

  }
  runApp(const Amazon());
}

class Amazon extends StatefulWidget {
  const Amazon({super.key});

  @override
  State<Amazon> createState() => _AmazonState();
}

class _AmazonState extends State<Amazon> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "amazon clone",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
         builder: (context, AsyncSnapshot<User?> user){
            if (user.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator(color: Colors.orange,
              ),
              );
            } else if (user.hasData) {
              return const ScreenLayout();
            } else{
              return const HomeSreen();
            }
         },
         ),
         );
  }
}

