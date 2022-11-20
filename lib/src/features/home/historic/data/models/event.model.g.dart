// // GENERATED CODE - DO NOT MODIFY BY HAND
//
// part of 'event.model.dart';
//
// // **************************************************************************
// // JsonSerializableGenerator
// // **************************************************************************
//
// EventModel _$EventModelFromJson(Map json) => EventModel(
//       value: json['value'] as String,
//       description: json['description'] as String,
//       isCredit: json['isCredit'] as bool,
//       date: DateTime.parse(json['date'] as String),
//       category:
//           (json['category'] as List<dynamic>).map((e) => e as String).toList(),
//     );
//
// Map<String, dynamic> _$EventModelToJson(EventModel instance) =>
//     <String, dynamic>{
//       'value': instance.value,
//       'description': instance.description,
//       'isCredit': instance.isCredit,
//       'category': instance.category,
//       'date': instance.date.toIso8601String(),
//     };
