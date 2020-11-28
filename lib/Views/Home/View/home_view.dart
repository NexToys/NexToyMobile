import 'package:NexToyMobile/Core/Extension/context_extension.dart';
import 'package:NexToyMobile/Views/Detail/View/detail_view.dart';
import 'package:NexToyMobile/Views/Home/Model/toyModel.dart';
import 'package:NexToyMobile/Views/Home/Widgets/toy_card.dart';
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

  OpenContainer<dynamic> buildOpenContainer(Toy toy) {
    return OpenContainer(
      closedColor: context.theme.backgroundColor,
      closedElevation: 0,
      transitionDuration: Duration(milliseconds: 200),
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
