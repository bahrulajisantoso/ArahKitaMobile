class User {
  final String namaUser, username, jenisKelamin, tglLahir, noHp, email;

  User({
    required this.namaUser,
    required this.username,
    required this.jenisKelamin,
    required this.tglLahir,
    required this.noHp,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      namaUser: json["nama"],
      username: json["username"],
      jenisKelamin: json["jenis_kelamin"],
      tglLahir: json["tgl_lahir"],
      noHp: json["no_hp"],
      email: json["email"],
    );
  }
}
