class History {
  History(
      {required this.idHistory,
      required this.idUser,
      required this.type,
      required this.date,
      required this.total,
      required this.details,
      required this.createdAt,
      required this.updatedAt});

  String? idHistory;
  String? idUser;
  String? type;
  String? date;
  String? total;
  String? details;
  String? createdAt;
  String? updatedAt;

  factory History.fromJson(Map<String, dynamic> json) => History(
      idHistory: json['id_history'],
      idUser: json['id_user'],
      type: json['type'],
      date: json['date'],
      total: json['total'],
      details: json['details'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at']
      );
}
