class LoginValidators {
  // Private constructor to prevent instantiation
  LoginValidators._();

  // Email validation regex
  static final RegExp _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9]+(?:\.[a-zA-Z0-9]+)*\.[a-zA-Z]{2,}$',
  );

  /// Validates email format for login
  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    final trimmedValue = value.trim();

    // Additional checks for edge cases
    if (trimmedValue.startsWith('.') || trimmedValue.endsWith('.')) {
      return 'Please enter a valid email address';
    }

    if (trimmedValue.contains('..')) {
      return 'Please enter a valid email address';
    }

    if (!_emailRegex.hasMatch(trimmedValue)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  /// Validates password for login
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Use at least 8 characters';
    }

    return null;
  }
}
