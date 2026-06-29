class Todo {
  final int id;
  final String title;
  bool isChecked;

  Todo({
    required this.id,
    required this.title,
    required this.isChecked,
  });

  /// Creates a copy of the entity with updated fields
  Todo copyWith({
    String? title,
    bool? isChecked,
  }) {
    return Todo(
      id: id,
      title: title ?? this.title,
      isChecked: isChecked ?? this.isChecked,
    );
  }

  /// Overrides equality to compare field values
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Todo &&
        other.id == id &&
        other.title == title &&
        other.isChecked == isChecked;
  }

  /// Generates a hash code based on field values
  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ isChecked.hashCode;

  @override
  String toString() => 'TaskEntity(title: $title, isChecked: $isChecked)';
}
