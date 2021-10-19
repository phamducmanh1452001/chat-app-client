import 'package:flutter/material.dart';
import 'package:chatapp/chat_view.dart';

class ConversationCell extends StatelessWidget {

  const ConversationCell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChatView()),
          );
        },
        leading: const SizedBox(
          height: 60,
          width: 60,
          child: CircleAvatar(
            foregroundImage: AssetImage('assets/avatar.jpg'),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Manh Blue',
              style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
            ),
            Text(
              'Tue',
              style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        subtitle: const Text(
          'Developer',
          style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w300),
        ),
      ),
    ); 
  }
}