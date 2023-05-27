import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vertex/component/common_widgets.dart';

import '../utils.dart';
import '../inner_pages/Add_post.dart';
import '../inner_pages/Search_page.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final user = FirebaseAuth.instance.currentUser!;
  var isFollow = false;
  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 60,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        shadowColor: secondary,
        elevation: 10,
        backgroundColor: backgroundColor,
        title: Image.asset(
          'assets/images/VERTEX.png',
          width: 100,
          colorBlendMode: BlendMode.luminosity,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings, color: Colors.white),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Follower_Board(),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(136, 128, 0, 0),
                  child: isFollow
                      ? messageUnfollow(
                          message: () {},
                          unfollow: () {
                            print('clicked');
                            setState(() {
                              isFollow = false;
                            });
                          })
                      : followBtn(
                          follow: () {
                            setState(() {
                              isFollow = true;
                            });
                          },
                        ),
                ),
              ],
            ),
            const Padding(
              padding:  EdgeInsets.fromLTRB(0, 20,340, 20),
              child: Text(
                'Bio',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              width: 400,
              height: 240,
              decoration: BoxDecoration(
                color: const Color.fromARGB(172, 6, 8, 14),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: secondary, width: 2),
              ),
              child: Markdown(
                data: markdown_Data,
                styleSheet: MarkdownStyleSheet(
                  p: const TextStyle(color: Colors.white), // Set text color to white
                ),
                imageBuilder: (Uri uri, String? title, String? alt) {
                  return SvgPicture.network(uri.toString(), theme:const  SvgTheme(currentColor:Colors.white),placeholderBuilder: (context)=>const CircularProgressIndicator(),);
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 45, 320, 0),
              child: Text(
                'POST',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
              child: Divider(
                indent: 20,
                color: Colors.white,
                endIndent: 20,
              ),
            ),
  GridView.count(
            crossAxisCount: 3, // Number of columns in the grid
            crossAxisSpacing: 2, // Spacing between columns
            mainAxisSpacing: 2, // Spacing between rows
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children:List.generate(10, (index) => Container(width: 45,height: 60,color: Colors.white,)),
          )  ] ),
      ),
    );
  }
}
