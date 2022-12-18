class MessagesMongo {
  late String id;
  late String message;

  MessagesMongo({
    required this.id, required this.message
  });

  MessagesMongo.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['message'] = message;
    return data;
  }
}
