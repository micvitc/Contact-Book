class Contact {
  final int id;
  final String name;
  final String mobileNumber;
  final String email;
  final String designation;
  final String description;
  final String school;
  final String cabin;

  Contact({
    required this.id,
    required this.name,
    required this.mobileNumber,
    required this.email,
    required this.designation,
    required this.description,
    required this.school,
    required this.cabin,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'],
      name: json['name'],
      mobileNumber: json['phone_num'],
      email: json['email'],
      designation: json['designation'],
      description: json['description'],
      school: json['school'],
      cabin: json['cabin_num'],
    );
  }
}
