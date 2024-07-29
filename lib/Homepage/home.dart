import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vertex/Authentication/bloc/authentication_bloc.dart';
import 'package:vertex/Feed/feeds.dart';
import 'package:vertex/Homepage/bloc/bottom_navigation_bloc.dart';
import 'package:vertex/Homepage/view/home_page.dart';
import 'package:vertex/Repository/user_repository/user_model.dart';
import 'package:vertex/utils/constant.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => Home());
  }

  final List<Widget> _children = [
     HomePage(),
    Feed(),
  ];
// get user =>
   


  @override
  Widget build(BuildContext context) {
    final User user=context.select((AuthenticationBloc bloc) => bloc.state.user);
    return BlocConsumer<BottomNavigationBloc, BottomNavigationState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              elevation: 20,
              backgroundColor: UIConstants.backgroundColor,
              currentIndex: state.index,
              onTap: (value) {
                BlocProvider.of<BottomNavigationBloc>(context)
                    .add(BottomNavigationEvent(index: value));
              },
              iconSize: 30,
              selectedItemColor: UIConstants.primaryColor,
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
                      Icons.search_rounded,
                      color: Colors.white,
                    ),
                    label: 'search',
                    activeIcon: Icon(Icons.search_rounded))
              ]),
          body: _children[state.index],
        );
      },
    );
  }
}
