class EditUserDataParams {
  final String name;
  final String? image;
  final String phone;

  EditUserDataParams({
    required this.name,
    this.image,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'name': name,
      'phone': phone,
    };
    if (image != null) {
      data['image'] = image;
    }
    return data;
  }
}
