import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:smart_shop_v1/services/assets_manager.dart';
import 'package:smart_shop_v1/widgets/app_text_widget.dart';
import 'package:smart_shop_v1/widgets/subtitle_text.dart';
import 'package:smart_shop_v1/widgets/title_text_widget.dart';
import 'package:smart_shop_v1/providers/theme_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            AssetsManager.shoppingCart,
          ),
        ),
        title: AppNameTextWidget(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: false,
            child: Padding(
              padding: EdgeInsets.all(18.0),
              child: SizedBox(
                width: double.infinity,
                child: TitleTextWidget(
                    label:
                        "Veuillez vous connecter pour avoir un access illimité !!"),
              ),
            ),
          ),
          Visibility(
            visible: true,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onBackground,
                        width: 3,
                      ),
                    ),
                    child: Icon(
                      Icons.account_circle,
                      size: 50,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      TitleTextWidget(label: "Omar Farouk"),
                      SizedBox(
                        height: 6,
                      ),
                      SubtitleTextWidget(
                        label: "fomar9235@gmail.com",
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  thickness: 1,
                ),
                const SizedBox(
                  height: 10,
                ),
                const TitleTextWidget(label: "General"),
                const SizedBox(
                  height: 10,
                ),
                CustomListTile(
                    imagePath: AssetsManager.orderSvg,
                    text: "vos commandes",
                    function: () {}),
                const SizedBox(height: 6),
                CustomListTile(
                    imagePath: AssetsManager.wishlistSvg,
                    text: "vos favoris",
                    function: () {}),
                const SizedBox(height: 6),
                CustomListTile(
                    imagePath: AssetsManager.recent,
                    text: "historique récent",
                    function: () {}),
                const SizedBox(height: 6),
                CustomListTile(
                  imagePath: AssetsManager.orderSvg,
                  text: "votre adresse",
                  function: () {},
                ),
                const SizedBox(height: 6),
                Divider(
                  thickness: 1,
                ),
                const SizedBox(height: 6),
                TitleTextWidget(label: "Paramètre"),
                const SizedBox(height: 10),
                SwitchListTile(
                    title: Text(themeProvider.getIsDarkTheme
                        ? "Mode Sombre"
                        : "Mode Light"),
                    value: themeProvider.getIsDarkTheme,
                    onChanged: (value) {
                      themeProvider.setDarkTheme(value);
                    }),
                const SizedBox(height: 6),
                Divider(
                  thickness: 1,
                ),
                const SizedBox(height: 6),
                Center(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white),
                    icon: Icon(Icons.login),
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          icon: Icon(
                            Icons.error_outline_outlined,
                            size: 69,
                            color: Colors.red,
                          ),
                          content: SizedBox(
                            height: 100,
                            child: Column(
                              children: [
                                TitleTextWidget(
                                  label: "Se Deconnecter",
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SubtitleTextWidget(
                                  label:
                                      "Voulez-vous vraiment vous déconnecter?",
                                )
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Annuler",
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text("Oui"),
                            )
                          ],
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                        ),
                      );
                    },
                    label: Text("Se Deconnecter"),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.imagePath,
    required this.text,
    required this.function,
  });
  final String imagePath, text;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        function();
      },
      title: SubtitleTextWidget(label: text),
      leading: Image.asset(
        imagePath,
        height: 34,
      ),
      trailing: const Icon(IconlyLight.arrowRight2),
    );
  }
}
