class ConstantsBaseUrl {
  final String baseUrl = 'https://restaurant-api.dicoding.dev/';

  String imageMediumUrl(String? imgId) => '${baseUrl}images/medium/$imgId';

  final String listRestaurants = 'list';

  String detailRestaurants(String? id) => 'detail/$id';

  String searchRestaurants(String query) => 'search?q=$query';
}
