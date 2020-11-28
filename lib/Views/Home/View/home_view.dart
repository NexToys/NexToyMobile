import 'package:NexToyMobile/Core/Extension/context_extension.dart';
import 'package:NexToyMobile/Views/Home/Widgets/toy_card.dart';
import 'package:NexToyMobile/Widgets/bottom_panel.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
        ),
        itemBuilder: (context, index) {
          return ToyCard();
        },
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
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
    );
  }
}
