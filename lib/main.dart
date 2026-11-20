import 'package:flutter/material.dart';
import 'package:gemeni_chatbot_app/providers/chat_provider.dart';
import 'package:gemeni_chatbot_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await ChatProvider.initHive();
  runApp(MultiProvider(
    providers:[
      ChangeNotifierProvider(create: (context) => ChatProvider()),
    ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen()
      
    );
  }
}


