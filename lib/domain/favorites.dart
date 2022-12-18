class Favorites {
  late String nameDiscipline;
  late int idContent;

  Favorites({required this.nameDiscipline, required this.idContent});

  Favorites.fromJson(Map<String, dynamic> json) {
    nameDiscipline = json['nameDiscipline'];
    idContent = json['id_content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_content'] = idContent;
    data['nameDiscipline'] = nameDiscipline;
    return data;
  }
}
