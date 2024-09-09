class ConstantsBaseUrl {
  final String baseUrl = 'https://restaurant-api.dicoding.dev/';

  String imageMediumUrl(String imgId) => '$baseUrl/images/medium/$imgId';
}
