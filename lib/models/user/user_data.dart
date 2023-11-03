class UserData {
  final int id;
  final String userUid;
  final String emailId;
  final String employeeId;
  final String userName;
  final String role;
  final String sapId;
  final bool block;
  final bool delete;
  final String createdAt;
  final String updatedAt;

  UserData(
      {required this.id,
      required this.userUid,
      required this.emailId,
      required this.employeeId,
      required this.userName,
      required this.role,
      required this.sapId,
      required this.block,
      required this.delete,
      required this.createdAt,
      required this.updatedAt});

  UserData.fromJson(
    Map<String, dynamic> json,
  )   : id = json["id"] as int,
        userUid = json['user_uid'] as String,
        emailId = json['email_id'] as String,
        employeeId = json['employee_id'] as String,
        userName = json['user_name'] as String,
        role = json['role'] as String,
        sapId = json['sap_id'] as String,
        block = json['block'] as bool,
        delete = json['delete'] as bool,
        createdAt = json['created_at'] as String,
        updatedAt = json['updated_at'] as String;

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_uid": userUid,
        "email_id": emailId,
        "employee_id": employeeId,
        "user_name": userName,
        "role": role,
        "sap_id": sapId,
        "block": block,
        "delete": delete,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
