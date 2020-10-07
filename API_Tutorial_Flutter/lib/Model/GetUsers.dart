class GetUsers {
  int id;
  String name;
  String email;
  String phoneNumber;

  GetUsers({
    this.id,
    this.name,
    this.email,
    this.phoneNumber
  });

  factory GetUsers.fromJson(Map<String, dynamic> json) {
    return GetUsers(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phoneNumber: json['phone']
    );
  }
}