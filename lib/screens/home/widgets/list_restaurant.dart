import 'package:flutter/material.dart';
import 'package:food_hub_app/routes/routes.dart';
import 'package:food_hub_app/utils/utils.dart';
import 'package:provider/provider.dart';

import '../../../widgets/widgets.dart';

class ListRestaurant extends StatelessWidget {
  const ListRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RestaurantListProvider>(
      create: (context) => RestaurantListProvider(),
      child: Consumer<RestaurantListProvider>(
        builder: (context, restaurantListProvider, _) {
          if (restaurantListProvider.state == ResponseState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (restaurantListProvider.state == ResponseState.error) {
            return Center(child: Text(restaurantListProvider.message));
          } else if (restaurantListProvider.state == ResponseState.noData) {
            return Center(child: Text(restaurantListProvider.message));
          } else if (restaurantListProvider.state == ResponseState.hasData) {
            var restaurants =
                restaurantListProvider.restaurantList!.restaurants;

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
                        arguments: restaurants[index].id,
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
          } else {
            return Center(child: Text(restaurantListProvider.message));
          }
        },
      ),
    );
  }
}
