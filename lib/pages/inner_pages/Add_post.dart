import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vertex/pages/utils.dart';

class AddPost_page extends StatefulWidget {
  const AddPost_page({super.key});

  @override
  State<AddPost_page> createState() => _AddPost_pageState();
}

class _AddPost_pageState extends State<AddPost_page> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      
      backgroundColor: backgroundColor
      ,body: Center(child: Text('post_page',style: TextStyle(color: Colors.white),),),);
  }
}