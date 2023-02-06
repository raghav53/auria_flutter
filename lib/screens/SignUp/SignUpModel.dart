class SignUpModel {
  var success;
  var code;
  var message;
  Body? body;

  SignUpModel({this.success, this.code, this.message, this.body});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.body != null) {
      data['body'] = this.body!.toJson();
    }
    return data;
  }
}

class Body {
  var id;
  var firstName;
  var lastName;
  var email;
  var otp;
  var authorization;
  var socialId;
  var accountType;
  var socialType;
  var deviceType;
  var deviceToken;
  var todayWords;
  var todayChatCount;
  var subscription;
  var expireDate;
  var isVerified;
  var status;
  var createdAt;
  var updatedAt;
  var subscriptionType;
  AppVersion? appVersion;
  var appStoreUrl;
  var playStoreUrl;

  Body(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.otp,
        this.authorization,
        this.socialId,
        this.accountType,
        this.socialType,
        this.deviceType,
        this.deviceToken,
        this.todayWords,
        this.todayChatCount,
        this.subscription,
        this.expireDate,
        this.isVerified,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.subscriptionType,
        this.appVersion,
        this.appStoreUrl,
        this.playStoreUrl});

  Body.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    otp = json['otp'];
    authorization = json['authorization'];
    socialId = json['social_id'];
    accountType = json['account_type'];
    socialType = json['social_type'];
    deviceType = json['device_type'];
    deviceToken = json['device_token'];
    todayWords = json['today_words'];
    todayChatCount = json['today_chat_count'];
    subscription = json['subscription'];
    expireDate = json['expire_date'];
    isVerified = json['is_verified'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    subscriptionType = json['subscription_type'];
    appVersion = json['app_version'] != null
        ? new AppVersion.fromJson(json['app_version'])
        : null;
    appStoreUrl = json['appStoreUrl'];
    playStoreUrl = json['playStoreUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['otp'] = this.otp;
    data['authorization'] = this.authorization;
    data['social_id'] = this.socialId;
    data['account_type'] = this.accountType;
    data['social_type'] = this.socialType;
    data['device_type'] = this.deviceType;
    data['device_token'] = this.deviceToken;
    data['today_words'] = this.todayWords;
    data['today_chat_count'] = this.todayChatCount;
    data['subscription'] = this.subscription;
    data['expire_date'] = this.expireDate;
    data['is_verified'] = this.isVerified;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['subscription_type'] = this.subscriptionType;
    if (this.appVersion != null) {
      data['app_version'] = this.appVersion!.toJson();
    }
    data['appStoreUrl'] = this.appStoreUrl;
    data['playStoreUrl'] = this.playStoreUrl;
    return data;
  }
}

class AppVersion {
  var id;
  var android;
  var ios;
  var createdAt;
  var updatedAt;

  AppVersion({this.id, this.android, this.ios, this.createdAt, this.updatedAt});

  AppVersion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    android = json['android'];
    ios = json['ios'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['android'] = this.android;
    data['ios'] = this.ios;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}