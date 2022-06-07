class ResponseUpdateUser {
  int? kode;
  String? pesan;

  ResponseUpdateUser({
    this.kode,
    this.pesan,
  });

  factory ResponseUpdateUser.fromJson(Map<String, dynamic> json) {
    return ResponseUpdateUser(
      kode: json["kode"],
      pesan: json["pesan"],
    );
  }
}
