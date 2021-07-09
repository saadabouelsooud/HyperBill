class Ticket {
  Ticket({
    this.id,
    this.type,
    this.title,
    this.description,
    this.status,
    this.createdDate,
  });

  int id;
  String type;
  String title;
  String description;
  String status;
  DateTime createdDate;

  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
    id: json["id"],
    type: json["type"],
    title: json["title"],
    description: json["description"],
    status: json["status"],
    createdDate: DateTime.parse(json["createdDate"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "title": title,
    "description": description,
    "status": status,
    "createdDate": createdDate.toIso8601String(),
  };
}