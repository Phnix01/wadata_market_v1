import 'package:flutter/material.dart';
import 'package:smart_shop_v1/widgets/app_text_widget.dart';
import 'package:smart_shop_v1/widgets/subtitle_text.dart';
import 'package:smart_shop_v1/widgets/title_text_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const routeName = "/ForgotPasswordScreen";
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (mounted) {
      _emailController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: AppNameTextWidget(),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(30.0),
        children: [
          Image.asset(
            "assets/images/forgot_password.jpg",
            width: _size.width * 0.6,
            height: _size.height * 0.4,
          ),
          const SizedBox(
            height: 20,
          ),
          TitleTextWidget(label: "Reinitilieser le mot de passe"),
          const SizedBox(
            height: 10,
          ),
          SubtitleTextWidget(
            label:
                "Veuillez saisir l'adresse e-mail à laquelle vous souhaitez que vos informations de réinitialisation de mot de passe soient envoyées.",
          ),
          const SizedBox(
            height: 20,
          ),
          Form(
              child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                focusNode: _emailFocusNode,
                decoration: InputDecoration(
                  hintText: "tonadresse@mail.com",
                  prefixIcon: Icon(
                    Icons.mail_outline,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: EdgeInsets.all(30),
                ),
                onFieldSubmitted: (value) {
                  FocusScope.of(context).unfocus();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: _size.width * 0.6,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  label: Text("Demander Lien"),
                  icon: Icon(Icons.schedule_send_outlined),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[600],
                      foregroundColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
