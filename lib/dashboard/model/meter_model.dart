

class MeterModel {
  MeterModel({
    this.type,
    this.title,
    this.status,
    this.detail,
    this.path,
    this.message,
  });

  String type;
  String title;
  int status;
  String detail;
  String path;
  String message;

  factory MeterModel.fromJson(Map<String, dynamic> json) => MeterModel(
    type: json["type"],
    title: json["title"],
    status: json["status"],
    detail: json["detail"],
    path: json["path"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "title": title,
    "status": status,
    "detail": detail,
    "path": path,
    "message": message,
  };
}
