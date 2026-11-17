import 'package:flutter/material.dart';
import 'package:gemeni_chatbot_app/screens/chat_history_screen.dart';
import 'package:gemeni_chatbot_app/screens/chat_screen.dart';
import 'package:gemeni_chatbot_app/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

//list of screens
  final List<Widget> _screens = [
    const ChatScreen(),
    const ChatHistoryScreen(),
    const ProfileScreen()
  ];

  //index of teh current screen
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(children: _screens,
      onPageChanged: (index){
        setState(() {
          currentIndex = index;
        },);
      }),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: "ChatHistory"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
      ], currentIndex: currentIndex,)
    );
  }
}