import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:smart_shop_v1/models/user_model.dart';
import 'package:smart_shop_v1/providers/user_provider.dart';
import 'package:smart_shop_v1/screens/auth/login_screen.dart';
import 'package:smart_shop_v1/screens/inner_screen.dart/orders/orders_screen.dart';
import 'package:smart_shop_v1/screens/inner_screen.dart/viewed_recently.dart';
import 'package:smart_shop_v1/screens/inner_screen.dart/wishlist.dart';
import 'package:smart_shop_v1/screens/loading_manager.dart';
import 'package:smart_shop_v1/services/assets_manager.dart';
import 'package:smart_shop_v1/services/my_app_functions.dart';
import 'package:smart_shop_v1/widgets/app_text_widget.dart';
import 'package:smart_shop_v1/widgets/subtitle_text.dart';
import 'package:smart_shop_v1/widgets/title_text_widget.dart';
import 'package:smart_shop_v1/providers/theme_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with AutomaticKeepAliveClientMixin {
  bool get wantKeepAlive => true;
  User? user = FirebaseAuth.instance.currentUser;
  UserModel? userModel;
  bool _isLoading = true;
  Future<void> fetchUserInfo() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      setState(() {
        _isLoading = true;
      });
      userModel = await userProvider.fetchUserInfo();
    } catch (error) {
      await MyAppFunctions.showErrorOrWarningDialog(
        context: context,
        subtitle: error.toString(),
        fct: () {},
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    fetchUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            AssetsManager.shoppingCart,
          ),
        ),
        title: const AppNameTextWidget(),
      ),
      body: LoadingManager(
        isLoading: _isLoading,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: user == null ? true : false,
                child: const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: TitleTextWidget(
                    label:
                        "Veuillez vous connecter pour avoir un accès illimité",
                  ),
                ),
              ),
              userModel == null
                  ? const SizedBox.shrink()
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).cardColor,
                              border: Border.all(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  width: 3),
                              image: DecorationImage(
                                image: NetworkImage(
                                  userModel!.userImage,
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitleTextWidget(label: userModel!.userName),
                              const SizedBox(
                                height: 6,
                              ),
                              SubtitleTextWidget(label: userModel!.userEmail)
                            ],
                          )
                        ],
                      ),
                    ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const TitleTextWidget(
                      label: "General",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Visibility(
                      visible: userModel == null ? false : true,
                      child: CustomListTile(
                        text: "Vos commandes",
                        imagePath: AssetsManager.orderSvg,
                        function: () {
                          Navigator.pushNamed(
                            context,
                            OrdersScreenFree.routeName,
                          );
                        },
                      ),
                    ),
                    Visibility(
                      visible: userModel == null ? false : true,
                      child: CustomListTile(
                        text: "Liste de souhaits",
                        imagePath: AssetsManager.wishlistSvg,
                        function: () {
                          Navigator.pushNamed(context, WishlistScreen.routName);
                        },
                      ),
                    ),
                    CustomListTile(
                      text: "Historique",
                      imagePath: AssetsManager.recent,
                      function: () {
                        Navigator.pushNamed(
                            context, ViewedRecentlyScreen.routName);
                      },
                    ),
                    CustomListTile(
                      text: "Adresse",
                      imagePath: AssetsManager.address,
                      function: () {},
                    ),
                    const SizedBox(height: 6),
                    const Divider(
                      thickness: 1,
                    ),
                    const SizedBox(height: 6),
                    const TitleTextWidget(
                      label: "Paramètre",
                    ),
                    const SizedBox(height: 10),
                    SwitchListTile(
                      secondary: Image.asset(
                        AssetsManager.theme,
                        height: 34,
                      ),
                      title: Text(themeProvider.getIsDarkTheme
                          ? "Mode Sombre"
                          : "Light Mode"),
                      value: themeProvider.getIsDarkTheme,
                      onChanged: (value) {
                        themeProvider.setDarkTheme(themeValue: value);
                      },
                    ),
                  ],
                ),
              ),
              Center(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        30.0,
                      ),
                    ),
                  ),
                  icon: Icon(
                    user == null ? Icons.login : Icons.logout,
                    color: Colors.white,
                  ),
                  label: Text(
                    user == null ? "Se Connececter" : "Se Déconnecter",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () async {
                    if (user == null) {
                      Navigator.pushNamed(context, LoginScreen.routeName);
                    } else {
                      await MyAppFunctions.showErrorOrWarningDialog(
                        context: context,
                        subtitle: "Êtes-vous sûr de vouloir vous déconnecter ?",
                        fct: () async {
                          await FirebaseAuth.instance.signOut();
                          if (!mounted) return;
                          Navigator.pushReplacementNamed(
                              context, LoginScreen.routeName);
                        },
                        isError: false,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
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
