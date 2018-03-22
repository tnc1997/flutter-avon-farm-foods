import 'package:avon_farm_foods/enums/theme.dart';
import 'package:json_annotation/json_annotation.dart';

part 'configuration.g.dart';

@JsonSerializable()
class Configuration extends Object with _$ConfigurationSerializerMixin {
  Configuration({this.theme = AppTheme.dark}) : assert(theme != null);

  final AppTheme theme;

  factory Configuration.fromJson(Map<String, dynamic> json) {
    return _$ConfigurationFromJson(json);
  }

  Configuration copyWith({AppTheme theme}) {
    return new Configuration(theme: theme ?? this.theme);
  }
}
