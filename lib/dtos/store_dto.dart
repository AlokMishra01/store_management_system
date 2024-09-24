class StoreDto {
  final String name;
  final String address;
  final String phone;
  final String? description;
  final String? location;
  final String? storeCover;

  StoreDto({
    required this.name,
    required this.phone,
    required this.address,
    this.description,
    this.location,
    this.storeCover,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': name,
      'address': address,
      'description': description,
      'location': location,
      'store_cover': storeCover,
    };
  }
}
