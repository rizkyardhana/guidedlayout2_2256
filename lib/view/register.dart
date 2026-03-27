import 'package:flutter/material.dart';
import '../component/form_component.dart';
import '../view/login.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController notelpController;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    notelpController = TextEditingController();
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    notelpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const Icon(Icons.person_add, size: 80, color: Colors.deepPurple),
                const SizedBox(height: 30),
                inputForm(
                  (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return "Username tidak boleh kosong";
                    }
                    if (p0.toLowerCase() == 'anjing') {
                      return "Tidak boleh Menggunakan kata kasar";
                    }
                    return null;
                  },
                  controller: usernameController,
                  hintText: "Username",
                  helperText: "Contoh: testuser",
                  iconData: Icons.person,
                ),
                const SizedBox(height: 16),
                inputForm(
                  (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return "Email tidak boleh kosong";
                    }
                    if (!p0.contains('@')) {
                      return "Email harus menggunakan @";
                    }
                    return null;
                  },
                  controller: emailController,
                  hintText: "Email",
                  helperText: "test@test.com",
                  iconData: Icons.email,
                ),
                const SizedBox(height: 16),
                inputForm(
                  (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return "Password tidak boleh kosong";
                    }
                    if (p0.length < 5) {
                      return "Password minimal 5 karakter";
                    }
                    return null;
                  },
                  controller: passwordController,
                  hintText: "Password",
                  helperText: "Min 5 karakter",
                  iconData: Icons.lock,
                  password: true,
                ),
                const SizedBox(height: 16),
                inputForm(
                  (p0) => p0 == null || p0.isEmpty ? "Nomor telepon tidak boleh kosong" : null,
                  controller: notelpController,
                  hintText: "Nomor Telepon",
                  helperText: "08123456789",
                  iconData: Icons.phone_android,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Simpan data form (bisa ke shared prefs nanti)
                        debugPrint('Register: ${usernameController.text} / ${passwordController.text}');
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const LoginView(),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 12)),
                    child: const Text("Daftar", style: TextStyle(fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
