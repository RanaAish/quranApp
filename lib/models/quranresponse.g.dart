// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quranresponse.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SurahAdapter extends TypeAdapter<Surah> {
  @override
  final int typeId = 1;

  @override
  Surah read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Surah(
      number: fields[0] as int,
      name: fields[1] as String,
      englishName: fields[2] as String,
      englishNameTranslation: fields[3] as String,
      revelationType: fields[4] as String,
      ayahs: (fields[5] as List)?.cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, Surah obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.englishName)
      ..writeByte(3)
      ..write(obj.englishNameTranslation)
      ..writeByte(4)
      ..write(obj.revelationType)
      ..writeByte(5)
      ..write(obj.ayahs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is SurahAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}

class EnAyhaAdapter extends TypeAdapter<EnAyha> {
  @override
  final int typeId = 3;

  @override
  EnAyha read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EnAyha(
      number: fields[0] as int,
      text: fields[1] as String,
      numberInSurah: fields[2] as int,
      juz: fields[3] as int,
      manzil: fields[4] as int,
      page: fields[5] as int,
      ruku: fields[6] as int,
      hizbQuarter: fields[7] as int,
      sajda: fields[8] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, EnAyha obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.numberInSurah)
      ..writeByte(3)
      ..write(obj.juz)
      ..writeByte(4)
      ..write(obj.manzil)
      ..writeByte(5)
      ..write(obj.page)
      ..writeByte(6)
      ..write(obj.ruku)
      ..writeByte(7)
      ..write(obj.hizbQuarter)
      ..writeByte(8)
      ..write(obj.sajda);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is EnAyhaAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}

class ArAyahAdapter extends TypeAdapter<ArAyah> {
  @override
  final int typeId = 2;

  @override
  ArAyah read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ArAyah(
      number: fields[0] as int,
      audio: fields[1] as String,
      audioSecondary: (fields[2] as List)?.cast<String>(),
      text: fields[3] as String,
      numberInSurah: fields[4] as int,
      juz: fields[5] as int,
      manzil: fields[6] as int,
      page: fields[7] as int,
      ruku: fields[8] as int,
      hizbQuarter: fields[9] as int,
      sajda: fields[10] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, ArAyah obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.audio)
      ..writeByte(2)
      ..write(obj.audioSecondary)
      ..writeByte(3)
      ..write(obj.text)
      ..writeByte(4)
      ..write(obj.numberInSurah)
      ..writeByte(5)
      ..write(obj.juz)
      ..writeByte(6)
      ..write(obj.manzil)
      ..writeByte(7)
      ..write(obj.page)
      ..writeByte(8)
      ..write(obj.ruku)
      ..writeByte(9)
      ..write(obj.hizbQuarter)
      ..writeByte(10)
      ..write(obj.sajda);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ArAyahAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}
