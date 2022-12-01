class UsersModel {

  String id;
  String username;
  String name;
  String token;

  UsersModel({
    required this.id,
    required this.username,
    required this.name,
    required this.token
  });

  UsersModel.fromJson(Map<String, dynamic> json)
      : id = json['data']['id'].toString(),
        username = json['data']['username'],
        name = json['data']['name'],
        token = json['token'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'name': name,
        'token': token,
      };

  UsersModel.name(this.id, this.username, this.name, this.token);

  @override
  List<Object> get props => [];

}