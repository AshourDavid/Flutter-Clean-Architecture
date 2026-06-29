import 'dart:convert';

class TodoResponseDto {
  final int id;
  final String title;
  final bool ischecked;

  // Constructor
  const TodoResponseDto({
    required this.id,
    required this.title,
    required this.ischecked,
  });

  // 1. copyWith Method
  TodoResponseDto copyWith({
    int? id,
    String? title,
    bool? ischecked,
  }) {
    return TodoResponseDto(
      id: id ?? this.id,
      title: title ?? this.title,
      ischecked: ischecked ?? this.ischecked,
    );
  }

  // 2. Deserialization: From explicitly typed Map object
  factory TodoResponseDto.fromMap(Map<String, dynamic> map) {
    return TodoResponseDto(
      id: map['id'] as int,
      title: map['title'] as String,
      ischecked: map['ischecked'] as bool,
    );
  }

  // Deserialization: From JSON String using explicit map casting
  factory TodoResponseDto.fromJson(String source) {
    final Map<String, dynamic> decodedMap =
        json.decode(source) as Map<String, dynamic>;
    return TodoResponseDto.fromMap(decodedMap);
  }

  // 3. Serialization: Returns an explicitly typed Map object
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'ischecked': ischecked,
    };
  }

  // Serialization: To JSON String
  String toJson() => json.encode(toMap());

  // 4. == Operator
  @override
  bool operator ==(covariant TodoResponseDto other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.ischecked == ischecked;
  }

  // 5. hashCode Method
  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ ischecked.hashCode;

  // toString for cleaner debugging logs
  @override
  String toString() {
    return 'TodoResponseDto(id: $id, title: $title, ischecked: $ischecked)';
  }
}
