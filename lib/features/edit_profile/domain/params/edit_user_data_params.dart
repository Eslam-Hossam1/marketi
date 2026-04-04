class EditUserDataParams {
  final String name;
  final String? image;
  final String address;
  final String phone;

  EditUserDataParams({
    required this.name,
    this.image,
    required this.address,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'name': name,
      'address': address,
      'phone': phone,
    };
    if (image != null) {
      data['image'] = image;
    }
    return data;
  }
}
