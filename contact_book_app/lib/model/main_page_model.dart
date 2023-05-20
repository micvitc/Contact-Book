
class Contact {
  final String avatarUrl;
  final String name;
  final String mobileNumber;
  final String email;
  final String designation;
  final String cabin;

  Contact({
    required this.avatarUrl,
    required this.name,
    required this.mobileNumber,
    required this.email,
    required this.designation,
    required this.cabin,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      avatarUrl: json['avatar'],
      name: json['name'],
      mobileNumber: json['mobile_number'],
      email: json['email'],
      designation: json['designation'],
      cabin: json['cabin'],
    );
  }
}