import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Graph extends Equatable {
  final String id;
  final Color color;
  final String function;
  final bool isVisible;

  Graph({
    this.id,
    this.color,
    this.function,
    this.isVisible,
  });

  Graph copyWith({
    Color color,
    String function,
    bool isVisible,
  }) {
    return Graph(
      id: this.id,
      color: color ?? this.color,
      function: function ?? this.function,
      isVisible: isVisible ?? this.isVisible,
    );
  }

  @override
  List<Object> get props => [id];
}
