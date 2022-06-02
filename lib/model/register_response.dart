class User {
  int? kode;
  String? pesan;

  User({
    this.kode,
    this.pesan,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      kode: json["kode"],
      pesan: json["pesan"],
    );
  }
}
