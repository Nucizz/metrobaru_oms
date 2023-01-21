class User {
  final int id;
  final String username;
  final String emailAddress;
  final int typeId;
  final String typeName;
  final String phoneNumber;
  String? profilePicturePath;

  final String accountCreationDate;

  User(
      {required this.id,
      required this.username,
      required this.emailAddress,
      required this.typeId,
      required this.typeName,
      required this.phoneNumber,
      required this.accountCreationDate,
      this.profilePicturePath});
}
