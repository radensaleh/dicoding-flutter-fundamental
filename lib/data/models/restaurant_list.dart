class RestaurantListResponse {
  RestaurantListResponse({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });

  final bool error;
  final String? message;
  final int? count;
  final List<RestaurantList> restaurants;

  factory RestaurantListResponse.fromJson(Map<String, dynamic> json) =>
      RestaurantListResponse(
        error: json['error'],
        message: json['message'],
        count: json['count'],
        restaurants: List<RestaurantList>.from(json['restaurants']
            .map((restaurant) => RestaurantList.fromJson(restaurant))),
      );
}

class RestaurantList {
  RestaurantList({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;

  factory RestaurantList.fromJson(Map<String, dynamic> json) => RestaurantList(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        pictureId: json['pictureId'],
        city: json['city'],
        rating: json['rating'].toDouble(),
      );
}
