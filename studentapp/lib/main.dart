 import 'package:flutter/material.dart';

import 'package:studentapp/db/function/db.functions.dart';

import 'package:studentapp/screens/homescreen.dart';
  
  Future<void> main()async {
    WidgetsFlutterBinding.ensureInitialized();
    
    await initializeddatabase();
   
  runApp( const MyApp() );
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return const  MaterialApp(
      debugShowCheckedModeBanner:false ,
      home: Homescreen ());
  }
} 