class TaskInfoModel {
  int? id;
  String? title;
  String? description;
  String? createdAt;
  String? status;

  TaskInfoModel({
    this.id,
    this.title,
    this.description,
    this.createdAt,
    this.status,
  });

  TaskInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    createdAt = json['created_at'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['status'] = this.status;
    return data;
  }
}
