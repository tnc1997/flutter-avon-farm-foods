// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Configuration _$ConfigurationFromJson(Map<String, dynamic> json) =>
    new Configuration(
        theme: json['theme'] == null
            ? null
            : AppTheme.values.singleWhere(
                (x) => x.toString() == "AppTheme.${json['theme']}"));

abstract class _$ConfigurationSerializerMixin {
  AppTheme get theme;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'theme': theme == null ? null : theme.toString().split('.')[1]
      };
}
