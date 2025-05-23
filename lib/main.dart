import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smart_shop_v1/consts/styles.dart';
import 'package:smart_shop_v1/providers/cart_provider.dart';
import 'package:smart_shop_v1/providers/products_provider.dart';
import 'package:smart_shop_v1/providers/theme_provider.dart';
import 'package:smart_shop_v1/providers/user_provider.dart';
import 'package:smart_shop_v1/providers/viewed_recently_provider.dart';
import 'package:smart_shop_v1/providers/whishlist_provider.dart';
import 'package:smart_shop_v1/root_screen.dart';
import 'package:smart_shop_v1/screens/auth/login_screen.dart';
import 'package:smart_shop_v1/screens/inner_screen.dart/product_detail.dart';
import 'package:smart_shop_v1/screens/inner_screen.dart/wishlist.dart';
import 'package:smart_shop_v1/screens/search_screen.dart';

void main() {
  //Do this in main.dart
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                  child: SelectableText(snapshot.error.toString()),
                ),
              ),
            );
          }
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) {
                  return ThemeProvider();
                },
              ),
              ChangeNotifierProvider(
                create: (_) {
                  return ProductsProvider();
                },
              ),
              ChangeNotifierProvider(create: (_) {
                return CartProvider();
              }),
              ChangeNotifierProvider(create: (_) {
                return ViewedProdProvider();
              }),
              ChangeNotifierProvider(create: (_) {
                return UserProvider();
              }),
              ChangeNotifierProvider(create: (_) {
                return WishlistProvider();
              })
            ],
            child: Consumer<ThemeProvider>(
                builder: (context, themeProvider, child) {
              return MaterialApp(
                theme: Styles.themeData(
                    isDark: themeProvider.getIsDarkTheme,
                    BuildContext: context),
                home: RootScreen(),
                routes: {
                  ProductDetails.routName: (context) => ProductDetails(),
                  RootScreen.routeName: (context) => RootScreen(),
                  SearchScreen.routName: (context) => SearchScreen(),
                  WishlistScreen.routName: (context) => WishlistScreen(),
                  LoginScreen.routeName: (context) => LoginScreen()
                },
              );
            }),
          );
        });
  }
}
