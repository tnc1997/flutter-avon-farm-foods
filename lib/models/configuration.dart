import 'package:avon_farm_foods/enums/theme.dart';
import 'package:flutter/foundation.dart';

class Configuration {
  Configuration({@required this.theme}) : assert(theme != null);

  final AppTheme theme;

  Configuration copyWith({AppTheme theme}) {
    return new Configuration(theme: theme ?? this.theme);
  }
}
