import 'package:chat_app/model/message.dart';
import 'package:flutter/material.dart';

class CustomChatForUserWidget extends StatelessWidget {
  const CustomChatForUserWidget({super.key, required this.message});
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 14, left: 50, right: 8),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF512da8),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
    // );
  }
}

class CustomChatForFriendWidget extends StatelessWidget {
  const CustomChatForFriendWidget({super.key, required this.message});
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 14, left: 8, right: 50),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFb388ff),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
    // );
  }
}
