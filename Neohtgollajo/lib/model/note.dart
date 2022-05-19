final String tableNotes = 'notes';
// 참고 및 도움
// https://velog.io/@lshjh4848/Flutter-PlatformWidget-SQLite-%EC%95%8C%EC%95%84%EB%B3%B4%EA%B8%B0feet.-%EA%B0%84%EB%8B%A8%ED%95%9C-%EB%8B%A4%EC%9D%B4%EC%96%B4%EB%A6%AC%EC%95%B13
// https://github.com/JohannesMilke/sqflite_database_example

class NoteFields {
  static final List<String> values = [
    /// Add all fields
    id, title, description, time
  ];

  static final String id = '_id';
  static final String title = 'title';
  static final String description = 'description';
  static final String time = 'time';
}

class Note {
  final int? id;
  final String title;
  final String description;
  final DateTime createdTime;

  const Note({
    this.id,
    required this.title,
    required this.description,
    required this.createdTime,
  });

  Note copy({
    int? id,
    String? title,
    String? description,
    DateTime? createdTime,
  }) =>
      Note(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
      );
// Map 구조에서 새로운 Note 클래스를 생성하기 위한 Note fromJson의 생성자
  static Note fromJson(Map<String, Object?> json) => Note(
    id: json[NoteFields.id] as int?,
    title: json[NoteFields.title] as String,
    description: json[NoteFields.description] as String,
    createdTime: DateTime.parse(json[NoteFields.time] as String),
  );
// Note 객체를 map 구조로 변환하기 위한 메서드이다.
  Map<String, Object?> toJson() => {
    NoteFields.id: id,
    NoteFields.title: title,
    NoteFields.description: description,
    NoteFields.time: createdTime.toIso8601String(),
  };
}
