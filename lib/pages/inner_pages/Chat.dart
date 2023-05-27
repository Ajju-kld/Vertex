import 'package:flutter/material.dart';
import 'package:vertex/pages/utils.dart';

import 'Chat_interface.dart';

class Chat_Page extends StatefulWidget {
  const Chat_Page({Key? key}) : super(key: key);

  @override
  _Chat_PageState createState() => _Chat_PageState();
}

class _Chat_PageState extends State<Chat_Page> {
  final controller = TextEditingController();
  List<String> chats = List.generate(100, (index) => 'Chat $index');
  List<String> filteredChats = [];

  void filterChats(String query) {
    setState(() {
       filteredChats = chats
          .where((chat) => chat.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    filteredChats = chats;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text(
          'Vertex',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
        
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: 300,
                  child: TextFormField(
                    cursorHeight: 25,
                    obscuringCharacter: '*',
                    controller: controller,
                    onChanged: filterChats,
                    style: const TextStyle(
                      color: Colors.white,
                      height: 25 / 20,
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                    
                      hintText: "Search",
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color.fromARGB(243, 95, 90, 90),
                      ),
                     focusedBorder:  OutlineInputBorder(borderSide:const BorderSide(color: secondary,width: 2),
                     borderRadius: BorderRadius.circular(10),
                      ),
                      fillColor: Color.fromARGB(255, 1, 7, 26),
                      filled: true,
                      hintStyle:
                          const TextStyle(color: Colors.white, fontSize: 15),
                      border: OutlineInputBorder(
                    
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 7,
            child: Scrollbar(
              interactive: true,
              
              child: ListView.separated(
  itemBuilder: (BuildContext context, int index) {
    final chat = filteredChats[index];
    return GestureDetector(
      onTap: () {
        // Navigate to the chat screen page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Chat_Screen()),
        );
      },
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(
            'https://picsum.photos/id/${index + 1}/200/200',
          ),
        ),
        title: Text(
          'Username ${index + 1}',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          chat,
          style: const TextStyle(color: Colors.grey),
        ),
        trailing: const Icon(
          Icons.camera_alt,
          color: Colors.white,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 16,
        ),
      ),
    );
  },
  separatorBuilder: (BuildContext context, int index) =>
      const Divider(height: 0),
  itemCount: filteredChats.length,
),

            ),
          ),
        ],
      ),
    );
  }
}
