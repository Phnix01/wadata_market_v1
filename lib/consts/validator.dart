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
}
