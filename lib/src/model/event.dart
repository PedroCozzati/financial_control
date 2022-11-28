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
    required this.value, this.description, required this.type, required this.date, required this.category
  });



  EventData.fromJson(Map<dynamic, dynamic> json){
    value = json["value"];
    description = json["description"];
    type = json["type"];
    category = json["category"];
    date = json["date"];
  }

  @override
  String toString() {
    // TODO: implement toString
      return 'Event: \nvalue:$value \n description: $description \n type: $type \n category: $category \n date: $date\n\n' ;
  }
}