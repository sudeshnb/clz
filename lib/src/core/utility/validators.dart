class Validators {
  static String? email(String? value) {
    if (value == null || value.isEmpty) return 'validator.required.email';
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'validator.valid.email';
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) return 'validator.required.password';
    if (value.length < 8) return 'validator.valid.password';
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.isEmpty) return 'validator.required.phone';
    if (!RegExp(
      r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$',
    ).hasMatch(value)) {
      return 'validator.valid.phone';
    }
    return null;
  }

  static String? matchPassword(String? value, String? matchValue) {
    if (value != matchValue) return 'validator.match_password';
    return null;
  }

  static String? requiredField(String? value) {
    if (value == null || value.isEmpty) return 'validator.required.field';
    return null;
  }

  static String? creditCard(String? value) {
    if (value == null || value.isEmpty) return 'validator.required.credit_card';
    final cleaned = value.replaceAll(' ', '');
    if (cleaned.length != 16) return 'validator.length.credit_card';
    if (!RegExp(r'^[0-9]{16}$').hasMatch(cleaned)) {
      return 'validator.credit_card';
    }
    return null;
  }

  static String? expiryDate(String? value) {
    if (value == null || value.isEmpty) return 'validator.required.expiry_date';
    if (!RegExp(r'^(0[1-9]|1[0-2])\/?([0-9]{2})$').hasMatch(value)) {
      return 'validator.expiry_date';
    }
    return null;
  }

  static String? cvv(String? value) {
    if (value == null || value.isEmpty) return 'validator.required.cvv';
    if (!RegExp(r'^[0-9]{3,4}$').hasMatch(value)) return 'validator.cvv';
    return null;
  }

  // Address line validation (e.g., street address)
  static String? addressLine(String? value) {
    if (value == null || value.isEmpty) {
      return 'validator.required.address_line';
    }
    return null;
  }

  // Country validation
  static String? country(String? value) {
    if (value == null || value.isEmpty) {
      return 'validator.required.country';
    }
    return null;
  }

  // City validation
  static String? city(String? value) {
    if (value == null || value.isEmpty) return 'validator.required.city';
    return null;
  }

  // Postal code validation (adjust regex based on country rules if needed)
  static String? postalCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'validator.required.postal_code';
    }
    if (value.length < 3) return 'validator.length.postal_code';
    if (!RegExp(r'^[a-zA-Z0-9\s-]+$').hasMatch(value)) {
      return 'validator.postal_code';
    }
    return null;
  }
}
