import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/entities/beverage.dart';
import 'package:json_annotation/json_annotation.dart';

part 'beverage_model.g.dart';

@JsonSerializable()
class BeverageModel extends Beverage {
  BeverageModel({super.name});

  factory BeverageModel.fromJson(Map<String, dynamic> json) =>
      _$BeverageModelFromJson(json);

  Map<String, dynamic> toJson() => _$BeverageModelToJson(this);
}
