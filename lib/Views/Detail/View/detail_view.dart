import 'package:NexToyMobile/Core/Extension/context_extension.dart';
import 'package:NexToyMobile/Views/Home/Model/toyModel.dart';
import 'package:flutter/material.dart';

class DetailView extends StatefulWidget {
  final Toy toy;

  const DetailView({Key key, this.toy}) : super(key: key);
  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Image.asset(widget.toy.image),
          ),
          Expanded(
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
                  widget.toy.desctription,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
