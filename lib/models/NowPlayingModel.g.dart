// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NowPlayingModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NowPlayingModelAdapter extends TypeAdapter<NowPlayingModel> {
  @override
  final int typeId = 1;

  @override
  NowPlayingModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NowPlayingModel(
      dates: fields[0] as Dates,
      page: fields[1] as int,
      results: (fields[2] as List)?.cast<Results>(),
      totalPages: fields[3] as int,
      totalResults: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, NowPlayingModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.dates)
      ..writeByte(1)
      ..write(obj.page)
      ..writeByte(2)
      ..write(obj.results)
      ..writeByte(3)
      ..write(obj.totalPages)
      ..writeByte(4)
      ..write(obj.totalResults);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NowPlayingModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DatesAdapter extends TypeAdapter<Dates> {
  @override
  final int typeId = 2;

  @override
  Dates read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Dates(
      maximum: fields[0] as String,
      minimum: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Dates obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.maximum)
      ..writeByte(1)
      ..write(obj.minimum);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ResultsAdapter extends TypeAdapter<Results> {
  @override
  final int typeId = 3;

  @override
  Results read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Results(
      adult: fields[0] as bool,
      backdropPath: fields[1] as String,
      genreIds: (fields[2] as List)?.cast<int>(),
      id: fields[3] as int,
      originalLanguage: fields[4] as String,
      originalTitle: fields[5] as String,
      overview: fields[6] as String,
      popularity: fields[7] as double,
      posterPath: fields[8] as String,
      releaseDate: fields[9] as String,
      title: fields[10] as String,
      video: fields[11] as bool,
      voteAverage: fields[12] as dynamic,
      voteCount: fields[13] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Results obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.backdropPath)
      ..writeByte(2)
      ..write(obj.genreIds)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.originalLanguage)
      ..writeByte(5)
      ..write(obj.originalTitle)
      ..writeByte(6)
      ..write(obj.overview)
      ..writeByte(7)
      ..write(obj.popularity)
      ..writeByte(8)
      ..write(obj.posterPath)
      ..writeByte(9)
      ..write(obj.releaseDate)
      ..writeByte(10)
      ..write(obj.title)
      ..writeByte(11)
      ..write(obj.video)
      ..writeByte(12)
      ..write(obj.voteAverage)
      ..writeByte(13)
      ..write(obj.voteCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResultsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
