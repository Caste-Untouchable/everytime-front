import 'package:clone_everytime/provider/bottom_nav_provider.dart';
import 'package:clone_everytime/screen/temp_screen.dart';
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
        ChangeNotifierProvider(create: (BuildContext context) => BottomNavigationProvider()),
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
