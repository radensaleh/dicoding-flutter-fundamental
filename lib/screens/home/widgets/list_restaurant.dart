import 'package:flutter/material.dart';
import 'package:food_hub_app/routes/routes.dart';

import '../../../data/models/restaurant.dart';
import '../../../widgets/widgets.dart';

class ListRestaurant extends StatelessWidget {
  const ListRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString(Restaurant.jsonFile),
      builder: (_, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasData) {
            final List<Restaurant> restaurants = parseRestaurant(snapshot.data);
            return ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 250),
              child: ListView.builder(
                itemCount: restaurants.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        _,
                        Routes.restaurantDetailScreen,
                        arguments: restaurants[index],
                      );
                    },
                    borderRadius: BorderRadius.circular(25),
                    child: RestaurantCardWidget(
                      name: restaurants[index].name,
                      pictureId: restaurants[index].pictureId,
                      rating: restaurants[index].rating,
                    ),
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }
      },
    );
  }
}
