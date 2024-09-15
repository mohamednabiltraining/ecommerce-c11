/// statusMsg : "fail"
/// message : "Can't find this route: /api/v1/categorie"

class ErrorResponse {
  ErrorResponse({
      this.statusMsg, 
      this.message,});

  ErrorResponse.fromJson(dynamic json) {
    statusMsg = json['statusMsg'];
    message = json['message'];
  }
  String? statusMsg;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusMsg'] = statusMsg;
    map['message'] = message;
    return map;
  }

}