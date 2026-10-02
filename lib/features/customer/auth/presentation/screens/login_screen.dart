import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:sign_in_button/sign_in_button.dart';
import '../../../../../core/constants/strings/auth_strings.dart';
import '../../../../../core/theme/app_colors.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  bool _isSignIn = true;
  bool _obscurePassword = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              
              // App Logo placeholder (mimicking the top logo in the design)
              Image.asset(
                'assets/logo_veritical/logo_v.png',
                height: 150,
                fit: BoxFit.contain,
              ),
              // const SizedBox(height: 30),
              //
              // // Welcome Text
              // Text(
              //   AuthStrings.welcomeBackTitle,
              //   style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              //     fontWeight: FontWeight.w900,
              //     color: AppColors.textPrimary,
              //   ),
              // ),
              // const SizedBox(height: 8),
              // Text(
              //   AuthStrings.welcomeBackSubtitle,
              //   style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              //     color: AppColors.textMuted,
              //   ),
              //   textAlign: TextAlign.center,
              // ),
              const SizedBox(height: 32),

              // Tab Layout (Sign In / Signup)
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _isSignIn = true),
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: _isSignIn ? AppColors.primary : AppColors.borderLight,
                              width: _isSignIn ? 2 : 1,
                            ),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          AuthStrings.signIn,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: _isSignIn ? FontWeight.bold : FontWeight.w500,
                            color: _isSignIn ? AppColors.textPrimary : AppColors.textMuted,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _isSignIn = false),
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: !_isSignIn ? AppColors.primary : AppColors.borderLight,
                              width: !_isSignIn ? 2 : 1,
                            ),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          AuthStrings.signUp,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: !_isSignIn ? FontWeight.bold : FontWeight.w500,
                            color: !_isSignIn ? AppColors.textPrimary : AppColors.textMuted,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const SizedBox(height: 32),
              if (!_isSignIn) ...[
                _buildInputField(
                  label: AuthStrings.nameLabel,
                  icon: LucideIcons.user,
                  controller: _nameController,
                ),
                _buildInputField(
                  label: AuthStrings.phoneLabel,
                  icon: LucideIcons.phone,
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                ),
              ],

              _buildInputField(
                label: AuthStrings.emailLabel,
                icon: LucideIcons.mail,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              
              _buildInputField(
                label: AuthStrings.passwordLabel,
                icon: LucideIcons.lock,
                controller: _passwordController,
                isPassword: _obscurePassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? LucideIcons.eyeOff : LucideIcons.eye,
                    color: AppColors.textMuted,
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
              
              const SizedBox(height: 8),

              // Continue Button
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement Auth logic
                  context.go('/home'); // Mock routing to home for now
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  AuthStrings.continueBtn,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Or Continue With Divider
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      color: AppColors.borderLight,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      AuthStrings.orContinueWith,
                      style: TextStyle(
                        color: AppColors.textMuted,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: AppColors.borderLight,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Social Logins
              SizedBox(
                width: double.infinity,
                height: 56,
                child: SignInButton(
                  Buttons.google,
                  text: 'Continue with Google',
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required IconData icon,
    required TextEditingController controller,
    bool isPassword = false,
    TextInputType keyboardType = TextInputType.text,
    Widget? suffixIcon,
  }) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(icon, color: AppColors.textPrimary, size: 20),
          ),
          Container(
            width: 1,
            height: 24,
            color: AppColors.border,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: TextFormField(
              controller: controller,
              obscureText: isPassword,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                border: InputBorder.none,
                labelText: label,
                labelStyle: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textMuted,
                  fontWeight: FontWeight.normal,
                ),
              ),
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textPrimary,
                fontWeight: FontWeight.normal,
              ),
              keyboardType: keyboardType,
            ),
          ),
          if (suffixIcon != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: suffixIcon,
            ),
        ],
      ),
    );
  }
}
