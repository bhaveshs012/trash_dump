import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:get/get.dart';
import 'package:waste_management_app/screens/login/controller/login_controller.dart';
import 'package:waste_management_app/screens/login/repository/auth_repository.dart';
import 'package:waste_management_app/screens/splash/views/splash_screen.dart';
import 'screens/home/controllers/location_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  await Firebase.initializeApp().then((value) => Get.put(AuthRepository()));
  Get.put(LoginController());
  Get.put(LocationController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins',
      ),
      home: SplashScreen(),
    );
  }
}
