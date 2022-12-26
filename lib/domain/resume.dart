class Resume {
  late int id;
  late String paragraph1;
  late String paragraph2;
  late String paragraph3;
  late String paragraph4;
  late String urlImage;
  late int idContent;

  Resume(
      {required this.id,
      required this.paragraph1,
      required this.paragraph2,
      required this.paragraph3,
      required this.paragraph4,
      required this.urlImage,
      required this.idContent});

  Resume.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    paragraph1 = json['paragraph1'];
    paragraph2 = json['paragraph2'];
    paragraph3 = json['paragraph3'];
    paragraph4 = json['paragraph4'];
    urlImage = json['url_image'];
    idContent = json['id_content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['paragraph1'] = this.paragraph1;
    data['paragraph2'] = this.paragraph2;
    data['paragraph3'] = this.paragraph3;
    data['paragraph4'] = this.paragraph4;
    data['url_image'] = this.urlImage;
    data['id_content'] = this.idContent;
    return data;
  }
}
