class ToDo {
  late String afazerText;
  late String dataText;
  late int isDone;

  ToDo({
    required this.afazerText,
    required this.dataText,
    this.isDone = 0,
  });

  ToDo.fromJson(Map<String, dynamic> json) {
    afazerText = json['afazerText'];
    dataText = json['dataText'];
    isDone = json['isDone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['afazerText'] = afazerText;
    data['dataText'] = dataText;
    data['isDone'] = isDone;
    return data;
  }
}
