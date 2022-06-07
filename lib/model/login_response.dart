class LoginResponse {
  final int kode;
  final String pesan, id;

  LoginResponse({
    required this.kode,
    required this.pesan,
    required this.id,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      kode: json["kode"],
      pesan: json["pesan"],
      id: json["id"].toString(),
    );
  }
}
