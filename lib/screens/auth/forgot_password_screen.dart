import 'package:flutter/material.dart';
import 'package:smart_shop_v1/widgets/app_text_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: AppNameTextWidget(),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          Image.asset(
            "assets/images/forgot_password.jpg",
            width: _size.width * 0.6,
            height: _size.height * 0.6,
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
