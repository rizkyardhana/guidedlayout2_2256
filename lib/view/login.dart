import 'package:flutter/material.dart';
import '../component/form_component.dart';
import '../view/home.dart';
import '../view/register.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();

  // Dummy data untuk validasi (bisa diganti shared_preferences nanti)
  static const Map<String, String> validUser = {'username': 'rizkiardhana', 'password': 'feriz2001@'};

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              inputForm(
                (value) {
                  if (value == null || value.isEmpty) {
                    return "Username tidak boleh kosong";
                  }
                  return null;
                },
                controller: _usernameController,
                hintText: "Username",
                helperText: "Inputkan User yang telah didaftarkan",
                iconData: Icons.person,
              ),
              inputForm(
                (value) {
                  if (value == null || value.isEmpty) {
                    return "Password tidak boleh kosong";
                  }
                  return null;
                },
                password: true,
                controller: _passwordController,
                hintText: "Password",
                helperText: "Inputkan Password",
                iconData: Icons.lock,
              ),
              inputForm(
                (value) {
                  if (value == null || value.isEmpty) {
                    return "Nomor telepon tidak boleh kosong";
                  }
                  return null;
                },
                controller: _phoneController,
                hintText: "Nomor Telepon",
                helperText: "081234567890",
                iconData: Icons.phone_android,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final inputUser = _usernameController.text.trim();
                        final inputPass = _passwordController.text.trim();
                        debugPrint('Login attempt: user="$inputUser" pass="$inputPass" expected="${validUser['username']}" / "${validUser['password']}"');
                        if (inputUser == validUser['username'] &&
                            inputPass == validUser['password']) {
                          if (mounted) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => const HomeView()),
                            );
                          }
                        } else {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: const Text("Login Gagal"),
                              content: Text("User: $inputUser | Pass: $inputPass\\nExpected: rizkiardhana / feriz2001@"),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("OK"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    pushRegister();
                                  },
                                  child: const Text("Daftar"),
                                ),
                              ],
                            ),
                          );
                        }
                      }
                    },
                    child: const Text("Login"),
                  ),
                  TextButton(
                    onPressed: pushRegister,
                    child: const Text("Belum punya akun? Daftar"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void pushRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const RegisterView()),
    );
  }
}
