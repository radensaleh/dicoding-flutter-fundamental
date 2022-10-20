import 'package:flutter/material.dart';
import 'package:food_hub_app/data/api/api_restaurant.dart';
import 'package:food_hub_app/data/models/restaurant_detail.dart';
import 'package:food_hub_app/screens/restaurant_review/widgets/list_review.dart';
import 'package:food_hub_app/utils/utils.dart';
import 'package:food_hub_app/extensions/extension.dart';
import 'package:provider/provider.dart';

class RestaurantReviewScreen extends StatefulWidget {
  final String id;

  const RestaurantReviewScreen({
    super.key,
    required this.id,
  });

  @override
  State<RestaurantReviewScreen> createState() => _RestaurantReviewScreenState();
}

class _RestaurantReviewScreenState extends State<RestaurantReviewScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RestaurantDetailProvider>(
      create: (context) => RestaurantDetailProvider(id: widget.id),
      child: Consumer<RestaurantDetailProvider>(
        builder: (context, restaurantDetailProvider, _) {
          if (restaurantDetailProvider.state == ResponseState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (restaurantDetailProvider.state == ResponseState.noData) {
            return Center(child: Text(restaurantDetailProvider.message));
          } else if (restaurantDetailProvider.state == ResponseState.error) {
            return Center(child: Text(restaurantDetailProvider.message));
          } else if (restaurantDetailProvider.state == ResponseState.hasData) {
            return _detailRestaurant(context,
                restaurantDetailProvider.restaurantDetail!.restaurantDetail);
          } else {
            return Center(child: Text(restaurantDetailProvider.message));
          }
        },
      ),
    );
  }

  Widget _detailRestaurant(BuildContext context, RestaurantDetail restaurant) {
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
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/images/foodhub.png',
                            fit: BoxFit.cover,
                            image:
                                '${ApiRestaurant.baseUrl}${ApiRestaurant.getImageUrl}${restaurant.pictureId}',
                            imageErrorBuilder: (context, error, stackTrace) =>
                                Image.asset('assets/images/foodhub.png'),
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
                    restaurant.name,
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
                          restaurant.rating.toString(),
                          style:
                              theme.textTheme.headline4!.copyWith(fontSize: 16),
                        ),
                      ),
                      const SizedBox(width: 6.0),
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: Text(
                          '(${restaurant.customerReviews.length} Review)',
                          style: theme.textTheme.headline4!.copyWith(
                            fontSize: 15,
                            color: grayColor,
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
                      Flexible(
                        child: Text(
                          '${restaurant.address}, ${restaurant.city}',
                          style: theme.textTheme.headline4!.copyWith(
                            fontSize: 14,
                            color: orangeColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 5,
                      right: 5,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.comment,
                              color: Colors.blue[600],
                              size: 18,
                            ),
                            const SizedBox(width: 8.0),
                            Text(
                              'Review',
                              style: theme.textTheme.headline4!.copyWith(
                                fontSize: 18,
                                color: blackColor.withOpacity(0.85),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14.0),
                  ListView.builder(
                    itemCount: restaurant.customerReviews.length,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      return ReviewCardWidget(
                        name: restaurant.customerReviews[index].name,
                        review: restaurant.customerReviews[index].review,
                        date: restaurant.customerReviews[index].date,
                      );
                    },
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
