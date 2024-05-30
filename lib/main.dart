import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import 'assets.dart';
import 'title_screen/title_screen.dart';

void main() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    WidgetsFlutterBinding.ensureInitialized();
  }
  Animate.restartOnHotReload = true;
  runApp(
    FutureProvider<FragmentPrograms?>(
      create: (context) => loadFragmentPrograms(),
      initialData: null,
      child: const NextGenApp(),
    ),
  );
}

class NextGenApp extends StatelessWidget {
  const NextGenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: const TitleScreen(),
    );
  }
}