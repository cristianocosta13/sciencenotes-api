class Mission {
  late String name;
  late String description;

  Mission({required this.name, required this.description});

  Mission.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['name'] = name;
    return data;
  }
}
