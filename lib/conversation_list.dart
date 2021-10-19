import 'package:flutter/material.dart';
import 'conversation_cell.dart';

class ConversationList extends StatefulWidget {
  const ConversationList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return const ConversationCell();
        }
      );
  }
}