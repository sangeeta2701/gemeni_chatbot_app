import 'package:flutter/material.dart';
import 'package:gemeni_chatbot_app/providers/chat_provider.dart';
import 'package:gemeni_chatbot_app/widgets/bottom_chat_field.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  //controller for the text field
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (context, chatProvider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            title: Text("Chat with Gemeni"),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal:16),
              child: Column(
                children: [
                  Expanded(
                    child: chatProvider.inChatMessages.isEmpty
                        ? const Center(child: Text("No messages yet."))
                        : ListView.builder(
                            controller: chatProvider.pageController,
                            itemCount: chatProvider.inChatMessages.length,
                            itemBuilder: (context, index) {
                              final message =
                                  chatProvider.inChatMessages[index];
                              return ListTile(
                                title: Text(message.message.toString()),
                                subtitle: Text(message.timeSent.toString()),
                              );
                            },
                          ),
                  ),

                  //input field
                   BottomChatField(chatProvider: chatProvider),
                  
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
