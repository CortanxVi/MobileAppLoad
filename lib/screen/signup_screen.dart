// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  // รับ callback จาก parent เพื่อเปลี่ยนไปยัง LoginScreen โดยไม่ Navigator
  final VoidCallback onGoToLogin;

  const SignupScreen({super.key, required this.onGoToLogin});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.black, const Color(0xFF1a0000), Colors.black],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(height: 20),

                // Header
                Stack(
                  children: [
                    Transform.translate(
                      offset: const Offset(-2, -2),
                      child: Text(
                        'CONTRACT',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 3,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 2
                            ..color = Colors.red,
                        ),
                      ),
                    ),
                    const Text(
                      'CONTRACT',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: 3,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                Container(height: 2, width: 150, color: Colors.red),

                const SizedBox(height: 20),

                // Quote Text
                Text(
                  'Time never waits.\nIt delivers all equally to the same end.\nI hereby agree to the statement above,\nand I chooseth this fate of mine own free will.',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    color: Colors.white.withOpacity(0.8),
                    letterSpacing: 0.5,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 30),

                // Name Fields Row
                Row(
                  children: [
                    Expanded(
                      child: _PunkTextField(
                        controller: _firstnameController,
                        labelText: 'FIRST NAME',
                        prefixIcon: Icons.person_outline,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _PunkTextField(
                        controller: _lastnameController,
                        labelText: 'LAST NAME',
                        prefixIcon: Icons.person_outline,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                _PunkTextField(
                  controller: _emailController,
                  labelText: 'EMAIL',
                  prefixIcon: Icons.email_outlined,
                ),

                const SizedBox(height: 16),

                _PunkTextField(
                  controller: _phoneController,
                  labelText: 'PHONE',
                  prefixIcon: Icons.phone_outlined,
                ),

                const SizedBox(height: 16),

                _PunkTextField(
                  controller: _passwordController,
                  labelText: 'PASSWORD',
                  prefixIcon: Icons.lock_outline,
                  obscureText: true,
                ),

                const SizedBox(height: 30),

                // Sign Up Button
                _PunkButton(
                  onPressed: () {},
                  text: 'SIGN CONTRACT',
                  isPrimary: true,
                ),

                const SizedBox(height: 24),

                // Divider
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.red.withOpacity(0.5),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'OR CONNECT WITH',
                        style: TextStyle(
                          color: Colors.red.withOpacity(0.8),
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.red.withOpacity(0.5),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Social Login Icon Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _SocialIconButton(
                      onPressed: () {},
                      icon: Icons.g_mobiledata,
                      color: const Color(0xFF4285F4),
                      label: 'Google',
                    ),
                    _SocialIconButton(
                      onPressed: () {},
                      icon: Icons.facebook,
                      color: const Color(0xFF1877F2),
                      label: 'Facebook',
                    ),
                    _SocialIconButton(
                      onPressed: () {},
                      icon: Icons.apple,
                      color: Colors.white,
                      label: 'Apple',
                    ),
                    _SocialIconButton(
                      onPressed: () {},
                      icon: Icons.chat_bubble,
                      color: const Color(0xFF00B900),
                      label: 'LINE',
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // Already have account — เรียก callback แทน Navigator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ALREADY SIGNED?',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 12,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      // เรียก onGoToLogin จาก parent แทน Navigator.pop
                      onTap: widget.onGoToLogin,
                      child: const Text(
                        'LOGIN HERE',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Custom Punk TextField
class _PunkTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData prefixIcon;
  final bool obscureText;

  const _PunkTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.prefixIcon,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
        ),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.red.withOpacity(0.8),
            fontSize: 11,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
          filled: true,
          fillColor: Colors.black,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          prefixIcon: Icon(prefixIcon, color: Colors.red, size: 20),
          enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade700, width: 2),
          ),
        ),
        cursorColor: Colors.red,
      ),
    );
  }
}

// Primary Punk Button
class _PunkButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool isPrimary;

  const _PunkButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.isPrimary = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        border: Border.all(
          color: isPrimary ? Colors.red : Colors.white,
          width: 3,
        ),
        color: isPrimary ? Colors.red : Colors.transparent,
        boxShadow: isPrimary
            ? [
                BoxShadow(
                  color: Colors.red.withOpacity(0.5),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ]
            : [],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          splashColor: isPrimary
              ? Colors.white.withOpacity(0.2)
              : Colors.red.withOpacity(0.2),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: isPrimary ? Colors.black : Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w900,
                letterSpacing: 3,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Social Login Icon Button
class _SocialIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final Color color;
  final String label;

  const _SocialIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.color,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            border: Border.all(color: color, width: 2.5),
            color: Colors.black,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.4),
                blurRadius: 12,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            shape: const CircleBorder(),
            child: InkWell(
              onTap: onPressed,
              customBorder: const CircleBorder(),
              splashColor: color.withOpacity(0.3),
              child: Icon(icon, color: color, size: 32),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: color.withOpacity(0.9),
            fontSize: 10,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }
}
