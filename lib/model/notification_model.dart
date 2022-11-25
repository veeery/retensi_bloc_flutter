class NotificationModel {
  String? title;
  String? body;

  NotificationModel({this.title, this.body});

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      title: json["title"],
      body: json["body"],
    );
  }

  NotificationModel.name(this.title, this.body);

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "body": body,
    };
  }

  @override
  List<Object> get props => [title!, body!];
}
