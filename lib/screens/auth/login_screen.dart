import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:smart_shop_v1/widgets/app_text_widget.dart';
import 'package:smart_shop_v1/widgets/title_text_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscur = true;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  late final FocusNode _emailFocus;
  late final FocusNode _passwordFocusNode;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailFocus = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(30.0),
          child: SingleChildScrollView(
              child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              const AppNameTextWidget(),
              const SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: TitleTextWidget(label: "Bon retour !! 😊"),
              ),
              const SizedBox(
                height: 16,
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      focusNode: _emailFocus,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                width: 29, color: Colors.transparent)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(width: 0, color: Colors.orange)),
                        filled: true,
                        fillColor: Colors.black.withOpacity(0.1),
                        contentPadding: EdgeInsets.symmetric(vertical: 30),
                        prefixIcon: Icon(IconlyLight.message),
                        hintText: "Votre addresse mail",
                      ),
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(_passwordFocusNode);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      focusNode: _passwordFocusNode,
                      textInputAction: TextInputAction.done,
                      obscureText: _isObscur ? true : false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                width: 29, color: Colors.transparent)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(width: 0, color: Colors.orange)),
                        filled: true,
                        fillColor: Colors.black.withOpacity(0.1),
                        contentPadding: EdgeInsets.symmetric(vertical: 30),
                        hintText: "Mot de Passe",
                        prefixIcon: Icon(IconlyLight.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isObscur = !_isObscur;
                            });
                          },
                          icon: _isObscur
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "mot de passe oublié".toUpperCase(),
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          )),
                    )
                  ],
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
