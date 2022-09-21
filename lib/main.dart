import 'package:e_commerce/HomeScreen/HomeScreen.dart';
import 'package:e_commerce/MVC/View/Home_Screen_view.dart';
import 'package:e_commerce/Screens/Login_screen.dart';
import 'package:e_commerce/Screens/Welcome_screen.dart';
import 'package:e_commerce/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: "E-Commerce",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return MyHomeScreen();
            } else {
              return LoginScreen();
            }
          }),
        )
        // home: LoginScreen(),
        );
  }
}
