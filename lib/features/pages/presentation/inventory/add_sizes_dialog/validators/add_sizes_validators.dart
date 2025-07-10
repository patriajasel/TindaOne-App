class AddSizesValidators {
  AddSizesValidators._();

  /// Validator for size
  static String? size(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Size is required';
    }

    if (value.contains(' ')) {
      return 'Size should not contain spaces';
    }

    if (RegExp(r'[^\w]').hasMatch(value) && !RegExp(r'^\d+$').hasMatch(value)) {
      return 'Size should not contain symbols';
    }

    return null;
  }

  /// Validator for amount
  static String? amount(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Amount is required';
    }

    if (value.contains(' ')) {
      return 'Amount should not contain spaces';
    }

    if (RegExp(r'[^\w]').hasMatch(value) && !RegExp(r'^\d+$').hasMatch(value)) {
      return 'Amount should not contain symbols';
    }

    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'Amount should contain numbers only';
    }

    return null;
  }

  /// Validator for supply
  static String? supply(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Supply is required';
    }

    if (value.contains(' ')) {
      return 'Supply should not contain spaces';
    }

    if (RegExp(r'[^\w]').hasMatch(value) && !RegExp(r'^\d+$').hasMatch(value)) {
      return 'Supply should not contain symbols';
    }

    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'Supply should contain numbers only';
    }

    return null;
  }
}
