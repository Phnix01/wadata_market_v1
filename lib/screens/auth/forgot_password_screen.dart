import 'package:flutter/material.dart';
import 'package:smart_shop_v1/widgets/app_text_widget.dart';
import 'package:smart_shop_v1/widgets/subtitle_text.dart';
import 'package:smart_shop_v1/widgets/title_text_widget.dart';

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
              TextFormField(),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                onPressed: () {},
                label: Text("Demander Lien"),
                icon: Icon(Icons.schedule_send_outlined),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[600],
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              )
            ],
          ))
        ],
      ),
    );
  }
}
