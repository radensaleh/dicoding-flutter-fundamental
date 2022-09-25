import 'package:flutter/material.dart';
import 'package:food_hub_app/data/models/restaurant.dart';
import 'package:food_hub_app/screens/restaurant_detail/widgets/list_tags.dart';
import 'package:food_hub_app/utils/utils.dart';
import 'package:food_hub_app/extensions/extension.dart';

class RestaurantDetailScreen extends StatefulWidget {
  final Restaurant restaurants;

  const RestaurantDetailScreen({
    required this.restaurants,
    super.key,
  });

  @override
  State<RestaurantDetailScreen> createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.theme;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 25,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: size.width,
                        height: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.network(
                            widget.restaurants.pictureId,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              enableFeedback: false,
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 8,
                                        offset: const Offset(0, 3),
                                      ),
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Icon(
                                    Icons.arrow_back_ios_new,
                                    size: 18,
                                    color: blackColor80,
                                  ),
                                ),
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
                      )
                    ],
                  ),
                  const SizedBox(height: 28.0),
                  Text(
                    widget.restaurants.name,
                    style: theme.textTheme.headline4!.copyWith(fontSize: 22),
                  ),
                  const SizedBox(height: 12.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: yellowColor,
                        size: 20,
                        shadows: [
                          BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 5,
                            color: yellowColor50,
                            offset: const Offset(0, 3),
                          )
                        ],
                      ),
                      const SizedBox(width: 6.0),
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: Text(
                          widget.restaurants.rating.toString(),
                          style:
                              theme.textTheme.headline4!.copyWith(fontSize: 16),
                        ),
                      ),
                      const SizedBox(width: 6.0),
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: Text(
                          '(12+)',
                          style: theme.textTheme.headline4!.copyWith(
                            fontSize: 15,
                            color: grayColor,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: Text(
                          'See Review',
                          style: theme.textTheme.headline4!.copyWith(
                            fontSize: 15,
                            color: orangeColor80,
                            decoration: TextDecoration.underline,
                            decorationColor: orangeColor,
                            decorationThickness: 1.3,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        color: orangeColor,
                        size: 20,
                        shadows: [
                          BoxShadow(
                            blurRadius: 5,
                            spreadRadius: 5,
                            color: yellowColor50,
                            offset: const Offset(0, 3),
                          )
                        ],
                      ),
                      const SizedBox(width: 6.0),
                      Text(
                        widget.restaurants.city,
                        style: theme.textTheme.headline4!.copyWith(
                          fontSize: 14,
                          color: orangeColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18.0),
                  SizedBox(
                    height: 200,
                    child: ListView(
                      padding: const EdgeInsets.only(
                        top: 0,
                        left: 3,
                        right: 3,
                      ),
                      scrollDirection: Axis.vertical,
                      children: [
                        Text(
                          widget.restaurants.description,
                          textAlign: TextAlign.justify,
                          style: theme.textTheme.headline4!.copyWith(
                            color: blackColor20,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18.0),
                  ListTags(
                    restaurantList: widget.restaurants.menus.foods,
                    title: 'Foods',
                    color: orangeColor,
                  ),
                  const SizedBox(height: 28.0),
                  ListTags(
                    restaurantList: widget.restaurants.menus.drinks,
                    title: 'Drinks',
                    color: Colors.blue[600]!,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
