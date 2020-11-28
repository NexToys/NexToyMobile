import 'package:NexToyMobile/Core/Extension/context_extension.dart';
import 'package:NexToyMobile/Views/Detail/View/detail_view.dart';
import 'package:NexToyMobile/Views/Home/Model/toyModel.dart';
import 'package:NexToyMobile/Views/Home/Widgets/toy_card.dart';
import 'package:NexToyMobile/Widgets/bottom_panel.dart';
import 'package:animations/animations.dart';
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
        itemCount: toys.length,
        itemBuilder: (context, index) {
          return buildOpenContainer(toys[index]);
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

  OpenContainer<dynamic> buildOpenContainer(Toy toy) {
    return OpenContainer(
      closedColor: context.theme.backgroundColor,
      closedElevation: 0,
      transitionDuration: Duration(milliseconds: 500),
      closedBuilder: (context, action) {
        return ToyCard(toy: toy);
      },
      openBuilder: (context, action) {
        return DetailView(
          toy: toy,
        );
      },
    );
  }
}
