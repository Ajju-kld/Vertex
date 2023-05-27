
import 'package:flutter/material.dart';

import '../models/Message.dart';
import '../pages/utils.dart';

class Chat_Bubble extends StatelessWidget {
  final Message message;
  final void Function()? onLongPress;
  const Chat_Bubble(
      {Key? key, required this.message, required this.onLongPress})
      : super(key: key);










  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: (message.itsMe) ? Alignment.centerLeft : Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: GestureDetector(
          onLongPress: onLongPress,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: message.itsMe
                ? AlignmentDirectional.bottomEnd
                : AlignmentDirectional.bottomStart,
            children: [
              Container(
                constraints: const BoxConstraints(maxWidth: 200),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: message.itsMe ? Colors.black : secondary,
                  borderRadius: BorderRadius.only(
                    bottomLeft:const Radius.circular(20),
                    bottomRight:const  Radius.circular(20),
                    topRight: message.itsMe ? const Radius.circular(20) : Radius.zero,
                    topLeft: message.itsMe ? Radius.zero : const Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: message.itsMe
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
                  children: [
                    Text(
                      message.text,
                      style: chat,
                      softWrap: true,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '${message.dateTime.hour}:${message.dateTime.minute}',
                      style: chattime,
                    ),
                  ],
                ),
              ),
              if (message.reactions != null && message.reactions!.isNotEmpty)
                Positioned(
                  bottom: -10,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 32, 31, 31),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: message.reactions!
                          .map((reaction) => Text(
                                reaction,
                                style: const TextStyle(fontSize: 20),
                              ))
                          .toList(),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

