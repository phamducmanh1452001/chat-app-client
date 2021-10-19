import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final _messages = List.filled(10, 'I love you. I am sorry. Please forgive me. Thank you', growable: true);
  final _messageTextFieldController = TextEditingController();
  final _itemScrollController = ItemScrollController();
  final _itemPositionsListener = ItemPositionsListener.create();

  void _onPressedSendMessage() {
    setState(() {
      _messages.add(_messageTextFieldController.text);
      _messageTextFieldController.text = '';

      if(_messages.isNotEmpty) {
        _itemScrollController.scrollTo(
          index: _messages.length - 1,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOutCubic);
      }
    });
    
  }

  void _scrollListViewtoBottom() async {
    
  }

  @override
  Widget build(BuildContext context) {
    _scrollListViewtoBottom();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color(0xff292f3f),
        title: Row(
          children: [
            SizedBox(
              width: 24,
              child: Center(
                child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 24,
                    ),
                    onPressed: () => ModalRoute.of(context)?.canPop == true ? Navigator.of(context).pop() : null,
                  ),
              ),
            ),
            const SizedBox(width: 16,),
            Row(
              children: const [
                SizedBox(
                  height: 44,
                  width: 44,
                  child: CircleAvatar(
                    foregroundImage: AssetImage('assets/avatar.jpg'),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16,),
            const Text(
              'Text',
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 112),
            child: ScrollablePositionedList.builder(
              itemCount: _messages.length,
              padding: const EdgeInsets.only(left: 24, right: 24),
              itemScrollController: _itemScrollController,
              itemPositionsListener: _itemPositionsListener,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 8, right: index.isEven ? 0 : 60, left: index.isEven ? 60 : 0),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      _messages[index],
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xff373E4E),
                      borderRadius: BorderRadius.circular(8)
                    ),
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 40),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _messageTextFieldController,
                              textAlignVertical: TextAlignVertical.center,
                              style: const TextStyle(fontSize: 14, color: Colors.white),
                              decoration: InputDecoration(
                                filled: true,
                                hintText: 'Write',
                                hintStyle: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.6))
                              ),
                            ),
                          ),
                          Container(
                            height: 48,
                            width: 48,
                            decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Color(0xff837DFF),
                            ),
                            child: IconButton(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onPressed: _onPressedSendMessage,
                              icon: const Icon(Icons.chat_bubble_outline_rounded),
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xff1f232f)
                      ),
                    ),
                  ),

                  const SizedBox(width: 16,),

                  Container(
                    height: 48,
                    width: 48,
                    decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(0xff00ac83),
                    ),
                    child: IconButton(
                      onPressed: (){}, 
                      icon: const Icon(Icons.camera_alt_outlined),
                      color: Colors.white,
                    ),
                  )
               ],
              ),
            ),
          )
        ],
      ),
      
    );
  }
}
