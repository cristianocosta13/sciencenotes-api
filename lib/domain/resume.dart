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

/*class Resume {
  final String paragraph1;
  final String paragraph2;
  final String paragraph3;
  final String paragraph4;
  final String image;

  Resume({
    required this.paragraph1,
    required this.paragraph2,
    required this.paragraph3,
    required this.paragraph4,
    required this.image,
  });
}*/

/*
[{id: 1, paragraph1: Tema tendenciosamente curioso que pode despertar ao novo. Afinal, ele aparenta retratar sobre o recomeço. E recomeço do quê ou de quem? Do Meio Ambiente, claro! Mas principalmente da relação do ser humano com a natureza. Um convite para restabelecer esta relação através do gesto de cuidado, respeito, responsabilidade, consciência e principalmente, de reaproximação do homem a natureza. O sentido desta curiosa ponte é que cabe a Psicologia estudar o homem enquanto ser biopsicossocial. E assumir a responsabilidade em cultivar práticas e ações que preservem a vida do ser humano, contribuindo para o gesto de autocuidado e de cuidador. E é nesta exata tarefa, que a Ecopsicologia retrata sobre a importância em minimizar comportamentos destrutivos e de negligência, que coloquem a natureza em risco, assim como a vida do homem., paragraph2: E como contraponto, sabe o que também se amplia? Os problemas de saúde, transtornos mentais, questões como pobreza e desigualdades. A dist
 */
