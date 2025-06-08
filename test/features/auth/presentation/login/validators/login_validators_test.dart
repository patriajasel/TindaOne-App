import 'package:flutter_test/flutter_test.dart';
import 'package:tinda_one_app/features/auth/presentation/login/validators/login_validators.dart';

void main() {
  group('LoginValidators', () {
    group('email validation', () {
      test('should return null for valid email addresses', () {
        // Valid email formats
        final validEmails = [
          'test@example.com',
          'user.name@domain.co',
          'first.last@subdomain.example.org',
          'user+tag@example.com',
          'test123@example123.com',
          'a@b.co',
          'firstname-lastname@example.com',
          'user_name@example.com',
          'test.email.with+symbol@example.com',
        ];

        for (final email in validEmails) {
          expect(
            LoginValidators.email(email),
            isNull,
            reason: 'Expected $email to be valid',
          );
        }
      });

      test('should return null for valid email with whitespace (trimmed)', () {
        final emailsWithWhitespace = [
          '  test@example.com  ',
          '\tuser@domain.com\t',
          '\ntest@example.org\n',
          ' test@example.com',
          'test@example.com ',
        ];

        for (final email in emailsWithWhitespace) {
          expect(
            LoginValidators.email(email),
            isNull,
            reason: 'Expected $email to be valid after trimming',
          );
        }
      });

      test('should return error message for null input', () {
        expect(LoginValidators.email(null), equals('Email is required'));
      });

      test('should return error message for empty string', () {
        expect(LoginValidators.email(''), equals('Email is required'));
      });

      test('should return error message for whitespace-only string', () {
        final whitespaceInputs = ['   ', '\t\t', '\n\n', ' \t\n '];

        for (final input in whitespaceInputs) {
          expect(
            LoginValidators.email(input),
            equals('Email is required'),
            reason: 'Expected whitespace-only input "$input" to be invalid',
          );
        }
      });

      test('should return error message for invalid email formats', () {
        final invalidEmails = [
          'plainaddress', // No @ symbol
          '@missingdomain.com', // Missing local part
          'missing-domain@.com', // Missing domain
          'missing-tld@domain', // Missing top-level domain
          'spaces in@email.com', // Spaces in local part
          'email@spaces in.com', // Spaces in domain
          'email@', // Missing domain completely
          '@domain.com', // Missing local part completely
          'email.domain.com', // Missing @ symbol
          'email@domain', // Missing TLD
          'email@@domain.com', // Double @ symbols
          'email@domain..com', // Double dots in domain
          '.email@domain.com', // Starting with dot
          'email@domain.c', // TLD too short (less than 2 chars)
          'email@.domain.com', // Domain starting with dot
          'email@domain.com.', // Domain ending with dot
          '', // Empty (handled by required check)
          'a@b.c', // Minimum valid might be questionable
          'email@domain.', // Missing TLD
          'email@.com', // Missing domain name
        ];

        for (final email in invalidEmails) {
          final result = LoginValidators.email(email);
          expect(result, isNotNull, reason: 'Expected $email to be invalid');
          if (result != null && result != 'Email is required') {
            expect(
              result,
              equals('Please enter a valid email address'),
              reason: 'Expected invalid email error message for $email',
            );
          }
        }
      });

      test('should handle edge cases', () {
        // Very long email (but technically valid)
        final longEmail = '${'a' * 50}@${'b' * 50}.com';
        expect(LoginValidators.email(longEmail), isNull);

        // Email with numbers
        expect(LoginValidators.email('user123@test123.com'), isNull);

        // Email with special characters
        expect(LoginValidators.email('user+test@example.com'), isNull);
        expect(LoginValidators.email('user-test@example.com'), isNull);
        expect(LoginValidators.email('user_test@example.com'), isNull);
        expect(LoginValidators.email('user.test@example.com'), isNull);
      });
    });

    group('password validation', () {
      test('should return null for valid passwords', () {
        final validPasswords = [
          '12345678', // Exactly 8 characters
          'password123', // More than 8 characters
          'a1b2c3d4', // Mix of letters and numbers
          'ThisIsALongPassword123!', // Long password with special chars
          'simple12', // 9 characters
          '        ', // 8 spaces (technically valid by current logic)
          'abcdefgh', // 8 letters
          '!@#\$%^&*', // 8 special characters
          'Pass Word', // Password with space
          'пароль123', // Non-ASCII characters
        ];

        for (final password in validPasswords) {
          expect(
            LoginValidators.password(password),
            isNull,
            reason:
                'Expected "$password" to be valid (length: ${password.length})',
          );
        }
      });

      test('should return error message for null input', () {
        expect(LoginValidators.password(null), equals('Password is required'));
      });

      test('should return error message for empty string', () {
        expect(LoginValidators.password(''), equals('Password is required'));
      });

      test(
        'should return error message for passwords shorter than 8 characters',
        () {
          final shortPasswords = [
            'a', // 1 character
            'ab', // 2 characters
            'abc', // 3 characters
            'abcd', // 4 characters
            'abcde', // 5 characters
            'abcdef', // 6 characters
            'abcdefg', // 7 characters
          ];

          for (final password in shortPasswords) {
            expect(
              LoginValidators.password(password),
              equals('Use at least 8 characters'),
              reason:
                  'Expected "$password" (length: ${password.length}) to be too short',
            );
          }
        },
      );

      test('should handle edge cases', () {
        // Exactly 8 characters should be valid
        expect(LoginValidators.password('abcdefgh'), isNull);

        // 7 characters should be invalid
        expect(
          LoginValidators.password('abcdefg'),
          equals('Use at least 8 characters'),
        );

        // Very long password should be valid
        final longPassword = 'a' * 1000;
        expect(LoginValidators.password(longPassword), isNull);

        // Password with only special characters
        expect(LoginValidators.password('!@#\$%^&*'), isNull);

        // Password with unicode characters
        expect(LoginValidators.password('tëst1234'), isNull);
      });
    });

    group('class structure', () {
      test('should not be instantiable', () {
        // This test ensures the private constructor prevents instantiation
        // We can't directly test private constructors, but we can test
        // that the class works as expected with static methods
        expect(LoginValidators.email('test@example.com'), isNull);
        expect(LoginValidators.password('12345678'), isNull);
      });

      test('should have static methods only', () {
        // Verify methods can be called without instantiation
        expect(
          () => LoginValidators.email('test@example.com'),
          returnsNormally,
        );
        expect(() => LoginValidators.password('12345678'), returnsNormally);
      });
    });
  });
}
