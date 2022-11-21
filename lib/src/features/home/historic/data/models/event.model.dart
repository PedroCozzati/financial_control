// import 'package:freezed_annotation/freezed_annotation.dart';
//
// import '../../domain/event.entity.dart';
//
// part 'event.model.g.dart';
//
// @JsonSerializable(anyMap: true)
// class EventModel extends EventEntity {
//   final String value;
//   final String description;
//   final String type;
//   final String category;
//   final String date;
//
//   EventModel(
//       {required this.value,
//       required this.description,
//       required this.type,
//       required this.date,
//       required this.category})
//       : super(
//           value: value,
//           description: description,
//           date: date,
//           isCredit: isCredit,
//           category: category,
//         );
//
//   factory EventModel.fromJson(Map<String, dynamic> json) =>
//       _$EventModelFromJson(json);
//
//   Map<String, dynamic> toJson() => _$EventModelToJson(this);
// }
