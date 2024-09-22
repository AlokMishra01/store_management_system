class StoreFormState {
  final String name;
  final String phone;
  final String address;
  final String? description;
  final String? location;
  final bool isLoading;
  final bool isFormValid;

  StoreFormState({
    this.name = '',
    this.phone = '',
    this.address = '',
    this.description,
    this.location,
    this.isLoading = false,
    this.isFormValid = false,
  });

  StoreFormState copyWith({
    String? name,
    String? phone,
    String? description,
    String? address,
    String? location,
    bool? isLoading,
    bool? isFormValid,
  }) {
    return StoreFormState(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      description: description ?? this.description,
      address: address ?? this.address,
      location: location ?? this.location,
      isLoading: isLoading ?? this.isLoading,
      isFormValid: isFormValid ?? this.isFormValid,
    );
  }
}
