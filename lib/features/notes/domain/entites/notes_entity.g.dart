// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotesEntityAdapter extends TypeAdapter<NotesEntity> {
  @override
  final int typeId = 1;

  @override
  NotesEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotesEntity(
      title: fields[0] as String,
      content: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NotesEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotesEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
