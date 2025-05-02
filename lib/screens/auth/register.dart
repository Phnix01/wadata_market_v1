import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_shop_v1/consts/validator.dart';
import 'package:smart_shop_v1/root_screen.dart';
import 'package:smart_shop_v1/services/my_app_functions.dart';
import 'package:smart_shop_v1/widgets/app_text_widget.dart';
import 'package:smart_shop_v1/widgets/auth/image_picker_widget.dart';
import 'package:smart_shop_v1/widgets/subtitle_text.dart';
import 'package:smart_shop_v1/widgets/title_text_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isObscur = true;
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _repeatePasswordController;

  late final FocusNode _nameFocus;
  late final FocusNode _emailFocus;
  late final FocusNode _passwordFocusNode;
  late final FocusNode _repeatPasswordFocus;

  final _formKey = GlobalKey<FormState>();
  XFile? _pickedImage;
  bool _isLoading = false;
  final auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _repeatePasswordController = TextEditingController();
    _nameFocus = FocusNode();
    _emailFocus = FocusNode();
    _passwordFocusNode = FocusNode();
    _repeatPasswordFocus = FocusNode();
  }

  @override
  void dispose() {
    if (mounted) {
      _emailController.dispose();
      _passwordController.dispose();
      _emailFocus.dispose();
      _passwordFocusNode.dispose();
    }
    super.dispose();
  }

  Future<void> _registerFCT() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      try {
        setState(() {
          _isLoading = true;
        });
        await auth.createUserWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim());
        Fluttertoast.showToast(
            msg: "Un compte a été crée", textColor: Colors.white);
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, RootScreen.routeName);
      } on FirebaseException catch (error) {
        await MyAppFunctions.showErrorOrWarningDialog(
            context: context, subtitle: error.message.toString(), fct: () {});
      } catch (error) {
        await MyAppFunctions.showErrorOrWarningDialog(
            context: context, subtitle: error.toString(), fct: () {});
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> localImagePicker() async {
    final ImagePicker imagePicker = ImagePicker();
    await MyAppFunctions.imagePickerDialog(
        context: context,
        cameraFCT: () async {
          _pickedImage =
              await imagePicker.pickImage(source: ImageSource.camera);
          setState(() {});
        },
        galleryFCT: () async {
          _pickedImage =
              await imagePicker.pickImage(source: ImageSource.gallery);
          setState(() {});
        },
        removeFCT: () {
          setState(() {
            _pickedImage = null;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                child: Column(
                  children: [
                    TitleTextWidget(label: "Création d'un nouveau compte"),
                    SubtitleTextWidget(
                        label:
                            " La création d'un compte permettra d'acheter et bénéficier des promos")
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: size.width * 0.3,
                width: size.width * 0.3,
                child: ImagePickerWidget(
                  pickedImage: _pickedImage,
                  function: () async {
                    await localImagePicker();
                  },
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      focusNode: _nameFocus,
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
                        hintText: "Nom complet",
                      ),
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(_emailFocus);
                      },
                      validator: (value) {
                        return MyValidators.displaynamevalidator(value);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
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
                      validator: (value) {
                        return MyValidators.emailValidator(value);
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
                      onFieldSubmitted: (value) {
                        FocusScope.of(context)
                            .requestFocus(_repeatPasswordFocus);
                      },
                      validator: (value) {
                        return MyValidators.passwordValidator(value);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _repeatePasswordController,
                      focusNode: _repeatPasswordFocus,
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
                        hintText: "Écrire de nouveau le mot de passe",
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
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).unfocus();
                      },
                      validator: (value) {
                        return MyValidators.repeatPasswordValidator();
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          await _registerFCT();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.all(12),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0))),
                        label: Text("Créer le compte"),
                        icon: Icon(IconlyLight.addUser),
                      ),
                    ),
                    const SizedBox(height: 18),
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
