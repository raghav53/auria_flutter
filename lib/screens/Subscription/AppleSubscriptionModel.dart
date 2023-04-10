class AppleSubscriptionModel {
  String? version;
  String? data;
  String? signature;
  Header? header;

  AppleSubscriptionModel(
      {this.version, this.data, this.signature, this.header});

  AppleSubscriptionModel.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    data = json['data'];
    signature = json['signature'];
    header =
    json['header'] != null ? new Header.fromJson(json['header']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['version'] = this.version;
    data['data'] = this.data;
    data['signature'] = this.signature;
    if (this.header != null) {
      data['header'] = this.header!.toJson();
    }
    return data;
  }
}

class Header {
  String? ephemeralPublicKey;
  String? publicKeyHash;
  String? transactionId;

  Header({this.ephemeralPublicKey, this.publicKeyHash, this.transactionId});

  Header.fromJson(Map<String, dynamic> json) {
    ephemeralPublicKey = json['ephemeralPublicKey'];
    publicKeyHash = json['publicKeyHash'];
    transactionId = json['transactionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ephemeralPublicKey'] = this.ephemeralPublicKey;
    data['publicKeyHash'] = this.publicKeyHash;
    data['transactionId'] = this.transactionId;
    return data;
  }
}

