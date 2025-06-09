import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tinda_one_app/features/auth/presentation/login/validators/login_validators.dart';
import 'package:tinda_one_app/shared/themes/app_theme_config.dart';

class LoginPage extends HookWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: Theme.of(
            context,
          ).extension<GradientTheme>()!.primaryGradient,
        ),
        child: _buildMainContent(context),
      ),
    );
  }

  /// Main Content of this screen
  Widget _buildMainContent(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>(), []);

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    final isPasswordObscure = useState<bool>(true);

    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              _buildLogoContainer(),

              const SizedBox(height: 20),

              _buildAppTitle(context),

              const SizedBox(height: 50),

              _buildEmailTextField(context, controller: emailController),

              const SizedBox(height: 20),

              _buildPasswordTextField(
                context,
                controller: passwordController,
                isPasswordObscured: isPasswordObscure,
              ),

              _buildForgotPassword(context),

              const SizedBox(height: 10),

              _buildLoginButton(context, formKey: formKey),

              const SizedBox(height: 10),

              _buildSignUpHere(context),

              const SizedBox(height: 20),

              _buildOrDivider(context),

              const SizedBox(height: 20),

              _buildGoogleSignInButton(context),

              const SizedBox(height: 20),

              _buildOfflineModeButton(context),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the logo container for the app log
  Widget _buildLogoContainer() {
    return SizedBox(
      height: 250,
      width: 250,
      child: Image.asset('lib/shared/assets/app_logo.png'),
    );
  }

  /// Builds the title container for the app title
  Widget _buildAppTitle(BuildContext context) {
    return Text('TindaOne', style: context.titleLarge);
  }

  /// Builds the text field for email address
  Widget _buildEmailTextField(
    BuildContext context, {
    required TextEditingController controller,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text('Email Address'),
        prefixIcon: Icon(Icons.email),
      ),
      style: context.bodySmall,
      controller: controller,
      validator: LoginValidators.email,
    );
  }

  /// Builds the text field for password
  Widget _buildPasswordTextField(
    BuildContext context, {
    required TextEditingController controller,
    required ValueNotifier<bool> isPasswordObscured,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text('Password'),
        prefixIcon: Icon(Icons.lock),
        suffixIcon: IconButton(
          onPressed: () {
            isPasswordObscured.value = !isPasswordObscured.value;
          },
          icon: isPasswordObscured.value
              ? Icon(Icons.visibility)
              : Icon(Icons.visibility_off),
        ),
      ),
      obscureText: isPasswordObscured.value,
      style: context.bodySmall,
      controller: controller,
      validator: LoginValidators.password,
    );
  }

  /// Builds forgot password text button
  Widget _buildForgotPassword(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: Text(
          'Forgot Password?',
          style: context.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }

  /// Builds login button
  Widget _buildLoginButton(
    BuildContext context, {
    required GlobalKey<FormState> formKey,
  }) {
    return ElevatedButton.icon(
      onPressed: () {
        if (formKey.currentState?.validate() ?? false) {}
      },
      icon: Icon(Icons.login),
      label: Text('Login'),
    );
  }

  /// Build already have an account
  Widget _buildSignUpHere(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: context.bodySmall?.copyWith(fontSize: 10),
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            'Sign up here',
            style: context.bodySmall?.copyWith(
              fontSize: 10,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ],
    );
  }

  /// Build Or divider
  Widget _buildOrDivider(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(color: Theme.of(context).dividerColor, thickness: 1),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text('OR', style: context.bodySmall),
        ),
        Expanded(
          child: Divider(color: Theme.of(context).dividerColor, thickness: 1),
        ),
      ],
    );
  }

  /// Builds login button
  Widget _buildGoogleSignInButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(FontAwesomeIcons.google),
      label: Text('Login via Google'),
    );
  }

  /// Build offline mode button
  Widget _buildOfflineModeButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        context.push('/cashier-page');
      },
      icon: Icon(Icons.smartphone),
      label: Text('Use Offline Mode'),
    );
  }
}
