// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TodoModel {
  String content;
  int id;
  bool completed;

  TodoModel({
    required this.content,
    required this.id,
    this.completed = false,
  });

  @override
  String toString() =>
      'TodoModel(content: $content, id: $id, completed: $completed)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'content': content,
      'id': id,
      'completed': completed,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      content: map['content'] as String,
      id: map['id'] as int,
      completed: map['completed'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
