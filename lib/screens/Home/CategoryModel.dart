class CategoryPojo {
  int? success;
  int? code;
  String? message;
  List<Body>? body;

  CategoryPojo({this.success, this.code, this.message, this.body});

  CategoryPojo.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    if (json['body'] != null) {
      body = <Body>[];
      json['body'].forEach((v) {
        body!.add(new Body.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.body != null) {
      data['body'] = this.body!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Body {
  int? id;
  String? title;
  String? prompt;
  String? description;
  String? model;
  String? icon;
  int? status;
  String? createdAt;
  String? updatedAt;

  Body(
      {this.id,
        this.title,
        this.prompt,
        this.description,
        this.model,
        this.icon,
        this.status,
        this.createdAt,
        this.updatedAt});

  Body.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    prompt = json['prompt'];
    description = json['description'];
    model = json['model'];
    icon = json['icon'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['prompt'] = this.prompt;
    data['description'] = this.description;
    data['model'] = this.model;
    data['icon'] = this.icon;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}