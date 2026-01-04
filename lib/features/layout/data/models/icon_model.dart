import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'icon_model.g.dart';

@HiveType(typeId: 4)
class IconModel {
  @HiveField(0)
  final int codePoint;
  @HiveField(1)
  final String? fontFamily;
  @HiveField(2)
  final String? fontPackage;

  const IconModel({required this.codePoint, this.fontFamily, this.fontPackage});

  /// لتحويل IconModel إلى IconData
  IconData toIconData() =>
      IconData(codePoint, fontFamily: fontFamily, fontPackage: fontPackage);

  /// تحويل من IconData إلى IconModel
  factory IconModel.fromIconData(IconData icon) => IconModel(
    codePoint: icon.codePoint,
    fontFamily: icon.fontFamily,
    fontPackage: icon.fontPackage,
  );

  /// Serialize to a Map for storage (e.g., inside another model's map).
  Map<String, dynamic> toMap() => {
    'codePoint': codePoint,
    'fontFamily': fontFamily,
    'fontPackage': fontPackage,
  };

  /// Deserialize from a Map produced by [toMap].
  factory IconModel.fromMap(Map<String, dynamic> map) => IconModel(
    codePoint: map['codePoint'] as int,
    fontFamily: map['fontFamily'] as String?,
    fontPackage: map['fontPackage'] as String?,
  );
}

// touched to trigger code generation
