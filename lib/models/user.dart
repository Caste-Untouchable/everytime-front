class User {
  User(
      {this.userID,
      this.name,
      this.nickname,
      this.email,
      this.schoolName,
      this.registeredYear,
      this.verified,
      this.point,
      this.status,
      this.pwd});

  User.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    name = json['name'];
    nickname = json['nickname'];
    email = json['email'];
    schoolName = json['schoolName'];
    registeredYear = json['registeredYear'];
    verified = json['verified'];
    point = json['point'];
    status = json['status'];
    pwd = json['pwd'];
  }

  String? email;
  String? name;
  String? nickname;
  int? point;
  String? pwd;
  int? registeredYear;
  String? schoolName;
  String? status;
  String? userID;
  bool? verified;

  @override
  String toString() {
    return 'User(userID: $userID, name: $name, nickname: $nickname, email: $email, schoolName: $schoolName, registeredYear: $registeredYear, verified: $verified, point: $point, status: $status, pwd: $pwd)';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userID'] = userID;
    data['name'] = name;
    data['nickname'] = nickname;
    data['email'] = email;
    data['schoolName'] = schoolName;
    data['registeredYear'] = registeredYear;
    data['verified'] = verified;
    data['point'] = point;
    data['status'] = status;
    data['pwd'] = pwd;
    return data;
  }
}
