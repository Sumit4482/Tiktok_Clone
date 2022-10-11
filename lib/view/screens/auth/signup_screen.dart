import 'package:flutter/material.dart';
import 'package:tiktok_clone/controller/auth_controller.dart';
import 'package:tiktok_clone/view/widgets/text_input.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _setpasswordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    const Text(
                      "Welcome to Tiktok",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    InkWell(
                      onTap: () {
                        AuthController.instance.pickImage();
                      },
                      child: Stack(
                        children: [
                          const CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://st4.depositphotos.com/29453910/37778/v/600/depositphotos_377785390-stock-illustration-hand-drawn-modern-man-avatar.jpg"),
                            radius: 50,
                          ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white,
                                ),
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.blue,
                                  size: 25,
                                ),
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextInputField(
                        controller: _emailController,
                        myIcon: Icons.email,
                        myLabelText: "Email",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextInputField(
                        controller: _setpasswordController,
                        myIcon: Icons.lock,
                        myLabelText: "Set Password",
                        toHide: true,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextInputField(
                        controller: _confirmpasswordController,
                        myIcon: Icons.lock,
                        myLabelText: "Confirm Password",
                        toHide: true,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextInputField(
                        controller: _usernameController,
                        myIcon: Icons.person,
                        myLabelText: "Username",
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          AuthController.instance.signUp(
                              _usernameController.text,
                              _setpasswordController.text,
                              _emailController.text,
                              AuthController.instance.proimg);
                        },
                        child: const Center(
                          child: Text("Signup"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
