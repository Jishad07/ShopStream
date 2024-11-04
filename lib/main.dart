import 'package:flutter/material.dart';
import 'package:polosyssample/view/screens/loginpage.dart';
import 'package:provider/provider.dart';

import 'services/authentication_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      
      providers:[
      ChangeNotifierProvider(create: (context) => AuthProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
        
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:const  LoginPage()
      ),
    );
  }
}



