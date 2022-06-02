class LoginResponse {
  int? kode, id;
  String? pesan;

  LoginResponse({
    this.kode,
    this.pesan,
    this.id,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      kode: json["kode"],
      pesan: json["pesan"],
      id: json["id"],
    );
  }
}
