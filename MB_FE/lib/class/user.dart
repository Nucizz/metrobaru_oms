class User {
  final int id;
  final int typeId; // 1 , 2
  final String typeName; // Customer, Admin
  final String username;
  final String emailAddress;
  final String phoneNumber;
  final String accountCreationDate;
  String? profilePicturePath;

  User(
      {required this.id,
      required this.typeId,
      required this.typeName,
      required this.username,
      required this.emailAddress,
      required this.phoneNumber,
      required this.accountCreationDate,
      this.profilePicturePath});
}
