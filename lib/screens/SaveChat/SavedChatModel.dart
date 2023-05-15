class SavedChatModel {
  int? success;
  int? code;
  String? message;
  List<Body>? body;

  SavedChatModel({this.success, this.code, this.message, this.body});

  SavedChatModel.fromJson(Map<String, dynamic> json) {
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
  int? userId;
  String? title;
  List<JsonData>? jsonData;
  int? status;
  int? type;
  String? createdAt;
  String? updatedAt;

  Body(
      {this.id,
        this.userId,
        this.title,
        this.jsonData,
        this.status,
        this.type,
        this.createdAt,
        this.updatedAt});

  Body.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    if (json['json_data'] != null) {
      jsonData = <JsonData>[];
      json['json_data'].forEach((v) {
        jsonData!.add(new JsonData.fromJson(v));
      });
    }
    status = json['status'];
    type = json['type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['title'] = this.title;
    if (this.jsonData != null) {
      data['json_data'] = this.jsonData!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['type'] = this.type;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class JsonData {
  String? isFrom;
  String? humanMesasge;
  String? aiMessage;
  String? category;
  String? prompt;
  String? description;
  String? id;

  JsonData(
      {this.isFrom,
        this.humanMesasge,
        this.aiMessage,
        this.category,
        this.prompt,
        this.description,
        this.id});

  JsonData.fromJson(Map<String, dynamic> json) {
    isFrom = json['isFrom'];
    humanMesasge = json['humanMesasge'];
    aiMessage = json['aiMessage'];
    category = json['category'];
    prompt = json['prompt'];
    description = json['description'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isFrom'] = this.isFrom;
    data['humanMesasge'] = this.humanMesasge;
    data['aiMessage'] = this.aiMessage;
    data['category'] = this.category;
    data['prompt'] = this.prompt;
    data['description'] = this.description;
    data['id'] = this.id;
    return data;
  }
}