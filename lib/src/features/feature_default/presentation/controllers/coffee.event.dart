import 'package:freezed_annotation/freezed_annotation.dart';

part 'coffee.event.freezed.dart';

@freezed
class CoffeeEvent with _$CoffeeEvent {
  const factory CoffeeEvent.getCoffee() =
  GetCoffee;
}
