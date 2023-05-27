import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vertex/component/common_widgets.dart';

import '../utils.dart';
import '../inner_pages/Add_post.dart';
import '../inner_pages/Search_page.dart';
import 'home_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    const HomePage(),
    const AddPost_page(),
    const Search_page(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: Transform.rotate(
                angle: 201 / 20,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('chat');
                  },
                  icon: const Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('profile');
                },
                child: CircleAvatar(
                    child: Image.asset('assets/images/vertex_logo.png'))),
          )
        ],
        title: const Text(
          'Vertex',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 20,
          backgroundColor: backgroundColor,
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          iconSize: 30,
          selectedItemColor: secondary,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  color: Colors.white,
                ),
                label: 'home',
                activeIcon: Icon(Icons.home_outlined)),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_box_outlined,
                  color: Colors.white,
                ),
                label: 'add post',
                activeIcon: Icon(Icons.add_box_outlined)),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search_rounded,
                  color: Colors.white,
                ),
                label: 'search',
                activeIcon: Icon(Icons.search_rounded))
          ]),
      body: _children[_currentIndex],
    );
  }
}