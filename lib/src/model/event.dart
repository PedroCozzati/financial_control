class EventEntity {
  String? key;
  EventData? eventData;

  EventEntity({this.key, this.eventData});
}

class EventData {
  String? value;
  String? description;
  String? type;
  String? category;
  String? date;

  EventData({
    required this.value,
    this.description,
    required this.type,
    required this.date,
    required this.category,
  });

  EventData.fromJson(Map<dynamic, dynamic> json) {
    value = json["value"];
    description = json["description"];
    type = json["type"];
    category = json["category"];
    date = json["date"];
  }
}
