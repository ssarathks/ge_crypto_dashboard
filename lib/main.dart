import 'package:flutter/material.dart';

import 'constants/theme_constants.dart';
import 'screens/common/tabbed_layout_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Behance',
      debugShowCheckedModeBanner: false,
      theme: ThemeConstants.lightTheme,
      darkTheme: ThemeConstants.darkTheme,
      themeMode: ThemeMode.system,
      home: const TabbedLayoutScreen(),
    );
  }
}
