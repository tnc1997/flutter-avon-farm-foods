import 'package:avon_farm_foods/types/predicate.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PredicateTabWidget<T> extends Tab {
  PredicateTabWidget({
    Widget icon,
    Key key,
    @required this.predicate,
    String text,
  })
      : super(icon: icon, key: key, text: text);

  final Predicate<T> predicate;
}
