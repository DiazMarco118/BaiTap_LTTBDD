class Task {
  final String id;
  final String title;
  final String description;
  final String status;
  final String category;
  final String priority;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? dueDate;
  final List<Subtask>? subtasks;
  final List<Attachment>? attachments;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.category,
    required this.priority,
    required this.createdAt,
    this.updatedAt,
    this.dueDate,
    this.subtasks,
    this.attachments,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'].toString(),
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      status: json['status'] ?? 'Pending',
      category: json['category'] ?? '',
      priority: json['priority'] ?? 'Medium',
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
      dueDate: json['dueDate'] != null ? DateTime.parse(json['dueDate']) : null,
      subtasks: json['subtasks'] != null
          ? (json['subtasks'] as List)
                .map((item) => Subtask.fromJson(item))
                .toList()
          : null,
      attachments: json['attachments'] != null
          ? (json['attachments'] as List)
                .map((item) => Attachment.fromJson(item))
                .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'status': status,
      'category': category,
      'priority': priority,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'dueDate': dueDate?.toIso8601String(),
      'subtasks': subtasks?.map((s) => s.toJson()).toList(),
      'attachments': attachments?.map((a) => a.toJson()).toList(),
    };
  }

  // màu dựa trên các category
  String getColor() {
    switch (category.toLowerCase()) {
      case 'work':
        return 'pink';
      case 'fitness':
        return 'blue';
      case 'health':
        return 'green';
      default:
        return 'grey';
    }
  }
}

class Subtask {
  final String id;
  final String title;
  final bool isCompleted;

  Subtask({required this.id, required this.title, required this.isCompleted});

  factory Subtask.fromJson(Map<String, dynamic> json) {
    return Subtask(
      id: json['id'].toString(),
      title: json['title'] ?? '',
      isCompleted: json['isCompleted'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'isCompleted': isCompleted};
  }
}

class Attachment {
  final String id;
  final String fileName;
  final String fileUrl;

  Attachment({required this.id, required this.fileName, required this.fileUrl});

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      id: json['id'].toString(),
      fileName: json['fileName'] ?? '',
      fileUrl: json['fileUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'fileName': fileName, 'fileUrl': fileUrl};
  }
}
