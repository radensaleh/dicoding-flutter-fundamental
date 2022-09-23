import 'package:flutter/material.dart';
import 'package:food_hub_app/utils/utils.dart';
import 'package:food_hub_app/extensions/extension.dart';
import 'package:food_hub_app/widgets/widgets.dart';

class RestaurantCardWidget extends StatefulWidget {
  final String name;
  final String pictureId;
  final dynamic rating;

  const RestaurantCardWidget({
    super.key,
    required this.name,
    required this.pictureId,
    required this.rating,
  });

  @override
  State<RestaurantCardWidget> createState() => _RestaurantCardWidgetState();
}

class _RestaurantCardWidgetState extends State<RestaurantCardWidget> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.theme;
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width - 120,
      child: Card(
        color: whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: size.width,
                  height: 149,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),
                    ),
                    child: Image.network(
                      widget.pictureId,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RatingWidget(
                        rating: widget.rating,
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(20),
                        splashColor: orangeColor,
                        onTap: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                          if (isFavorite) {
                            context.showCustomFlashMessage(
                              status: 'success',
                              title: 'Add Favorite',
                            );
                          } else {
                            context.showCustomFlashMessage(
                              status: 'success',
                              title: 'Remove from Favorite',
                            );
                          }
                        },
                        child: isFavorite
                            ? Card(
                                color: orangeColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(6),
                                  child: Icon(
                                    Icons.favorite,
                                    color: whiteColor,
                                    size: 20,
                                  ),
                                ),
                              )
                            : Card(
                                color: Colors.grey.withOpacity(0.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(6),
                                  child: Icon(
                                    Icons.favorite,
                                    color: whiteColor,
                                    size: 20,
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style:
                            theme.textTheme.headline4!.copyWith(fontSize: 14),
                      ),
                      const SizedBox(width: 4),
                      Image.asset(
                        'assets/icons/verif.png',
                        width: 13,
                      ),
                    ],
                  ),
                  const SizedBox(height: 11.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/icons/delivery.png',
                        width: 14,
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        'Free delivery',
                        style: theme.textTheme.bodyText1!.copyWith(
                          color: blackColor20,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Image.asset(
                        'assets/icons/timer.png',
                        width: 10,
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        '10-15 mins',
                        style: theme.textTheme.bodyText1!.copyWith(
                          color: blackColor20,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12.0),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.grey.withOpacity(0.15),
                        ),
                        child: Text(
                          'Food',
                          style: theme.textTheme.bodyText1!.copyWith(
                            color: blackColor50,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.grey.withOpacity(0.15),
                        ),
                        child: Text(
                          'Drink',
                          style: theme.textTheme.bodyText1!.copyWith(
                            color: blackColor50,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
