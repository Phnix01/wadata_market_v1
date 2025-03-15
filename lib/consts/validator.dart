class MyValidators {
  static String? displaynamevalidator(String? displayName) {
    if (displayName == null || displayName.isEmpty) {
      return " Le nom ne peut pas être vide";
    }
    if (displayName.length < 2 || displayName.length > 20) {
      return " le nom doit avoir plus 2 lettre";
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return "Veuillez entrer votre adresse email";
    }
    if (!RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
        .hasMatch(value)) {
      return " Veuillez entrer une adresse email valid";
    }
    return null;
  }
}
