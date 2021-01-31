import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:NexToyMobile/Components/duckWidget.dart';
import 'package:NexToyMobile/Core/Extension/context_extension.dart';
import 'package:NexToyMobile/Core/Model/Toy/toyModel.dart';

class DetailView extends StatefulWidget {
  final Toy toy;

  const DetailView({Key key, this.toy}) : super(key: key);
  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: context.width,
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    child: SizedBox(
                      width: context.width,
                      height: context.height * .6,
                      child: Image.network(
                        widget.toy.imageurl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  AppBar(
                    excludeHeaderSemantics: true,
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                  )
                ],
              ),
              Expanded(
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Transform.rotate(
                            angle: math.pi * -.25, child: Duck()),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            widget.toy.name,
                            maxLines: 1,
                            overflow: TextOverflow.visible,
                            style: context.textTheme.headline6,
                          ),
                          Text(
                            widget.toy.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
