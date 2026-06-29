import 'dart:convert';

class TodoRequestDto {
  final String title;

  // Constructor
  const TodoRequestDto({
    required this.title,
  });

  // copyWith Method
  TodoRequestDto copyWith({
    String? title,
  }) {
    return TodoRequestDto(
      title: title ?? this.title,
    );
  }

  // Deserialization: Explicitly typed Map object
  factory TodoRequestDto.fromMap(Map<String, dynamic> map) {
    return TodoRequestDto(
      title: map['title'] as String,
    );
  }

  // Deserialization: From JSON String using explicit map casting
  factory TodoRequestDto.fromJson(String source) {
    final Map<String, dynamic> decodedMap =
        json.decode(source) as Map<String, dynamic>;
    return TodoRequestDto.fromMap(decodedMap);
  }

  // Serialization: Returns an explicitly typed Map object
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
    };
  }

  // Serialization: To JSON String
  String toJson() => json.encode(toMap());

  // == Operator
  @override
  bool operator ==(covariant TodoRequestDto other) {
    if (identical(this, other)) return true;

    return other.title == title;
  }

  // hashCode Method
  @override
  int get hashCode => title.hashCode;

  @override
  String toString() => 'TodoRequestDto(title: $title)';
}
