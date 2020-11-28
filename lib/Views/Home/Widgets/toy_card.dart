import 'package:NexToyMobile/Core/Extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ToyCard extends StatelessWidget {
  const ToyCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          AspectRatio(
            aspectRatio: 1 / 1,
            child: Card(
              elevation: 20,
              shadowColor: context.theme.accentColor,
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
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: SvgPicture.asset(
                    "assets/svg/rubber-duck.svg",
                    color: context.theme.accentColor.withOpacity(.1),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Card(
                      elevation: 20,
                      shadowColor: context.theme.accentColor,
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
                          "assets/image/oyuncak2.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "OyuncakOyuncakOyuncak",
                    maxLines: 1,
                    overflow: TextOverflow.visible,
                    style: context.textTheme.headline6,
                  ),
                  Text(
                    "Deray Detay Deray Detay Deray Detay Deray Detay Deray Detay Deray Detay Deray Detay Deray Detay Deray Detay Deray Detay ",
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
