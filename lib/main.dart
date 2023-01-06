import 'package:clone_everytime/providers/token_provider.dart';
import 'package:clone_everytime/providers/bottom_nav_provider.dart';
import 'package:clone_everytime/providers/grade_provider.dart';
import 'package:clone_everytime/providers/register_provider.dart';
import 'package:clone_everytime/providers/tab_provider.dart';
import 'package:clone_everytime/screens/temp_screen.dart';
import 'package:clone_everytime/utils/scroll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
    statusBarColor: Colors.white,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => TokenProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => BottomNavigationProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => GradeProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => RegisterProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => TabProvider()),
      ],
      child: MaterialApp(
        builder: (context, child) {
          return ScrollConfiguration(behavior: MyScrollBehavior(), child: child!);
        },
        title: '에브리타임',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0.0,
          ),
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const TempScreen(),
      ),
    );
  }
}
