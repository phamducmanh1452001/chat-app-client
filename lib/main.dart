import 'package:chatapp/conversation_list.dart';
import 'package:chatapp/search_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 72,
          title: Container(
            padding: const EdgeInsets.only(left: 16, top: 16,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/comments.png', width: 56, height: 56,),
                const SizedBox(width: 24,),
                const Text(
                  'Chat App',
                  style: TextStyle(fontSize: 27),
                ),
              ],
            ),
          ),
          backgroundColor: const Color(0xff292f3f),
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 8),
              child: SearchBar()
            ),
            Expanded(
              child: ConversationList(),
            )
          ],
        )
      ),
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xff292f3f)),
      debugShowCheckedModeBanner: false,
    );
  }
}
