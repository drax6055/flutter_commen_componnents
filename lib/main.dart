import 'package:flutter/material.dart';
import 'package:flutter_template/FrontendIntegration.dart';


void main()  {
  runApp(
      const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: FrontendIntegration(),
    );
  }
}
