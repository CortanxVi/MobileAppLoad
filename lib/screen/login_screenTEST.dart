// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mobilekakkak/theme/punk_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // เก็บและควบคุมข้อความที่ผู้ใช้ที่ป้อน
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Contract',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Time never waits. It delivers all equally to the same end.\nI hereby agree to the statement above,\nand I chooseth this fate of mine own free will.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
                // textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              _TextField(
                controller: _firstnameController,
                obscureText: false,
                labelText: 'First name',
                prefixIcon: const Icon(Icons.person),
              ),
              const SizedBox(height: 20),

              _TextField(
                controller: _lastnameController,
                obscureText: false,
                labelText: 'Last name',
                prefixIcon: const Icon(Icons.person),
              ),
              const SizedBox(height: 20),

              _TextField(
                controller: _usernameController,
                obscureText: false,
                labelText: 'Username',
                prefixIcon: const Icon(Icons.person),
              ),
              const SizedBox(height: 20),

              // เรียกใช้ custom widget ชื่อ _TextField สำหรับกรอก Email
              _TextField(
                controller: _emailController,
                obscureText: false, // ไม่ซ่อนข้อความ
                labelText: 'Email',
                prefixIcon: const Icon(Icons.email),
              ),
              const SizedBox(height: 20),

              _TextField(
                controller: _passwordController,
                obscureText: true,
                labelText: 'Password',
                prefixIcon: const Icon(Icons.lock),
              ),
              const SizedBox(height: 40),

              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 100,
                    vertical: 20,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton.icon(
                label: const Text('Login with Google'),
                onPressed: () {},
                icon: const Icon(Icons.login),
              ),

              TextFormField(
                decoration: const InputDecoration(labelText: 'Username'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Widget
// ประกาศ properties ที่ widget นี้จะรับค่าเข้ามา
class _TextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String labelText;
  final Icon prefixIcon;

  // Constructor ที่รับ parameters ทั้งหมดเป็น required
  // บังคับให้มี Constructor เพื่อกำกับว่าต้องมีการส่งค่าอินพุตเข้ามา
  // หากไม่มี เมื่อเรียกใช้ widget จะฟ้อง error เพราะงงว่าต้องส่งค่าของตัวแปรนี้ด้วยเหรอ
  // ค่าที่ส่งมาจะถูกกำหนดให้กับ properties ด้านบน โดยกำหนดที่บรรทัด widget build
  const _TextField({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.labelText,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),

      // สร้าง TextField โดยใช้ controller ที่ส่งมาเพื่อควบคุมข้อความ
      child: TextField(
        controller: controller, // กำหนดค่า controller ที่รับมาจาก constructor
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(),
          prefixIcon: prefixIcon,
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}
