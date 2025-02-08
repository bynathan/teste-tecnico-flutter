import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_technical_test_motel_list/core/providers/motel_provider.dart';
import 'package:flutter_technical_test_motel_list/core/services/motel_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter_technical_test_motel_list/constants/colors_constants.dart';
import 'package:flutter_technical_test_motel_list/constants/fonts_constants.dart';
import 'package:flutter_technical_test_motel_list/screens/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MotelState(MotelService(client: http.Client())),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Technical Test Motel List',
      theme: ThemeData(
        fontFamily: AppFontFamily.openSans,
        primarySwatch: Colors.red,
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.primary,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
