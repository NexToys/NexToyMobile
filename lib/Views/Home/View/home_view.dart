import 'package:NexToyMobile/Core/Extension/context_extension.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: context.theme.backgroundColor,
            ),
            onPressed: () {}),
        title: Text(
          "NexToy",
          style: context.textTheme.headline5.copyWith(
              color: context.theme.accentColor, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.filter_list_outlined,
                color: context.theme.backgroundColor,
              ),
              onPressed: () {})
        ],
      ),
    );
  }
}
