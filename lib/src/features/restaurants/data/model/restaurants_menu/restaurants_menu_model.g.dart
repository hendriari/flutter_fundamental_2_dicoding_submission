// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurants_menu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantsMenuModel _$RestaurantsMenuModelFromJson(
        Map<String, dynamic> json) =>
    RestaurantsMenuModel(
      foods: RestaurantsMenuModel._restaurantsBeverageFromJson(
          json['foods'] as List?),
      drinks: RestaurantsMenuModel._restaurantsBeverageFromJson(
          json['drinks'] as List?),
    );

Map<String, dynamic> _$RestaurantsMenuModelToJson(
        RestaurantsMenuModel instance) =>
    <String, dynamic>{
      'foods': RestaurantsMenuModel._restaurantsBeverageToJson(instance.foods),
      'drinks':
          RestaurantsMenuModel._restaurantsBeverageToJson(instance.drinks),
    };
