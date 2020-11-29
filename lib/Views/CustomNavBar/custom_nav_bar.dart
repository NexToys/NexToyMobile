import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Components/bottom_panel.dart';
import '../../Core/Extension/context_extension.dart';
import '../../Core/Extension/string_extension.dart';
import '../Chat/chat_view.dart';
import '../Home/View/home_view.dart';

class CustomNavBar extends StatefulWidget {
  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _index = 0;
  List<Widget> _pages = [HomeView(), ChatView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: _pages.elementAt(_index),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: buildFloatingActionButton(),
      bottomNavigationBar: buildBottomAppBar(),
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      backgroundColor: context.theme.primaryColor,
      child: Icon(Icons.add),
      onPressed: () {},
    );
  }

  BottomAppBar buildBottomAppBar() {
    return BottomAppBar(
      notchMargin: 5,
      clipBehavior: Clip.antiAlias,
      shape: CircularNotchedRectangle(),
      child: BottomNavigationBar(
        backgroundColor: context.theme.primaryColor,
        currentIndex: _index,
        selectedFontSize: 12,
        unselectedFontSize: 0,
        selectedItemColor: context.theme.backgroundColor,
        unselectedItemColor: context.theme.backgroundColor,
        onTap: (value) => _change(value),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "homepage".locale),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "chat".locale),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: context.theme.backgroundColor,
          ),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return BottomSheetPanelBody();
              },
            );
          }),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
            width: 30,
            child: SvgPicture.asset(
              "assets/svg/rubber-duck.svg",
              color: context.theme.backgroundColor,
            ),
          ),
          SizedBox(width: 6),
          Text(
            "NexToy",
            style: context.textTheme.headline5.copyWith(
                color: context.theme.backgroundColor,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
      actions: [
        IconButton(
            icon: Icon(
              Icons.filter_list_outlined,
              color: context.theme.backgroundColor,
            ),
            onPressed: () {})
      ],
    );
  }

  _change(int value) {
    setState(() {
      _index = value;
    });
  }
}
