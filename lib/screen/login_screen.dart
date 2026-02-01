// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  // รับ callback จาก parent เพื่อเปลี่ยนไปยัง SignupScreen โดยไม่ Navigator
  final VoidCallback onGoToSignup;

  const LoginScreen({super.key, required this.onGoToSignup});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                const SizedBox(height: 60),

                // Logo
                Container(
                  child: Image.asset(
                    'assets/images/P5logo.png',
                    width: 120,
                    height: 120,
                  ),
                ),

                const SizedBox(height: 40),

                // Title with Glitch Effect
                Stack(
                  children: [
                    Transform.translate(
                      offset: const Offset(-2, -2),
                      child: Text(
                        'HAVE A SHORT REST',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 2
                            ..color = Colors.red,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Text(
                      'HAVE A SHORT REST',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: 2,
                        shadows: [
                          Shadow(
                            color: Colors.red,
                            offset: Offset(3, 3),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Container(height: 3, width: 150, color: Colors.red),

                const SizedBox(height: 50),

                // Email TextField
                _PunkTextField(
                  controller: _emailController,
                  labelText: 'EMAIL',
                  prefixIcon: Icons.email_outlined,
                ),

                const SizedBox(height: 20),

                // Password TextField
                _PunkTextField(
                  controller: _passwordController,
                  labelText: 'PASSWORD',
                  prefixIcon: Icons.lock_outline,
                  obscureText: true,
                ),

                const SizedBox(height: 16),

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      print('Navigate to Forgot Password');
                    },
                    child: Text(
                      'FORGOT PASSWORD?',
                      style: TextStyle(
                        color: Colors.red.withOpacity(0.8),
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // Login Button
                _PunkButton(
                  onPressed: () {
                    print('Login button pressed');
                    print('Email: ${_emailController.text}');
                    print('Password: ${_passwordController.text}');
                  },
                  text: 'ENTER',
                  isPrimary: true,
                ),

                const SizedBox(height: 30),

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

                const SizedBox(height: 30),

                // Social Login Icon Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _SocialIconButton(
                      onPressed: () {
                        print('Google login pressed');
                      },
                      icon: Icons.g_mobiledata,
                      color: const Color(0xFF4285F4),
                      label: 'Google',
                    ),
                    _SocialIconButton(
                      onPressed: () {
                        print('Facebook login pressed');
                      },
                      icon: Icons.facebook,
                      color: const Color(0xFF1877F2),
                      label: 'Facebook',
                    ),
                    _SocialIconButton(
                      onPressed: () {
                        print('Apple login pressed');
                      },
                      icon: Icons.apple,
                      color: Colors.white,
                      label: 'Apple',
                    ),
                    _SocialIconButton(
                      onPressed: () {
                        print('LINE login pressed');
                      },
                      icon: Icons.chat_bubble,
                      color: const Color(0xFF00B900),
                      label: 'LINE',
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // Sign Up Link — เรียก callback แทน Navigator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'NO CONTRACT YET?',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 12,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      // เรียก onGoToSignup จาก parent แทน Navigator.push
                      onTap: widget.onGoToSignup,
                      child: const Text(
                        'SIGN ONE',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.red,
                          decorationThickness: 2,
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
            color: Colors.red.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 1,
        ),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.red.withOpacity(0.8),
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
          filled: true,
          fillColor: Colors.black,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 18,
          ),
          prefixIcon: Icon(prefixIcon, color: Colors.red, size: 24),
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
      height: 60,
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
                fontSize: 16,
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
