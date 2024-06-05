class User {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String phone;
  final String image;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['user']['id'],
      email: json['user']['email'],
      firstName: json['user_additional_data']['first_name'],
      lastName: json['user_additional_data']['last_name'],
      phone: json['user_additional_data']['phone'],
      image: json['user_image']['image'],
    );
  }
}
