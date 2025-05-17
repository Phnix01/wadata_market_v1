class UserModel {
  final String userId;
  final String userName;
  final String userImage;
  final String userEmail;
  final List userCart, UserWish;
  const UserModel(
      {required this.userId,
      required this.userName,
      required this.userImage,
      required this.userEmail,
      required this.userCart,
      required this.UserWish});
}
