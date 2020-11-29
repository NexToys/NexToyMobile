import 'package:flutter/material.dart';

import '../../../Components/duckWidget.dart';
import '../../../Core/Extension/context_extension.dart';
import '../Model/toyModel.dart';

class ToyCard extends StatelessWidget {
  final Toy toy;
  const ToyCard({
    Key key,
    this.toy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, right: 5, left: 5),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          AspectRatio(
            aspectRatio: 1 / 1,
            child: Card(
              elevation: 8,
              shadowColor: context.theme.accentColor.withOpacity(.7),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: context.theme.accentColor.withOpacity(.1)),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Container(
                padding: EdgeInsets.only(
                  left: 60,
                  top: 60,
                  right: 10,
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Duck(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Card(
                      elevation: 10,
                      shadowColor: context.theme.accentColor.withOpacity(.7),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: context.theme.accentColor.withOpacity(.1)),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          toy.image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    toy.name,
                    maxLines: 1,
                    overflow: TextOverflow.visible,
                    style: context.textTheme.headline6,
                  ),
                  Text(
                    toy.desctription,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
