import 'package:flutter/material.dart';

/// Equatable class
///
/// This class is used to compare two objects
///
/// Example:
/// ```dart
/// class User extends Equatable {
///   final String name;
///   final int age;
///
///   User({required this.name, required this.age});
///
///   @override
///   List<Object?> get props => [name, age];
/// }
/// ```
///
@immutable
abstract class Equatable {
  /// List of properties to compare
  List<Object?> get probs;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Equatable &&
          runtimeType == other.runtimeType &&
          _equals(probs, other.probs);

  bool _equals(List<dynamic> props, List<dynamic> props2) {
    for (var i = 0; i < props.length; i++) {
      final result = identical(props[i], props2[i]);
      if (result == false) return false;
    }
    return true;
  }

  @override
  int get hashCode => super.hashCode;
}
