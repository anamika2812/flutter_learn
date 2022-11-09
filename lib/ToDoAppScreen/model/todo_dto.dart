import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class TodoDTO {
  String? id;
  final String todoText;
  final Timestamp createdAt;

  TodoDTO({required this.todoText, required this.createdAt, this.id});

  TodoDTO copyWith({
    String? id,
    String? todoText,
    Timestamp? createdAt,
  }) {
    return TodoDTO(
      id: id ?? this.id,
      todoText: todoText ?? this.todoText,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'todoText': todoText,
      'createdAt': createdAt,
    };
  }

  factory TodoDTO.fromMap(Map<String, dynamic> map) {
    return TodoDTO(
      id: map['id'] != null ? map['id'] as String : null,
      todoText: map['todoText'] as String,
      createdAt: Timestamp.now(),
    );
  }

  String toJson() => json.encode(toMap());
  factory TodoDTO.fromJson(Map<String, dynamic> json) => TodoDTO(
        todoText: json["todoText"],
        createdAt: json["createdAt"],
      );

  @override
  String toString() =>
      'TodoDTO(id: $id, todoText: $todoText, createdAt: $createdAt)';

  @override
  bool operator ==(covariant TodoDTO other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.todoText == todoText &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^ todoText.hashCode ^ createdAt.hashCode;
  }
}
