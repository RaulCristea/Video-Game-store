class User {
  String? username;
  String? password;
  double? balance;
  bool? admin;

  User({this.username, this.password, this.balance, this.admin});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    balance = json['balance'];
    admin = json['admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['balance'] = this.balance;
    data['admin'] = this.admin;
    return data;
  }
}
