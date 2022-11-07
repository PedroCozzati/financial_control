import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/default.entity.dart';

part 'coffee.model.g.dart';

@JsonSerializable(anyMap: true)
class CoffeeModel extends CoffeeEntity {
  String file;

  CoffeeModel({required this.file}) : super(file: file);

  factory CoffeeModel.fromJson(Map<String, dynamic> json) =>
      _$CoffeeModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoffeeModelToJson(this);
}
