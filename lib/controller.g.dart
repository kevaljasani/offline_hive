// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class controllerAdapter extends TypeAdapter<controller> {
  @override
  final int typeId = 0;

  @override
  controller read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return controller(
      fields[0] as String,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, controller obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is controllerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
