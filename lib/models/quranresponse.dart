import 'dart:convert';
import 'package:hive/hive.dart';

part 'quranresponse.g.dart';


Quran quranFromJson(String str) => Quran.fromJson(json.decode(str));
String quranToJson(Quran data) => json.encode(data.toJson());

class Quran {
  Quran({
    this.code,
    this.status,
    this.data,
  });

  int code;
  String status;
  Data data;

  factory Quran.fromJson(Map<String, dynamic> json) => Quran(
    code: json["code"],
    status: json["status"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.surahs,
    this.edition,
  });

  List<Surah> surahs;
  Edition edition;


  factory Data.fromJson(Map<String, dynamic> json) => Data(
    surahs: List<Surah>.from(json["surahs"].map((x) => Surah.fromJson(x))),
    edition: Edition.fromJson(json["edition"]),
  );

  Map<String, dynamic> toJson() => {
    "surahs": List<dynamic>.from(surahs.map((x) => x.toJson())),
    "edition": edition.toJson(),
  };
}

class Edition {
  Edition({
    this.identifier,
    this.language,
    this.name,
    this.englishName,
    this.format,
    this.type,
  });

  String identifier;
  String language;
  String name;
  String englishName;
  String format;
  String type;

  factory Edition.fromJson(Map<String, dynamic> json) => Edition(
    identifier: json["identifier"],
    language: json["language"],
    name: json["name"],
    englishName: json["englishName"],
    format: json["format"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "identifier": identifier,
    "language": language,
    "name": name,
    "englishName": englishName,
    "format": format,
    "type": type,
  };
}


@HiveType(typeId : 1)
class Surah {
  Surah({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.revelationType,
    this.ayahs,
  });
  @HiveField(0)
  int number;
  @HiveField(1)
  String name;
  @HiveField(2)
  String englishName;
  @HiveField(3)
  String englishNameTranslation;
  @HiveField(4)
  String revelationType;
  @HiveField(5)
  List ayahs;


  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
      number: json["number"],
      name: json["name"],
      englishName: json["englishName"],
      englishNameTranslation: json["englishNameTranslation"],
      revelationType:json["revelationType"],
      ayahs :json["ayahs"][0].containsKey("audio")==true? List<ArAyah>.from(json["ayahs"].map((x) => ArAyah.fromJson(x)))
          :List<EnAyha>.from(json["ayahs"].map((x) => EnAyha.fromJson(x)))

  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "name": name,
    "englishName": englishName,
    "englishNameTranslation": englishNameTranslation,
    "revelationType":revelationType,
    "ayahs": List<dynamic>.from(ayahs.map((x) => x.toJson())),
  };
}
@HiveType(typeId : 3)
class EnAyha
{
  @HiveField(0)
  int number;
  @HiveField(1)
  String text;
  @HiveField(2)
  int numberInSurah;
  @HiveField(3)
  int juz;
  @HiveField(4)
  int manzil;
  @HiveField(5)
  int page;
  @HiveField(6)
  int ruku;
  @HiveField(7)
  int hizbQuarter;
  @HiveField(8)
  dynamic sajda;

  EnAyha(
      {this.number,
        this.text,
        this.numberInSurah,
        this.juz,
        this.manzil,
        this.page,
        this.ruku,
        this.hizbQuarter,
        this.sajda});

  factory  EnAyha.fromJson(Map<String, dynamic> json) => EnAyha (
    number: json["number"],
    text: json["text"],
    numberInSurah: json["numberInSurah"],
    juz: json["juz"],
    manzil: json["manzil"],
    page: json["page"],
    ruku: json["ruku"],
    hizbQuarter: json["hizbQuarter"],
    sajda: json["sajda"],
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "text": text,
    "numberInSurah": numberInSurah,
    "juz": juz,
    "manzil": manzil,
    "page": page,
    "ruku": ruku,
    "hizbQuarter": hizbQuarter,
    "sajda": sajda,
  };
}

@HiveType(typeId : 2)
class ArAyah {

  ArAyah ({
    this.number,
    this.audio,
    this.audioSecondary,
    this.text,
    this.numberInSurah,
    this.juz,
    this.manzil,
    this.page,
    this.ruku,
    this.hizbQuarter,
    this.sajda,
  });

  @HiveField(0)
  int number;
  @HiveField(1)
  String audio;
  @HiveField(2)
  List<String> audioSecondary;
  @HiveField(3)
  String text;
  @HiveField(4)
  int numberInSurah;
  @HiveField(5)
  int juz;
  @HiveField(6)
  int manzil;
  @HiveField(7)
  int page;
  @HiveField(8)
  int ruku;
  @HiveField(9)
  int hizbQuarter;
  @HiveField(10)
  dynamic sajda;

  factory ArAyah .fromJson(Map<String, dynamic> json) => ArAyah (
    number: json["number"],
    audio: json["audio"],
    audioSecondary: List<String>.from(json["audioSecondary"].map((x) => x)),
    text: json["text"],
    numberInSurah: json["numberInSurah"],
    juz: json["juz"],
    manzil: json["manzil"],
    page: json["page"],
    ruku: json["ruku"],
    hizbQuarter: json["hizbQuarter"],
    sajda: json["sajda"],
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "audio": audio,
    "audioSecondary": List<dynamic>.from(audioSecondary.map((x) => x)),
    "text": text,
    "numberInSurah": numberInSurah,
    "juz": juz,
    "manzil": manzil,
    "page": page,
    "ruku": ruku,
    "hizbQuarter": hizbQuarter,
    "sajda": sajda,
  };
}

class SajdaClass {
  SajdaClass({
    this.id,
    this.recommended,
    this.obligatory,
  });

  int id;
  bool recommended;
  bool obligatory;

  factory SajdaClass.fromJson(Map<String, dynamic> json) => SajdaClass(
    id: json["id"],
    recommended: json["recommended"],
    obligatory: json["obligatory"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "recommended": recommended,
    "obligatory": obligatory,
  };
}
class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}