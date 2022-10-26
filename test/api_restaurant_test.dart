import 'package:flutter_test/flutter_test.dart';
import 'package:food_hub_app/data/api/api_restaurant.dart';

void main() {
  group('API Restaurant Testing', () {
    test('=> Get Restaurant List Response is Success', () async {
      var getRestaurantAPI = await ApiRestaurant.getRestaurantList();
      var res = getRestaurantAPI.error == false;
      expect(res, true);
    });

    test('=> Get Detail Restaurant is Success', () async {
      var getRestaurantAPI =
          await ApiRestaurant.getRestaurantDetail('rqdv5juczeskfw1e867');
      var res = getRestaurantAPI.error == false;
      expect(res, true);
    });
  });
}
