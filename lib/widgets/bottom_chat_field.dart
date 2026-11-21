import 'package:flutter/material.dart';
import 'package:gemeni_chatbot_app/providers/chat_provider.dart';

class BottomChatField extends StatefulWidget {
  const BottomChatField({super.key, required this.chatProvider});
  final ChatProvider chatProvider;

  @override
  State<BottomChatField> createState() => _BottomChatFieldState();
}

class _BottomChatFieldState extends State<BottomChatField> {
  final TextEditingController _messageController = TextEditingController();

  //focus node for input field
  final FocusNode textFieldFocus = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  dispose() {
    _messageController.dispose();
    textFieldFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Theme.of(context).textTheme.titleLarge!.color!,
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.image),
            onPressed: () {
              //pick img
            },
          ),
          const SizedBox(width: 5),
          Expanded(
            child: TextField(
              controller: _messageController,
              focusNode: textFieldFocus,
              textInputAction: TextInputAction.send,
              onSubmitted: (value) {},
              decoration: InputDecoration.collapsed(
                hintText: "Enter a prompt...",
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              //send the mesg
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.all(5),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_upward, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
