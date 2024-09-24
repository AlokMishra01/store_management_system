class StoreFormState {
  final String name;
  final String phone;
  final String address;
  final String? description;
  final String? location;
  final String? storeCover;
  final bool isLoading;
  final bool isFormValid;

  StoreFormState({
    this.name = '',
    this.phone = '',
    this.address = '',
    this.description,
    this.location,
    this.storeCover,
    this.isLoading = false,
    this.isFormValid = false,
  });

  StoreFormState copyWith({
    String? name,
    String? phone,
    String? description,
    String? address,
    String? location,
    String? storeCover,
    bool? isLoading,
    bool? isFormValid,
  }) {
    return StoreFormState(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      description: description ?? this.description,
      address: address ?? this.address,
      location: location ?? this.location,
      storeCover: storeCover ?? this.storeCover,
      isLoading: isLoading ?? this.isLoading,
      isFormValid: isFormValid ?? this.isFormValid,
    );
  }
}
