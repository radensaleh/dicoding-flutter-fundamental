import 'package:flutter/material.dart';
import 'package:food_hub_app/utils/utils.dart';
import 'package:food_hub_app/extensions/extension.dart';
import 'package:food_hub_app/widgets/widgets.dart';

class MenuCardWidget extends StatefulWidget {
  final String name;
  final String restaurantName;
  final dynamic restaurantRating;
  final String menuType;

  const MenuCardWidget({
    super.key,
    required this.name,
    required this.restaurantName,
    this.restaurantRating,
    required this.menuType,
  });

  @override
  State<MenuCardWidget> createState() => _MenuCardWidgetState();
}

class _MenuCardWidgetState extends State<MenuCardWidget> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.theme;
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width - 180,
      child: Card(
        color: whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: size.width,
                  height: size.height * 0.18,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      'assets/images/foodhub.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 65,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: whiteColor,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.fastfood,
                              color: widget.menuType == 'Food'
                                  ? orangeColor
                                  : Colors.blue[600],
                              size: 12,
                            ),
                            const SizedBox(width: 4.0),
                            Flexible(
                              child: RichText(
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  text: widget.menuType,
                                  style: theme.textTheme.headline4!.copyWith(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
                              positionBottom: false,
                            );
                          } else {
                            context.showCustomFlashMessage(
                              status: 'success',
                              title: 'Remove from Favorite',
                              positionBottom: false,
                            );
                          }
                        },
                        child: isFavorite
                            ? Card(
                                color: Colors.red[600],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Icon(
                                    Icons.favorite,
                                    color: whiteColor,
                                    size: 18,
                                  ),
                                ),
                              )
                            : Card(
                                color: Colors.grey.withOpacity(0.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Icon(
                                    Icons.favorite,
                                    color: whiteColor,
                                    size: 18,
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 8.0,
                    top: size.height * 0.15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RatingWidget(
                        rating: widget.restaurantRating,
                        fontSizeRating: 10,
                        fontSizeReview: 9,
                        iconSize: 10,
                        paddingRounded: 10,
                      ),
                      const SizedBox(),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            text: widget.name,
                            style: theme.textTheme.headline4!.copyWith(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6.0),
                  Row(
                    children: [
                      Flexible(
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            text: widget.restaurantName,
                            style: theme.textTheme.headline4!.copyWith(
                              fontSize: 12,
                              color: grayColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
