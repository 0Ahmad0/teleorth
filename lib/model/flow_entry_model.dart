import 'dart:convert';

class FlowEntry {
  final int id;

  FlowEntry({
    required this.id,
  });

  FlowEntry copyWith({
    int? id,
  }) {
    return FlowEntry(
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }

  factory FlowEntry.fromMap(Map<String, dynamic> map) {
    return FlowEntry(
      id: map['id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory FlowEntry.fromJson(String source) => FlowEntry.fromMap(json.decode(source));

  @override
  String toString() => 'FlowEntry(id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FlowEntry && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
