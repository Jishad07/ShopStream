import 'package:flutter/material.dart';
import 'package:polosyssample/view/screens/home_page.dart';
import 'package:provider/provider.dart';

import '../../services/authentication_provider.dart';
import '../../widgets/apptext.dart';
import '../../widgets/costum_textformfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView( // Use SingleChildScrollView
          child: Column(
            children: [
              Container(
                height: screenHeight * 0.45,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 200,
                      width: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          "https://i.pinimg.com/564x/6a/f4/03/6af403cd3bcf5c7a578927305741768e.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: screenHeight * 0.15,
                      left: screenWidth * 0.1,
                      child: Container(
                      height: 200,
                      width: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          "https://i.pinimg.com/564x/e5/c8/72/e5c872f9aea081544fc8cdf4c482d38f.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    ),
                  ],
                ),
              ),
              AppText(
                title: "Login Now",
                textcolor: Colors.black,
                textsize: 25,
                textfw: FontWeight.bold,
              ),
              AppText(
                title: "Please enter the details below to continue",
                textcolor: Colors.black12,
                textsize: 12,
              ),
              SizedBox(height: screenHeight * 0.02),
              Column(
                children: [
                  CustomTextFormField(
                    hinttext: "Email",
                    controller: _emailController,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  CustomTextFormField(
                    hinttext: "Password",
                    controller: _passwordController,
                    suffixicon: const Icon(Icons.remove_red_eye_outlined),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: AppText(title: "Forgot password", textcolor: Colors.red),
              ),
              SizedBox(height: screenHeight * 0.09),
              GestureDetector(
                onTap: () async {
                  // if (formKey.currentState!.validate()) {
                    final success = await Provider.of<AuthProvider>(
                      context,
                      listen: false,
                    ).login(
                      _emailController.text,
                      _passwordController.text,
                    );

                    if (success) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) =>  ProductListPage()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: const Text('Login failed!')),
                      );
                    }
                  // }
                },
                child: Container(
                  height: 70,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: const Center(
                    child: Text("Login"),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(title: "Don't have an account?", textsize: 12),
                  AppText(title: " Register", textcolor: Colors.red, textsize: 12),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


