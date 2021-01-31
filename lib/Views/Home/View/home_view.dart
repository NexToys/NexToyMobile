import 'dart:convert';

import 'package:NexToyMobile/Core/Extension/context_extension.dart';
import 'package:NexToyMobile/Views/Detail/View/detail_view.dart';
import 'package:NexToyMobile/Core/Model/Toy/toyModel.dart';
import 'package:NexToyMobile/Views/Home/Widgets/toy_card.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:NexToyMobile/Components/globals.dart' as global;

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Toy> toyList = [];

  Future getData() async {
    final response = await http.get(global.baseUrl + '/api/toy');
    final jsonBody = jsonDecode(response.body);
    //print(jsonBody);
    if (jsonBody is List) {
      jsonBody.map((e) => toyList.add(Toy.fromJson(e))).toList();
    }
    toyList.forEach((element) {
      print(element.imageurl);
    });
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
        ),
        itemCount: toyList.length,
        itemBuilder: (context, index) {
          return buildOpenContainer(toyList[index]);
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
