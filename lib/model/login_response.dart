class LoginResponse {
  int? kode;
  String? pesan;

  LoginResponse({
    this.kode,
    this.pesan,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      kode: json["kode"],
      pesan: json["pesan"],
    );
  }
}
