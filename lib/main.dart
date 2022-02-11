import 'package:flutter/material.dart';
import 'package:flutter_cashrich/view_model/home_view_model.dart';
import './router.dart';
import './locator.dart';
import './view_model/theme_manager.dart';
// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
Future<void> main() async {
   //Used if Flutter needs to call native code before calling runApp
  WidgetsFlutterBinding.ensureInitialized();
    await setUpServiceLocator();

  // Setup logger, only show warning and higher in release mode.
  if (kReleaseMode) {
    Logger.level = Level.warning;
  } else {
    Logger.level = Level.debug;
  }
  runApp(
        MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeManager>(
          create: (context) => ThemeManager(),
        ),
        ChangeNotifierProvider<HomeViewModel>(
          create: (context) => HomeViewModel(),
        ),
        // ChangeNotifierProvider<AllQuotesViewModel>(
        //   create: (context) => AllQuotesViewModel(),
        // ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        initialRoute: '/',
        onGenerateRoute: generateRoute,
      );
  }
}
