import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Helper{

  initDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "science_notes8.db");
    Database database = await openDatabase(
    path,
    version: 1,
    onCreate: onCreate,
    onUpgrade: onUpgrade,
    );

    print(path);
    return database;
  }


  Future<FutureOr<void>> onCreate(Database db, int version) async {
    String sql =
        'create table USER (id INTEGER PRIMARY KEY, email varchar(50), name varchar(50), image varchar(150), password varchar(8), username varchar(20), birthdate varchar(10));';
    await db.execute(sql);

    sql =
    "INSERT INTO USER (id, email, name, image, password, username, birthdate) "
        "VALUES (1, 'jfo3@aluno.ifal.edu.br', 'Júlia', 'https://animais.com', '12345', 'fjuliaaf', "
        "'21/04/2005');";
    await db.execute(sql);

    sql = 'create table MESSAGE (message varchar(150));';
    await db.execute(sql);

    sql = "INSERT INTO MESSAGE (message) "
        "VALUES ('Primeira mensagem do fórum.');";
    await db.execute(sql);

    sql =
    "create table DISCIPLINE (id int PRIMARY KEY, name varchar(20));";
    await db.execute(sql);

    sql =
    "create table CONTENT (id int PRIMARY KEY, image varchar(150), "
        "title varchar(50), colorButton varchar(50), colorContent varchar(50), "
        "introduction varchar(512), id_discipline int, constraint fk_content_id_discipline "
        "foreign key (id_discipline) references discipline(id));";
    await db.execute(sql);

    sql =
        "create table VIDEO (id int PRIMARY KEY, urlImage varchar(150), "
            "tituloVideo varchar(50), tempoDuracao varchar(5), urlVideo varchar(150),"
            "idContent int, constraint fk_video_id_content foreign key (idContent)"
            "references content (id));";
    await db.execute(sql);

    sql =
        "create table RESUME (id int PRIMARY KEY, paragraph1 text, "
            "paragraph2 text, paragraph3 text, paragraph4 text, url_image varchar(150),"
            "id_content int, constraint fk_resume_id_content foreign key (id_content)"
            "references content (id));";
    await db.execute(sql);

    sql =
    "create table QUESTION (id int PRIMARY KEY, institute varchar(50), "
        "question varchar(512), alt1 varchar(150), alt2 varchar(150), alt3 varchar(150),"
        "alt4 varchar(150), alt5 varchar(150), colorQuestion varchar(50), "
        "alter_correct int,"
        "id_content int, constraint fk_question_id_content foreign key (id_content)"
        "references content (id));";
    await db.execute(sql);


    sql =
    "INSERT INTO DISCIPLINE (id, name) VALUES(1, 'Fisica');";
    await db.execute(sql);

    sql =
    "INSERT INTO DISCIPLINE (id, name) VALUES(2, 'Quimica');";
    await db.execute(sql);

    sql =
    "INSERT INTO DISCIPLINE (id, name) VALUES(3, 'Biologia');";
    await db.execute(sql);


     sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(11, 'lib/assets/images/physical/kinematics.png', 'Cinemática', "
        "'0xFFABC6E5', '0xFFABC6E5',  'A cinemática é a área da mecânica que "
        "realiza os estudos dos movimentos, sem levar em consideração os motivos"
        " para que estes ocorram.', 1);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(12, 'lib/assets/images/physical/dinamic.png', 'Dinâmica', "
        "'0xFFABC6E5', '0xFFABC6E5',  'Dinâmica, uma das áreas que compõem a mecânica, "
        "é a parte da física que realiza o estudo das causas do movimento, de maneira a realizar a análise e descrever "
        "as forças que são responsáveis por produzi-las.', 1);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(13, 'lib/assets/images/physical/static.png', 'Estática', "
        "'0xFFABC6E5', '0xFFABC6E5', 'Estática é a parte da física, mais especificamente da mecânica, "
        "que realiza o estudo dos corpos que não se movimentam, ou seja, que estão em repouso.', 1);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(14, 'lib/assets/images/physical/hidro.png', 'Hidrostática e Hidrodinâmica', "
        "'0xFFABC6E5', '0xFFABC6E5', 'Hidrostática é a parte da física que realiza o estudo dos fluidos em repouso, "
        "já hidrodinâmica realiza o estudo desses fluidos em movimento.', 1);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(15, 'lib/assets/images/physical/thermology.png', 'Termologia', "
        "'0xFFABC6E5', '0xFFABC6E5', 'Termologia é um ramo da Física que estuda os fenômenos térmicos como calor, "
        "temperatura, dilatação, energia térmica, estudo térmico dos gases etc.', 1);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(16, 'lib/assets/images/physical/optics.png', 'Óptica', "
        "'0xFFABC6E5', '0xFFABC6E5', 'Óptica é a parte da Física que estuda fenômenos "
        "associados à luz. Podendo ser dividida em óptica geométrica e óptica física, de "
        "acordo com a forma que a luz se comporta.', 1);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(17, 'lib/assets/images/physical/wave.png', 'Ondulatória', "
        "'0xFFABC6E5', '0xFFABC6E5', 'Ondulatória é a parte da Física que estuda as "
        "ondas, ou seja, qualquer perturbação (pulso) que se propaga em um meio.', 1);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(18, 'lib/assets/images/physical/electrostatic.png', 'Eletrostática', "
        "'0xFFABC6E5', '0xFFABC6E5', 'Eletrostática é o ramo da eletricidade que "
        "estuda as propriedades e o comportamento de cargas elétricas em repouso.', 1);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(19, 'lib/assets/images/physical/electrodynamic.png', 'Eletrodinâmica', "
        "'0xFFABC6E5', '0xFFABC6E5', 'A eletrodinâmica é a parte da Física que estuda "
        "as cargas elétricas em movimento, ou seja, a dinâmica da eletricidade.', 1);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(110, 'lib/assets/images/physical/electromagnetism.png', 'Eletromagnetismo', "
        "'0xFFABC6E5', '0xFFABC6E5', 'O eletromagnetismo é a parte da Física que estuda a eletricidade e o magnetismo, bem como as relações estabelecidas entre eles.', 1);";
    await db.execute(sql);


    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(21, 'lib/assets/images/chemistry/atom.png', 'Átomo e Tabela periódica', "
        "'0xFFCCA9DD', '0xFFCCA9DD', 'O átomo é a unidade fundamental da matéria e a menor fração capaz de identificar um elemento químico. A tabela periódica, por sua vez, é um modelo que agrupa todos os elementos químicos e respectivas propriedades.', 2);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(22, 'lib/assets/images/chemistry/inorganic.png', 'Funções Inorgânicas', "
        "'0xFFCCA9DD', '0xFFCCA9DD', 'Funções inorgânicas são os grupos de substâncias químicas que não detêm como elemento químico central o carbono. As quatro classificações principais de funções inorgânicas são: ácidos, bases, sais e óxidos.', 2);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(23, 'lib/assets/images/chemistry/organic.png', 'Química Orgânica', "
        "'0xFFCCA9DD', '0xFFCCA9DD', 'A química orgânica é o ramo da química responsável pelo estudo dos compostos carbônicos, ou ainda compostos orgânicos, que apresentam em sua constituição átomos de carbono.', 2);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(24, 'lib/assets/images/chemistry/stoichiometry.png', 'Estequiometria', "
        "'0xFFCCA9DD', '0xFFCCA9DD', 'A Estequiometria é a forma de calcular, proporcionalmente, as quantidades de reagentes e produtos envolvidos em uma reação química.', 2);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(25, 'lib/assets/images/chemistry/solution.png', 'Soluções', "
        "'0xFFCCA9DD', '0xFFCCA9DD', 'Soluções são misturas homogêneas compostas por um ou mais solutos distintos dissolvidos em um solvente. É válido salientar que elas se apresentam, obrigatoriamente, em uma única fase no que diz respeito ao seu aspecto visual.', 2);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(26, 'lib/assets/images/chemistry/thermochemistry.png', 'Termoquímica', "
        "'0xFFCCA9DD', '0xFFCCA9DD', 'Termoquímica é a parte da química que estuda a quantidade de calor (energia) envolvida nas reações químicas, bem como a sua transferência em alguns fenômenos físicos.', 2);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(27, 'lib/assets/images/chemistry/kinetics.png', 'Cinética', "
        "'0xFFCCA9DD', '0xFFCCA9DD', 'A cinética é um ramo na ciência que estuda a velocidade das reações químicas, determinadas através de leis empíricas, assim como os fatores que a influenciam.', 2);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(28, 'lib/assets/images/chemistry/electrochemistry.png', 'Eletroquímica', "
        "'0xFFCCA9DD', '0xFFCCA9DD', 'Eletroquímica é um ramo da Química que estuda o fenômeno da transferência de elétrons para a transformação de energia química em energia elétrica e vice-versa.', 2);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(29, 'lib/assets/images/chemistry/balance.png', 'Equilibrio Químico', "
        "'0xFFCCA9DD', '0xFFCCA9DD', 'O equilíbrio químico é um fenômeno que acontece nas reações químicas reversíveis entre reagentes e produtos nas seguintes condições: quando a temperatura é constante e quando o sistema não apresenta trocas com o ambiente.', 2);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(210, 'lib/assets/images/chemistry/gases.png', 'Gases', "
        "'0xFFCCA9DD', '0xFFCCA9DD', 'Gases são compostos moleculares que possuem características como a grande compressibilidade e a capacidade de se expandirem. Eles não possuem volume fixo, são miscíveis entre si e em qualquer proporção.', 2);";
    await db.execute(sql);



    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(31, 'lib/assets/images/biology/cytology.png', 'Citologia', "
        "'0xFF8FB996', '0xFF8FB996', 'A citologia é a esfera da biologia que estuda as células, suas funções e sua importância na constituição dos seres vivos.Com o objetivo de compreender o ciclo de vida destes seres.', 3);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(32, 'lib/assets/images/biology/reproduction.png', 'Reprodução Humana', "
        "'0xFF8FB996', '0xFF8FB996', 'A reprodução humana é parte da Biologia que estuda o desenvolvimento de um novo organismo desde a sua fertilização até o momento do nascimento.',3);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(33, 'lib/assets/images/biology/embryology.png', 'Embriologia', "
        "'0xFF8FB996', '0xFF8FB996', 'A reprodução humana é parte da Biologia que estuda o desenvolvimento de um novo organismo desde a sua fertilização até o momento do nascimento.', 3);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(34, 'lib/assets/images/biology/biochemistry.png', 'Bioquímica', "
        "'0xFF8FB996', '0xFF8FB996', 'Bioquímica é a ciência que estuda os processos químicos que ocorrem nos organismos vivos. Esses processos químicos, abordam as estrutura e as função metabólicas de componentes celulares.', 3);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(35, 'lib/assets/images/biology/histology.png', 'Histologia', "
        "'0xFF8FB996', '0xFF8FB996', 'Histologia a ciência que estuda os tecidos.Por estabelecer o significado de aspectos microscópicos característicos de células e tecidos, bem como os estudos histológicos entre as relações entre estrutura e função.', 3);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(36, 'lib/assets/images/biology/physiology.png', 'Fisiologia', "
        "'0xFF8FB996', '0xFF8FB996', 'A Fisiologia o estudo das funções e do funcionamento normal dos seres vivos, como também dos processos físico-químicos.', 3);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(37, 'lib/assets/images/biology/genetics.png', 'Genética', "
        "'0xFF8FB996', '0xFF8FB996', 'A Genética é a ciência que estuda os genes, a hereditariedade e a variação entre os organismos.', 3);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(38, 'lib/assets/images/biology/botany.png', 'Botânica', "
        "'0xFF8FB996', '0xFF8FB996', 'A Botânica é a ciência que estuda as plantas e as algas.', 3);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(39, 'lib/assets/images/biology/zoology.png', 'Zoologia', "
        "'0xFF8FB996', '0xFF8FB996', 'A Zoologia é a ciência que estuda os animais, sejam espécies vivas ou extintas.', 3);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(310, 'lib/assets/images/biology/ecology.png', 'Ecologia', "
        "'0xFF8FB996', '0xFF8FB996', 'A Ecologia busca compreender o funcionamento de toda a natureza. Seus conhecimentos são pautados no estudo das diversas relações existentes entre os seres vivo como um todo.', 3);";
    await db.execute(sql);



    //videos de fisica
    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (111, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'Vídeo Física', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 11);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (121, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'Vídeo Física', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 12);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (131, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'Vídeo Física', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 13);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (141, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'Vídeo Física', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 14);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (151, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'Vídeo Física', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 15);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (161, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'Vídeo Física', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 16);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (171, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'Vídeo Física', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 17);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (181, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'Vídeo Física', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 18);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (191, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'Vídeo Física', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 19);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (1101, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'Vídeo Física', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 110);";
    await db.execute(sql);

    //videos de quimica
    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (211, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'Vídeo Química', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 21);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (221, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'Vídeo Química', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 22);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (231, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'Vídeo Química', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 23);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (241, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'Vídeo Química', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 24);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (251, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'Vídeo Química', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 25);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (261, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'Vídeo Química', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 26);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (271, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'Vídeo Química', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 27);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (281, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'Vídeo Química', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 28);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (291, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'Vídeo Química', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 29);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (2101, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'Vídeo Química', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 210);";
    await db.execute(sql);

    //videos de biologia
    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (311, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'Vídeo Biologia', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 31);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (321, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'Vídeo Biologia', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 32);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (331, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'Vídeo Biologia', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 33);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (341, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'Vídeo Biologia', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 34);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (351, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'Vídeo Biologia', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 35);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (361, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'Vídeo Biologia', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 36);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (371, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'Vídeo Biologia', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 37);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (381, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'Vídeo Biologia', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 38);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (391, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'Vídeo Biologia', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 39);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (3101, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'Vídeo Biologia', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 310);";
    await db.execute(sql);


    //cinemática -- ID_DISCI+ID_CONT+_ID_QUES
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(111, 'Exercício 1: (UECE 2021)',"
        "'Um trem parte de uma estação A em direção a uma estação B separada de A por uma distância de 4 km. Sabe-se que, partindo do repouso a partir de A, o trem acelera uniformemente até alcançar um ponto do trajeto a partir do qual passa a desacelerar uniformemente parando finalmente em B. Sabendo que o percurso entre A e B é realizado em apenas 6 min, a velocidade máxima, em km/h, alcançada pelo trem no referido percurso é ',"
        "'120.', '40.', '80.', '160.', '180.', '0xFFABC6E5', 3, 11);";
    await db.execute(sql);

    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(112, 'Exercício 2: (UECE 2021)',"
        "'As lavadoras de roupa compõem um grupo de eletrodomésticos muito presente nas residências. O seu funcionamento ocorre de acordo com uma programação prévia combinando diferentes tipos de movimentos de rotação do cesto. Na etapa final de lavagem (centrifugação), a máquina gira esse cesto a uma frequência de 1500 rpm. Considerando π ≈ 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente à parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFFABC6E5', 1, 11);";
    await db.execute(sql);

    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(113, 'Exercício 3: (VUNESP 2018)',"
        "'Um carro de competição percorre metade de um circuito com velocidade média de 200 km/h. Na segunda metade do circuito, o desempenho do carro melhora e sua velocidade média passa a ser 300 km/h. A velocidade média desse carro quando ele completa todo o circuito é de',"
        "'225 km/h.', '275 km/h.', '220 km/h.', '230 km/h.', '240 km/h.', '0xFFABC6E5', 5, 11);";
    await db.execute(sql);

    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(114, 'Exercício 4: (UFMS 2018)',"
        "'No dia 4 de novembro de 2018, foi realizada a 8ª volta UFMS. O percurso tem largada e chegada em frente ao prédio da Reitoria da universidade, com circuitos de uma ou duas voltas, sendo cada volta de 3,5 km."
        " Um atleta que correrá as duas voltas terminará a primeira volta com um pace médio de 6,0 min/km. Como ele pretende completar a prova com um pace médio de 5,0 min/km, a segunda volta deve ser completada com uma velocidade média de:',"
        "'4,0 km/h.', '12 km/h.', '14,4 km/h.', '15 km/h.', '18 km/h.', '0xFFABC6E5', 4, 11);";
    await db.execute(sql);

    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(115, 'Exercício 5: (VUNESP 2019)',"
        "'Depois de ter feito uma viagem entre duas cidades, o motorista calculou sua velocidade escalar média no percurso considerando seu deslocamento escalar e o intervalo de tempo gasto. Após alguns cálculos, ele concluiu que se tivesse feito a mesma viagem, pela mesma trajetória, com uma velocidade escalar média 25% maior, o intervalo de tempo gasto teria sido reduzido em',"
        "'25%.', '20%.', '12%.', '15%.', '10%.', '0xFFABC6E5', 2, 11);";
    await db.execute(sql);

    //dinamica
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(121, 'Exercício 1: (MARINHA 2021)',"
        "'Um guindaste do Arsenal de Marinha do Rio de Janeiro (AMRJ) suspende um objeto de 200Kg a uma altura de 5m acima do nível do mar. Desprezando as dimensões do objeto e adotando o valor da aceleração da gravidade local igual a 10 m/s2, calcule a energia potencial do objeto em relação ao nível do mar, e marque a opção correta. ',"
        "'2KJ.', '4KJ.', '6KJ.', '8KJ.', '10KJ.', '0xFFABC6E5', 5, 12);";
    await db.execute(sql);

    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(122, 'Exercício 2: (AERONÁUTICA 2021)',"
        "'Um determinado carro elétrico (de massa 1850 kg e levando dois ocupantes de massa igual a 75 kg cada), partindo do repouso, em uma pista retilínea e horizontal, consegue atingir a velocidade de 108 km/h em 4,0 segundos.     Para obter essa aceleração o motor elétrico desse carro deverá ter no mínimo, a potência de ____ HP (horse-power). "
        "Utilize 1 HP = 750 W e despreze o atrito com o ar. ',"
        "'225.', '300.', '450.', '600.', '150.', '0xFFABC6E5', 2, 12);";
    await db.execute(sql);

    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(123, 'Exercício 3: (FUNDEP 2021)',"
        "'Um casal de patinadores faz uma apresentação de patinação artística no gelo, quando, em dado momento, estando os dois em repouso, o homem, de 72 kg, empurra sua companheira, de 48 kg, na horizontal e ela passa a se mover a uma velocidade de 18 km/h."
        "Considerando apenas as forças de interação entre o casal, qual é o impulso aplicado ao rapaz, em N.s, na interação entre eles? ',"
        "'240.', '360.', '864.', '1296.', '764.', '0xFFABC6E5', 1, 12);";
    await db.execute(sql);

    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(124, 'Exercício 4: (AERONÁUTICA 2020)',"
        "'Um trem parte do repouso sobre uma linha horizontal e deve alcançar a velocidade de 72 km/h. Até atingir essa velocidade, o movimento do trem tem aceleração constante de 0,50 m/s2 , sendo que resistências passivas absorvem 5,0% da energia fornecida pela locomotiva. O esforço médio, em N, fornecido pela locomotiva para transportar uma carga de 1,0 ton é',"
        "'2,5×10^2.', '4,8×10^2.', '5,0×10^2.', '5,3×10^2.', '1,0×10^3.', '0xFFABC6E5', 4, 12);";
    await db.execute(sql);

    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(125, 'Exercício 5: (MARINHA 2020)',"
        "'Durante uma partida de vôlei, um atleta realiza um saque suspendendo uma bola (de massa m=0,2 Kg) a uma altura de 2 m do solo e a golpeando, de forma que a bola descreva uma trajetória oblíqua. Após o saque, a bola toca o solo a 30 m do local de lançamento. Sabendo que a bola leva 0,9 s para alcançar o ponto mais alto de sua trajetória e o tempo de contato da mão do atleta com a bola é de 0,01 s, qual foi o módulo da força média aplicada sobre a bola? (considere a aceleração da gravidade g=10 m/s2 e despreze a força de resistência do ar).',"
        "'75N.', '100N.', '150N.', '350N.', '450N.', '0xFFABC6E5', 4, 12);";
    await db.execute(sql);

    //ESTATICA
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(131, 'Exercício 1: (ANCONPREV 2020)',"
        "'Quanto aos tipos de escoamento de fluidos, indique a sentença verdadeira:', "
        "'Escoamento laminar descreve o fluxo irregular de água com velocidade média.', "
        "'No escoamento turbulento a perda de energia é menor do que no escoamento laminar.', "
        "'O escoamento permanente ocorre quando a vazão é crescente ao longo do tempo.', "
        "'O escoamento supercrítico desenvolve-se em pequenas profundidades e grandes velocidade',"
        "'O escoamento subcrítico se desenvolve em baixas profundidade e pequenas velocidades', "
        "'0xFFABC6E5', 5, 13);";
    await db.execute(sql);

    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(132, 'Exercício 2: (FUNDEP 2019)',"
        "'Duas crianças sustentam uma sacola de brinquedos de 30 kg, puxando-a pelas alças. Se uma das crianças faz uma força de 150 N e o ângulo entre a força dessa criança e a da segunda é de 30º, podemos concluir que a segunda criança faz uma força de', "
        "'50 N.', "
        "'161 N.', "
        "'180 N.', "
        "'450 N.',"
        "'123 N.', "
        "'0xFFABC6E5', 5, 13);";
    await db.execute(sql);

    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(133, 'Exercício 3: (FUVEST 2021)',"
        "'Um móbile pendurado no teto tem três elefantezinhos presos um ao outro por fios. As massas dos elefantes de cima, do meio e de baixo são, respectivamente, 20 g, 30 g e 70 g. Os valores de tensão, em newtons, nos fios superior, médio e inferior são, respectivamente, iguais a"
        " Desconsidere as massas dos fios. Aceleração da gravidade g = 10 m/s² .', "
        "'1,7; 1,0; 0,7.', "
        "'1,2; 0,5; 0,2.', "
        "'0,2; 0,5; 1,2.', "
        "'0,2; 0,3; 0,7.', "
        "'1,7; 0,5; 1,2.', "
        "'0xFFABC6E5', 1, 13);";
    await db.execute(sql);

    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(134, 'Exercício 4: (ENEM 2021)',"
        "'A Torre Eiffel, com seus 324 metros de altura, feita com treliças de ferro, pesava 7 300 toneladas quando terminou de ser construída em 1889. Um arquiteto resolve construir um protótipo dessa torre em escala 1:100, usando os mesmos materiais (cada dimensão linear em escala de 1:100 do monumento real). Considere que a torre real tenha uma massa Mtorre e exerça na fundação sobre a qual foi erguida uma pressão Ptorre. O modelo construído pelo arquiteto terá uma massa Mmodelo e exercerá uma pressão Pmodelo."
        "Como a pressão exercida pela torre se compara com a pressão exercida pelo protótipo? Ou seja, qual é a razão entre as pressões (Ptorre)/(Pmodelo) ?', "
        "'10^0', "
        "'10^1', "
        "'10^2', "
        "'10^4',"
        "'10^6' ,"
        "'0xFFABC6E5', 5, 13);";
    await db.execute(sql);

    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(135, 'Exercício 5: (ENEM 2019)',"
        "'Slackline é um esporte no qual o atleta deve se equilibrar e executar manobras estando sobre uma fita esticada. Para a prática do esporte, as duas extremidades da fita são fixadas de forma que ela fique a alguns centímetros do solo. Quando uma atleta de massa igual a 80 kg está exatamente no meio da fita, essa se desloca verticalmente, formando um ângulo de 10° com a horizontal, como esquematizado na figura. Sabe-se que a aceleração da gravidade é igual a 10 m s−2, cos(10°) = 0,98 e sen(10°) = 0,17."
        "Qual é a força que a fita exerce em cada uma das árvores por causa da presença da atleta?',"
        "'4,0 × 10^2 N', "
        "'4,1 × 10^2 N', "
        "'8,0 × 10^2 N', "
        "'2,4 × 10^3 N', "
        "'4,7 × 10^3 N', "
        "'0xFFABC6E5', 5, 13);";
    await db.execute(sql);


    //HIDRO
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(141, 'Exercício 1: (ENEM 2019)',"
        "'Um experimento simples, que pode ser realizado com materiais encontrados em casa, é realizado da seguinte forma: adiciona-se um volume de etanol em um copo de vidro e, em seguida, uma folha de papel. Com o passar do tempo, observa-se um comportamento peculiar: o etanol se desloca sobre a superfície do papel, superando a gravidade que o atrai no sentido oposto, como mostra a imagem. Para parte dos estudantes, isso ocorre por causa da absorção do líquido pelo papel."
        "Do ponto de vista científico, o que explica o movimento do líquido é a', "
        "'evaporação do líquido.', "
        "'diferença de densidades.', "
        "'reação química com o papel.', "
        "'capilaridade nos poros do papel.', "
        "'resistência ao escoamento do líquido.', "
        "'0xFFABC6E5', 5, 14);";
    await db.execute(sql);

    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(142, 'Exercício 2: (ENEM 2014)',"
        "'Em um experimento, foram separados três recipientes A, B e C, contendo 200 mL de líquidos distintos: o recipiente A continha água, com densidade de 1,00 g/mL; o recipiente B, álcool etílico, com densidade de 0,79 g/mL; e o recipiente C, clorofórmio, com densidade de 1,48 g/mL. Em cada um desses recipientes foi adicionada uma pedra de gelo, com densidade próxima a 0,90 g/mL."
        "No experimento apresentado, observou-se que a pedra de gelo', "
        "'flutuou em A, flutuou em B e flutuou em C.', "
        "'flutuou em A, afundou em B e flutuou em C.', "
        "'afundou em A, afundou em B e flutuou em C.', "
        "'afundou em A, flutuou em B e afundou em C', "
        "'flutuou em A, afundou em B e afundou em C.',"
        "'0xFFABC6E5', 5, 14);";
    await db.execute(sql);

    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(143, 'Exercício 3: (ENEM 2016)',"
        "'Um navio petroleiro é capaz de transportar milhares de toneladas de carga. Neste caso, uma grande quantidade de massa consegue flutuar."
        "Nesta situação, o empuxo é', "
        "'maior que a força peso do petroleiro.', "
        "'igual à força peso do petroleiro.', "
        "'maior que a força peso da água deslocada.', "
        "'igual à força peso do volume submerso do navio.', "
        "'igual à massa da água deslocada.',"
        "'0xFFABC6E5', 5, 14);";
    await db.execute(sql);

    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(144, 'Exercício 4: (ENEM 2010)',"
        "'Ao apertar a garrafa, o movimento de descida do frasco ocorre porque', "
        "'diminui a força para baixo que a água aplica no frasco.', "
        "'aumenta a pressão na parte pressionada da garrafa.', "
        "'aumenta a quantidade de água que fica dentro do frasco.', "
        "'diminui a força de resistência da água sobre o frasco.',"
        "'diminui a pressão que a água aplica na base do frasco.', "
        "'0xFFABC6E5', 5, 14);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(145, 'Exercício 5: (ENEM 2021)',"
        "'Um agricultor deseja utilizar um motor para bombear água (ρ água = 1 kg L−1) de um rio até um reservatório onde existe um desnível de 30 m de altura entre o rio e o reservatório, como representado na figura. Ele necessita de uma vazão constante de 3 600 litros de água por hora. Considere a aceleração da gravidade igual a 10 m s−2."
        "Considerando a situação apresentada e desprezando efeitos de perdas mecânicas e elétricas, qual deve ser a potência mínima do motor para realizar a operação?', "
        "'1,0 × 10^1 W', "
        "'5,0 × 10^1 W', "
        "'3,0 × 10^2 W', "
        "'3,6 × 10^4 W',"
        "'1,1 × 10^6 W', "
        "'0xFFABC6E5', 5, 14);";
    await db.execute(sql);


    //TERMO
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(151, 'Exercício 1: (UNIFESO 2019)',"
        "'Em um café da manhã, mistura-se café a 80ºC com leite a 10ºC para se obter 400 mL de café com leite a 50ºC. Considerando que café e leite apresentam calor específico e densidade iguais, a quantidade de leite a ser utilizada na mistura, em mL, será aproximadamente:', "
        "'140', "
        "'150', "
        "'160', "
        "'170', "
        "'180',"
        "'0xFFABC6E5', 5, 15);";
    await db.execute(sql);

    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(152, 'Exercício 2: (CONSULPLAN 2021)',"
        "'Se uma pessoa deixar uma chapa de ferro sobre fogo alto por cinco minutos e, logo após, borrifar água em cima da chapa, irá observar que as gotículas “pularão” e desaparecerão em contato com a superfície ultra-aquecida. Qual a mudança de estado físico foi observada por esta pessoa?', "
        "'Ebulição.', "
        "'Calefação.', "
        "'Evaporação.', "
        "'Sublimação.', "
        "'Solidificação.', "
        "'0xFFABC6E5', 5, 15);";
    await db.execute(sql);

    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(153, 'Exercício 3: (UEG 2021)',"
        "'Com o surgimento do novo corona vírus, muitos laboratórios já apresentaram as suas vacinas. Em especial, um laboratório americano disse que durante o armazenamento/transporte sua vacina deve ser mantida a -70°C. Os EUA ainda utilizam no seu dia-a-dia a escala termométrica Fahrenheit (símbolo °F)."
        "Qual é o valor dessa temperatura em °F?', "
        "'38,0', "
        "'-70,8', "
        "'-94,0', "
        "'70,0', "
        "'-38,0', "
        "'0xFFABC6E5', 5, 15);";
    await db.execute(sql);

    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(154, 'Exercício 4: (SELECON 2021)',"
        "'As temperaturas correspondentes nas escalas Celsius e Kelvin,respectivamente,para a temperatura 100°F são iguais a:', "
        "'100ºC e 100K', "
        "'132,7ºC e 405,7K', "
        "'37,7ºC e 310,7K', "
        "'302,5ºC e 575,5K', "
        "'575,5,5ºC e 580,5K', "
        "'0xFFABC6E5', 5, 15);";
    await db.execute(sql);

    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(155, 'Exercício 5: (SEE-AC 2020)',"
        "'Na ocorrência de incêndios as chamas tendem a subir. O processo responsável por esta ocorrência é a:', "
        "'condução.', "
        "'irradiação.', "
        "'convecção.', "
        "'ebulição.', "
        "'evaporação.', "
        "'0xFFABC6E5', 5, 15);";
    await db.execute(sql);


    //optica
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(161, 'Exercício 1: (AOCP 2021)',"
        "'Em relação às lupas, assinale a alternativa correta.', "
        "'A lupa é um instrumento óptico composto de apenas uma lente divergente.', "
        "'Para a correta utilização de uma lupa, o objeto deve se encontrar antes do ponto antiprincipal.', "
        "'Quando a imagem formada por uma lupa se encontra do mesmo lado do objeto, ela é real e invertida.', "
        "'Se a vergência de uma lupa é de 20 dioptrias, sua distância focal é de 10 cm.', "
        "'Uma lupa de 20 dioptrias forma uma imagem cinco vezes maior de um objeto colocado a 4 cm de seu centro óptico.', "
        "'0xFFABC6E5', 5, 16);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(162, 'Exercício 2: (MS CONCURSOS 2018)',"
        "'O raio luminoso é uma onda progressiva de campos elétricos e magnéticos, ou seja, é uma onda eletromagnética. No espectro eletromagnético, encontram-se outras formas de ondas, tais como as ondas de rádio, as micro-ondas, raios infravermelhos e ultravioletas. Escolha a alternativa correta, que define em qual velocidade as ondas de rádio se propagam no vácuo.', "
        "'Na velocidade do som.', "
        "'Abaixo da velocidade do som.', "
        "'Na mesma velocidade da Luz visível.', "
        "'Abaixo da velocidade da Luz visível.', "
        "'Acima da velocidade da Luz visível.', "
        "'0xFFABC6E5', 5, 16);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(163, 'Exercício 3: (INSTITUTO AOCP 2019)',"
        "'Quando um feixe de luz monocromático passa de um meio menos refringente para um meio mais refringente, esse feixe tem', "
        "'a sua velocidade aumentada.', "
        "'a sua frequência diminuída.', "
        "'a sua velocidade diminuída.', "
        "'o seu comprimento de onda inalterado.', "
        "'a cor alterada.', "
        "'0xFFABC6E5', 5, 16);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(164, 'Exercício 4: (PREFEITURA DE CRISTALINA 2018)',"
        "'O fenômeno óptico em que a luz incide sobre uma superfície e retorna ao seu meio de origem é conhecido como', "
        "'difração da luz.', "
        "'dispersão da luz.', "
        "'reflexão da luz.', "
        "'refração da luz.', "
        "'polarização da luz.', "
        "'0xFFABC6E5', 5, 16);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(165, 'Exercício 4: (SEDUC-GO 2010)',"
        "'Quando a luz proveniente de uma fonte puntiforme incide sobre um contorno retilíneo, o contorno da sombra projetada sobre um plano nunca é perfeitamente retilíneo. A explicação desse efeito é que a luz, assim como o som, tem características ondulatórias. Tal efeito constitui o fenômeno chamado', "
        "'difração.', "
        "'dispersão.', "
        "'espalhamento.', "
        "'polarização.', "
        "'sublimação.', "
        "'0xFFABC6E5', 5, 16);";
    await db.execute(sql);

    //ondulatoria
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(171, 'Exercício 1: (FUNDEP 2018)',"
        "'Considere que João está gritando quando seu professor de Física entra na sala de aula. Aproveitando a última aula sobre ondas sonoras, o seu professor o adverte: “— João, que som forte e baixo! De longe reconheci seu timbre!” As palavras destacadas na fala do professor se referem, respectivamente, a', "
        "'amplitude, frequência e forma da onda.', "
        "'forma da onda, amplitude e frequência.', "
        "'frequência, amplitude e forma da onda.', "
        "'comprimento de onda, frequência e forma da onda.', "
        "'forma de onda, frequência e amplitude.', "
        "'0xFFABC6E5', 5, 17);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(172, 'Exercício 2: (SEE-AC 2020)',"
        "'Em um experimento, a tela de visualização está posicionada a 2,0 m das fendas que distam entre si 0,54 mm. No padrão de interferência gerado foi observado que o espaçamento entre as franjas é de 2,0 mm. Qual é o comprimento de onda da luz usada neste experimento?', "
        "'450 nm', "
        "'500 nm', "
        "'540 nm', "
        "'610 nm', "
        "'700 nm', "
        "'0xFFABC6E5', 5, 17);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(173, 'Exercício 3: (IBADE 2018)',"
        "'Quando uma onda é produzida pela deformação de um meio material, como uma onda na superfície da água, é classificada como:', "
        "'mecânica.', "
        "'longitudinal.', "
        "'eletromagnética.', "
        "'transversal.', "
        "'IMPRÓPRIA', "
        "'0xFFABC6E5', 5, 17);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(174, 'Exercício 4: (SEE-AC 2020)',"
        "'A velocidade de propagação de uma onda sonora é determinada em função', "
        "'da frequência sonora.', "
        "'da intensidade sonora.', "
        "'do comprimento de onda.', "
        "'da amplitude sonora.', "
        "'das características do meio.', "
        "'0xFFABC6E5', 5, 17);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(175, 'Exercício 5: (SEED-PR 2021)',"
        "'Na interferência de duas ondas sonoras harmônicas de frequências levemente diferentes, a intensidade do som que se ouve muda de máxima para mínima a cada 0,2 s. A diferença entre as frequências das duas ondas sonoras é de', "
        "'2 Hz', "
        "'2.5 Hz', "
        "'4 Hz', "
        "'5 Hz', "
        "'6 Hz', "
        "'0xFFABC6E5', 5, 17);";
    await db.execute(sql);

    //ELETROSTATICA
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(181, 'Exercício 1: (ENEM 2021)',"
        "'O desfibrilador salva vidas de pessoas que são acometidas por ataques cardíacos ou arritmias. Ele dispõe de um capacitor que pode ser carregado por uma fonte com uma alta tensão. Usando o desfibrilador, pode-se fornecer energia ao coração, por meio de um choque elétrico, para que ele volte a pulsar novamente em seu ritmo normal. Um socorrista dispõe de um desfibrilador com capacitor de 70 microfarads que pode armazenar cerca de 220 J de energia, quando conectado a uma tensão de 2 500 V."
        "O valor da carga armazenada por esse desfibrilador, em coulomb, é de', "
        "'0,015', "
        "'0,088', "
        "'0,175', "
        "'3,15', "
        "'11,4', "
        "'0xFFABC6E5', 5, 18);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(182, 'Exercício 2: (ENEM 2014)',"
        "'A grandeza física associada ao brilho instantâneo da lâmpada fluorescente, por estar próxima a uma descarga elétrica, é o(a)', "
        "'carga elétrica.', "
        "'campo elétrico.', "
        "'corrente elétrica.', "
        "'capacitância elétrica.', "
        "'condutividade elétrica.', "
        "'0xFFABC6E5', 5, 18);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(183, 'Exercício 3: (ENEM 2013)',"
        "'Em uma experiência didática, cinco esferas de metal foram presas em um barbante, de forma que a distância entre esferas consecutivas aumentava em progressão aritmética. O barbante foi suspenso e a primeira esfera ficou em contato com o chão. Olhando o barbante de baixo para cima, as distâncias entre as esferas ficavam cada vez maiores. Quando o barbante foi solto, o som das colisões entre duas esferas consecutivas e o solo foi gerado em intervalos de tempo exatamente iguais."
        "A razão de os intervalos de tempo citados serem iguais é que a', "
        "'velocidade de cada esfera é constante.', "
        "'força resultante em cada esfera é constante.', "
        "'aceleração de cada esfera aumenta com o tempo.', "
        "'tensão aplicada em cada esfera aumenta com o tempo.', "
        "'energia mecânica de cada esfera aumenta com o tempo.', "
        "'0xFFABC6E5', 5, 18);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(184, 'Exercício 4: (CEDERJ 2020)',"
        "'A tensão eletrostática e a resistência elétrica do corpo humano variam de indivíduo para indivíduo, essa última pode variar de 500 Q até 500.000 Q à passagem de corrente elétrica. Com base no enunciado, a menor tensão elétrica, em Volts (V) que o corpo humano estaria submetido, caso fosse atingido por um raio de 30 mil amperes, vale:', "
        "'0,06', "
        "'60', "
        "'1,5x10^7', "
        "'1,5x10^10', "
        "'1,5', "
        "'0xFFABC6E5', 5, 18);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(185, 'Exercício 5: (SEE-AC 2020)',"
        "'Uma das aplicações científicas/tecnológica do conhecimento da eletrostática foi a invenção da impressora a jato de tinta. Esta impressora usa pequenas gotas de tinta que podem ser eletricamente neutras ou eletrizadas positiva ou negativamente. No funcionamento da impressora essas gotas penetram as placas defletoras onde existe um campo elétrico uniforme “E”. As gotas atingem o papel formando as letras. Observando a figura a seguir nota-se o percurso de três gotas atravessando a região entre as placas até atingir o papel em baixo. Na figura abaixo a direção do campo elétrico está indicada emergindo da placa A para placa B. As gotas 1, 2 e 3, observando seus desvios, respectivamente estão:', "
        "'Carregadas negativamente, neutra e carregada positivamente.', "
        "'Neutra, carregada positivamente e carregada negativamente.', "
        "'Carregada positivamente, carregada negativamente e neutra.', "
        "'Carregada positivamente, neutra e carregada negativamente.', "
        "'Neutra, carregada negativamente e carregada positivamente.', "
        "'0xFFABC6E5', 5, 18);";
    await db.execute(sql);


    //eletrodinamica
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(191, 'Exercício 1: (SEED-PR 2021)',"
        "'Um aparelho de ar condicionado apresenta uma potência de 0,8 kW. Durante o mês de janeiro este eletrodoméstico ficava ligado durante 6 horas todos os dias. Sabendo que 1 kWh custa R\$ 0,50. O custo gerado por este aparelho no mês de janeiro foi:', "
        "'R\$ 74,40.', "
        "'R\$ 70,20.', "
        "'R\$ 63,00.', "
        "'R\$ 55,80.', "
        "'R\$ 49,30.', "
        "'0xFFABC6E5', 5, 19);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(192, 'Exercício 2: (UERR 2017)',"
        "'As medidas baseadas na luz e outras formas de radiação eletromagnética (REM) são amplamente empregadas em química analítica. As interações da radiação com a matéria são estudo da ciência da espectroscopia. Em relação às propriedades da radiação eletromagnética é incorreto afirmar que:', "
        "'a REM é uma forma de energia que é transmitida através do espaço a velocidades enormes;', "
        "'a REM pode ser descrita como uma onda com propriedades como comprimento de onda, frequência, velocidade e amplitude;', "
        "'apenas uma parte da REM pode ser quantizada em fótons;', "
        "'a energia de um fóton é diretamente proporcional à sua frequência;', "
        "'comprimento de onda (λ): corresponde a distância entre duas cristas de onda, medida em direção à progressão de onda.', "
        "'0xFFABC6E5', 5, 19);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(193, 'Exercício 3: (UNESP 2019)',"
        "'Comumente se ouve falar dos perigos da alta voltagem em dispositivos elétricos. Todavia, uma alta voltagem pode não significar uma grande quantidade de energia se:', "
        "'o potencial elétrico envolvido for constante.', "
        "'a quantidade de carga envolvida for baixa', "
        "'o campo elétrico envolvido for uniforme.', "
        "'a força elétrica envolvida for baixa.', "
        "'o dispositivo for condutor de energia.', "
        "'0xFFABC6E5', 5, 19);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(194, 'Exercício 4: (FUNDEP 2019)',"
        "'Considere dois condutores, 1 e 2, de mesmo material, sendo o comprimento do fio 1 igual a três quartos do fio 2, e o diâmetro do fio 1 igual à terça parte do fio 2."
        "Se submetidos a uma mesma tensão elétrica, a razão entre as intensidades das correntes elétricas 1 e 2 será:', "
        "'9/4', "
        "'4/9', "
        "'4/27', "
        "'27/4', "
        "'27', "
        "'0xFFABC6E5', 5, 19);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(195, 'Exercício 5: (SEE-AC 2020)',"
        "'Foram associados em série seis capacitores iguais e a capacitância equivalente dessa associação é de 1,5 µF. Em seguida, foram associados quatro desses capacitores em paralelo a uma tensão de 100,0 V."
        "A energia potencial elétrica dessa nova associação, em J, é de aproximadamente', "
        "'1,8 x 10^–1.', "
        "'3,6 x 10^–4.', "
        "'4,5 x 10^–2.', "
        "'9,0 x 10^–6.', "
        "'9,0 x 10^-3.', "
        "'0xFFABC6E5', 5, 19);";
    await db.execute(sql);

    //eletromagnetismo
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(1101, 'Exercício 1: (PC-ES 2019)',"
        "'Sobre ímãs permanentes, assinale a alternativa correta.', "
        "'Não é possível desmagnetizar um ímã permanente.', "
        "'Quanto maior a força coercitiva em um material, menos susceptível à desmagnetização por campo magnético ele estará.', "
        "'Quanto menor o fluxo residual em um material, mais intenso será seu campo magnético após o processo de magnetização.', "
        "'Não alteram suas propriedades ao serem aquecidos.', "
        "'Para que estejam magnetizados, seus domínios magnéticos devem estar desalinhados.', "
        "'0xFFABC6E5', 5, 110);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(1102, 'Exercício 2: (PC-ES 2019)',"
        "'Em relação às ondas eletromagnéticas, é correto afirmar que', "
        "'consistem em intensidades de campo elétrico e magnético, oscilando na mesma frequência.', "
        "'no vácuo, seu comprimento de onda independe da frequência desta.', "
        "'o espectro eletromagnético se diferencia pela velocidade da onda no vácuo.', "
        "'não podem ser vistas a olho nú, independente de sua frequência.', "
        "'se propagam apenas em meios físicos.', "
        "'0xFFABC6E5', 5, 110);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(1103, 'Exercício 3: (FAU 2017)',"
        "'Dentre as principais vantagens no uso de relays de estado sólido frente aos eletromecânicos em instalações elétricas podemos destacar:', "
        "'Menor emissão de odores, operações de alta frequência e maior vida útil.', "
        "'Menor emissão de odores, operações de alta frequência e menor custo.', "
        "'Menor emissão de ruídos, operações de alta frequência e menor custo.', "
        "'Menor emissão de ruídos, operações de alta frequência e maior vida útil.', "
        "'Menor emissão de ruídos, não sofre aquecimento e maior vida útil.', "
        "'0xFFABC6E5', 5, 110);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(1104, 'Exercício 4: (UFGD 2019)',"
        "'Os materiais ferromagnéticos estão presentes em vários dispositivos eletromagnéticos. Um bom material ferromagnético é caracterizado por', "
        "'alta permissividade elétrica.', "
        "'alta permeabilidade magnética.', "
        "'alto índice de dureza do material.', "
        "'alto fator de potência de isolamento.', "
        "'alto fator de potência de isolamento.', "
        "'0xFFABC6E5', 5, 110);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(1105, 'Exercício 5: (SEE-AC 2020)',"
        "'Um resistor de 25 Ω é alimentado eletricamente por uma fonte senoidal com tensão de pico de 250 V."
        "A energia consumida por esse resistor em três horas é, em Wh, igual a', "
        "'1250', "
        "'1500', "
        "'3550', "
        "'5500', "
        "'7500', "
        "'0xFFABC6E5', 5, 110);";
    await db.execute(sql);

    //uma questão para os demais cards
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(211, 'Exercício 2: (UECE 2021)',"
        "'As lavadoras de roupa compõem um grupo de eletrodomésticos muito presente nas residências. O seu funcionamento ocorre de acordo com uma programação prévia combinando diferentes tipos de movimentos de rotação do cesto. Na etapa final de lavagem (centrifugação), a máquina gira esse cesto a uma frequência de 1500 rpm. Considerando π ≈ 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente à parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFFCCA9DD', 2, 21);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(221, 'Exercício 2: (UECE 2021)',"
        "'As lavadoras de roupa compõem um grupo de eletrodomésticos muito presente nas residências. O seu funcionamento ocorre de acordo com uma programação prévia combinando diferentes tipos de movimentos de rotação do cesto. Na etapa final de lavagem (centrifugação), a máquina gira esse cesto a uma frequência de 1500 rpm. Considerando π ≈ 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente à parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFFCCA9DD', 2, 22);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(231, 'Exercício 2: (UECE 2021)',"
        "'As lavadoras de roupa compõem um grupo de eletrodomésticos muito presente nas residências. O seu funcionamento ocorre de acordo com uma programação prévia combinando diferentes tipos de movimentos de rotação do cesto. Na etapa final de lavagem (centrifugação), a máquina gira esse cesto a uma frequência de 1500 rpm. Considerando π ≈ 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente à parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFFCCA9DD', 2, 23);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(241, 'Exercício 2: (UECE 2021)',"
        "'As lavadoras de roupa compõem um grupo de eletrodomésticos muito presente nas residências. O seu funcionamento ocorre de acordo com uma programação prévia combinando diferentes tipos de movimentos de rotação do cesto. Na etapa final de lavagem (centrifugação), a máquina gira esse cesto a uma frequência de 1500 rpm. Considerando π ≈ 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente à parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFFCCA9DD', 2, 24);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(251, 'Exercício 2: (UECE 2021)',"
        "'As lavadoras de roupa compõem um grupo de eletrodomésticos muito presente nas residências. O seu funcionamento ocorre de acordo com uma programação prévia combinando diferentes tipos de movimentos de rotação do cesto. Na etapa final de lavagem (centrifugação), a máquina gira esse cesto a uma frequência de 1500 rpm. Considerando π ≈ 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente à parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFFCCA9DD', 2, 25);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(261, 'Exercício 2: (UECE 2021)',"
        "'As lavadoras de roupa compõem um grupo de eletrodomésticos muito presente nas residências. O seu funcionamento ocorre de acordo com uma programação prévia combinando diferentes tipos de movimentos de rotação do cesto. Na etapa final de lavagem (centrifugação), a máquina gira esse cesto a uma frequência de 1500 rpm. Considerando π ≈ 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente à parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFFCCA9DD', 2, 26);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(271, 'Exercício 2: (UECE 2021)',"
        "'As lavadoras de roupa compõem um grupo de eletrodomésticos muito presente nas residências. O seu funcionamento ocorre de acordo com uma programação prévia combinando diferentes tipos de movimentos de rotação do cesto. Na etapa final de lavagem (centrifugação), a máquina gira esse cesto a uma frequência de 1500 rpm. Considerando π ≈ 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente à parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFFCCA9DD', 2, 27);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(281, 'Exercício 2: (UECE 2021)',"
        "'As lavadoras de roupa compõem um grupo de eletrodomésticos muito presente nas residências. O seu funcionamento ocorre de acordo com uma programação prévia combinando diferentes tipos de movimentos de rotação do cesto. Na etapa final de lavagem (centrifugação), a máquina gira esse cesto a uma frequência de 1500 rpm. Considerando π ≈ 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente à parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFFCCA9DD',2, 28);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(291, 'Exercício 2: (UECE 2021)',"
        "'As lavadoras de roupa compõem um grupo de eletrodomésticos muito presente nas residências. O seu funcionamento ocorre de acordo com uma programação prévia combinando diferentes tipos de movimentos de rotação do cesto. Na etapa final de lavagem (centrifugação), a máquina gira esse cesto a uma frequência de 1500 rpm. Considerando π ≈ 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente à parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFFCCA9DD', 2, 29);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(2101, 'Exercício 2: (UECE 2021)',"
        "'As lavadoras de roupa compõem um grupo de eletrodomésticos muito presente nas residências. O seu funcionamento ocorre de acordo com uma programação prévia combinando diferentes tipos de movimentos de rotação do cesto. Na etapa final de lavagem (centrifugação), a máquina gira esse cesto a uma frequência de 1500 rpm. Considerando π ≈ 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente à parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFFCCA9DD', 2, 210);";
    await db.execute(sql);


    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(311, 'Exercício 2: (UECE 2021)',"
        "'As lavadoras de roupa compõem um grupo de eletrodomésticos muito presente nas residências. O seu funcionamento ocorre de acordo com uma programação prévia combinando diferentes tipos de movimentos de rotação do cesto. Na etapa final de lavagem (centrifugação), a máquina gira esse cesto a uma frequência de 1500 rpm. Considerando π ≈ 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente à parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFF8FB996', 3, 31);";
    await db.execute(sql);

    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(3101, 'Exercício 2: (UECE 2021)',"
        "'As lavadoras de roupa compõem um grupo de eletrodomésticos muito presente nas residências. O seu funcionamento ocorre de acordo com uma programação prévia combinando diferentes tipos de movimentos de rotação do cesto. Na etapa final de lavagem (centrifugação), a máquina gira esse cesto a uma frequência de 1500 rpm. Considerando π ≈ 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente à parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFF8FB996', 3, 310);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(321, 'Exercício 2: (UECE 2021)',"
        "'As lavadoras de roupa compõem um grupo de eletrodomésticos muito presente nas residências. O seu funcionamento ocorre de acordo com uma programação prévia combinando diferentes tipos de movimentos de rotação do cesto. Na etapa final de lavagem (centrifugação), a máquina gira esse cesto a uma frequência de 1500 rpm. Considerando π ≈ 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente à parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFF8FB996', 3, 32);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(331, 'Exercício 2: (UECE 2021)',"
        "'As lavadoras de roupa compõem um grupo de eletrodomésticos muito presente nas residências. O seu funcionamento ocorre de acordo com uma programação prévia combinando diferentes tipos de movimentos de rotação do cesto. Na etapa final de lavagem (centrifugação), a máquina gira esse cesto a uma frequência de 1500 rpm. Considerando π ≈ 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente à parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFF8FB996', 3, 33);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(341, 'Exercício 2: (UECE 2021)',"
        "'As lavadoras de roupa compõem um grupo de eletrodomésticos muito presente nas residências. O seu funcionamento ocorre de acordo com uma programação prévia combinando diferentes tipos de movimentos de rotação do cesto. Na etapa final de lavagem (centrifugação), a máquina gira esse cesto a uma frequência de 1500 rpm. Considerando π ≈ 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente à parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFF8FB996', 3, 34);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(351, 'Exercício 2: (UECE 2021)',"
        "'As lavadoras de roupa compõem um grupo de eletrodomésticos muito presente nas residências. O seu funcionamento ocorre de acordo com uma programação prévia combinando diferentes tipos de movimentos de rotação do cesto. Na etapa final de lavagem (centrifugação), a máquina gira esse cesto a uma frequência de 1500 rpm. Considerando π ≈ 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente à parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFF8FB996', 3, 35);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(361, 'Exercício 2: (UECE 2021)',"
        "'As lavadoras de roupa compõem um grupo de eletrodomésticos muito presente nas residências. O seu funcionamento ocorre de acordo com uma programação prévia combinando diferentes tipos de movimentos de rotação do cesto. Na etapa final de lavagem (centrifugação), a máquina gira esse cesto a uma frequência de 1500 rpm. Considerando π ≈ 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente à parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFF8FB996', 3, 36);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(371, 'Exercício 2: (UECE 2021)',"
        "'As lavadoras de roupa compõem um grupo de eletrodomésticos muito presente nas residências. O seu funcionamento ocorre de acordo com uma programação prévia combinando diferentes tipos de movimentos de rotação do cesto. Na etapa final de lavagem (centrifugação), a máquina gira esse cesto a uma frequência de 1500 rpm. Considerando π ≈ 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente à parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFF8FB996', 3, 37);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(381, 'Exercício 2: (UECE 2021)',"
        "'As lavadoras de roupa compõem um grupo de eletrodomésticos muito presente nas residências. O seu funcionamento ocorre de acordo com uma programação prévia combinando diferentes tipos de movimentos de rotação do cesto. Na etapa final de lavagem (centrifugação), a máquina gira esse cesto a uma frequência de 1500 rpm. Considerando π ≈ 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente à parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFF8FB996', 3, 38);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(391, 'Exercício 2: (UECE 2021)',"
        "'As lavadoras de roupa compõem um grupo de eletrodomésticos muito presente nas residências. O seu funcionamento ocorre de acordo com uma programação prévia combinando diferentes tipos de movimentos de rotação do cesto. Na etapa final de lavagem (centrifugação), a máquina gira esse cesto a uma frequência de 1500 rpm. Considerando π ≈ 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente à parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFF8FB996', 3, 39);";
    await db.execute(sql);

    sql =
    "INSERT INTO RESUME (id, paragraph1, paragraph2, paragraph3, paragraph4, url_image, id_content) "
        "VALUES(1, "
        "'Tema tendenciosamente curioso que pode despertar ao novo. Afinal, ele aparenta retratar sobre o recomeço. E recomeço do quê ou de quem? Do Meio Ambiente, claro! Mas principalmente da relação do ser humano com a natureza. Um convite para restabelecer esta relação através do gesto de cuidado, respeito, responsabilidade, consciência e principalmente, de reaproximação do homem a natureza. O sentido desta curiosa ponte é que cabe a Psicologia estudar o homem enquanto ser biopsicossocial. E assumir a responsabilidade em cultivar práticas e ações que preservem a vida do ser humano, contribuindo para o gesto de autocuidado e de cuidador. E é nesta exata tarefa, que a Ecopsicologia retrata sobre a importância em minimizar comportamentos destrutivos e de negligência, que coloquem a natureza em risco, assim como a vida do homem.',"
        "'E como contraponto, sabe o que também se amplia? Os problemas de saúde, transtornos mentais, questões como pobreza e desigualdades. A distância e o descuido com a natureza aumentam, o cuidado com a economia material e financeira se amplia, e a saúde se coloca em risco. A vida humana sem as outras formas de natureza se aproxima de limites. E esta é a uma das mensagens da Ecopsicologia, a fim de fortalecer a conscientização de que o ser humano enquanto homem que se assemelha a sua natureza ao seu redor. E que assim como ela, carece de cuidado, de atenção, de respeito, de conhecimento e autoconhecimento, de relação, de troca e de mudanças. A natureza muda o tempo todo! E neste momento a perspectiva futura é de que ela seguirá mudando, mas não em uma condição infinita e controlável. Mas sim como tudo na vida, finita e carente de cuidado. Neste momento, estudos apontam que ela se encontra desprotegida, ameaçada, isolada e em risco. É preciso cuidá-la! Seu boletim médico se assemelha muito as estatísticas da sociedade. Parece que seus quadros são um tanto quanto parecidos. É preciso cuidá-los!',"
        "'Tema tendenciosamente curioso que pode despertar ao novo. Afinal, ele aparenta retratar sobre o recomeço. E recomeço do quê ou de quem? Do Meio Ambiente, claro! Mas principalmente da relação do ser humano com a natureza. Um convite para restabelecer esta relação através do gesto de cuidado, respeito, responsabilidade, consciência e principalmente, de reaproximação do homem a natureza. O sentido desta curiosa ponte é que cabe a Psicologia estudar o homem enquanto ser biopsicossocial. E assumir a responsabilidade em cultivar práticas e ações que preservem a vida do ser humano, contribuindo para o gesto de autocuidado e de cuidador. E é nesta exata tarefa, que a Ecopsicologia retrata sobre a importância em minimizar comportamentos destrutivos e de negligência, que coloquem a natureza em risco, assim como a vida do homem.',"
        "'E como contraponto, sabe o que também se amplia? Os problemas de saúde, transtornos mentais, questões como pobreza e desigualdades. A distância e o descuido com a natureza aumentam, o cuidado com a economia material e financeira se amplia, e a saúde se coloca em risco. A vida humana sem as outras formas de natureza se aproxima de limites. E esta é a uma das mensagens da Ecopsicologia, a fim de fortalecer a conscientização de que o ser humano enquanto homem que se assemelha a sua natureza ao seu redor. E que assim como ela, carece de cuidado, de atenção, de respeito, de conhecimento e autoconhecimento, de relação, de troca e de mudanças. A natureza muda o tempo todo! E neste momento a perspectiva futura é de que ela seguirá mudando, mas não em uma condição infinita e controlável. Mas sim como tudo na vida, finita e carente de cuidado. Neste momento, estudos apontam que ela se encontra desprotegida, ameaçada, isolada e em risco. É preciso cuidá-la! Seu boletim médico se assemelha muito as estatísticas da sociedade. Parece que seus quadros são um tanto quanto parecidos. É preciso cuidá-los!',"
        "'https://sociedadedospsicologos.files.wordpress.com/2021/06/natureza.jpg', 11);";
    await db.execute(sql);
  }

  Future<void> onUpgrade(Database db, int oldVersion, int newVersion) async {
    if(oldVersion == 1 && newVersion == 2){
      String sql = "CREATE TABLE user (username varchar(100) PRIMARY KEY, password varchar(100))";
      await db.execute(sql);

      sql = "INSERT INTO user (username, password) VALUES ('joao@gmail.com', '123456')";
      await db.execute(sql);
    }
  }
}
