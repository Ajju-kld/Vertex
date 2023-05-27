import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:vertex/pages/utils.dart';
import '../../component/chat_component.dart';
import '../../models/Message.dart';

class Chat_Screen extends StatefulWidget {
  const Chat_Screen({super.key});

  @override
  State<Chat_Screen> createState() => _Chat_ScreenState();
}

class _Chat_ScreenState extends State<Chat_Screen> {
  final _chat_message = TextEditingController();
  final List<Message> _messages = [
    Message(
        text: 'Helasldkjadlsjlajdljasjdlkajslfjajdjdslkjfajfjaflo',
        itsMe: true,
        dateTime: DateTime(2022, 1, 1, 12, 32),
        reactions: ['👽', '👽']),
    Message(text: 'Hi', itsMe: false, dateTime: DateTime(2022, 1, 1, 12, 32)),
    Message(
        text: 'How are you?',
        itsMe: true,
        dateTime: DateTime(2022, 1, 2, 9, 33)),
    Message(
        text: "I'm good. How about you?",
        itsMe: false,
        dateTime: DateTime(2022, 1, 2, 10, 12)),
  ];
  @override
  void dispose() {
    // TODO: implement dispose
    _chat_message.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title:const Text('Chat'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              child: GroupedListView<Message, DateTime>(
                  elements: _messages,
                  groupBy: (message) => DateTime(
                        message.dateTime.year,
                        message.dateTime.month,
                        message.dateTime.day,
                      ),
                  floatingHeader: false,
                  reverse: true,
                  order: GroupedListOrder.DESC,
                  useStickyGroupSeparators: false,
                  groupHeaderBuilder: (Message message) => Center(
                        child: SizedBox(
                          height: 40,
                          child: Card(
                            color: backgroundColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                DateFormat.yMMMd().format(message.dateTime),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                  itemBuilder: (BuildContext context, Message message) {
                    return Chat_Bubble(
                      message: message,
                      onLongPress: () {
                        print('longed_pressed');
                      },
                    );
                  })),
          Container(
            height: 60,
            color: const Color.fromARGB(255, 0, 0, 0),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon:const Icon(
                      Icons.emoji_emotions_outlined,
                      color: Colors.white,
                    )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 2, 0, 0),
                  child: TextField(
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 5,
                      controller: _chat_message,
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                      decoration: InputDecoration(
                          hintText: "type your message",
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  width: 2)),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: secondary, width: 2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintStyle: const TextStyle(color: Colors.white))),
                )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.camera,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {
                      if (_chat_message.text.isEmpty) {
                        return;
                      } else {
                        setState(() {
                          _messages.add(Message(
                              text: _chat_message.text,
                              itsMe: true,
                              dateTime: DateTime.now()));
                        });
                        _chat_message.clear();
                      }
                    },
                    icon: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
