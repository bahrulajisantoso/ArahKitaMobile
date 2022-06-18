class LoginResponse {
  final int kode;
  final String pesan, id, nama;

  LoginResponse({
    required this.kode,
    required this.pesan,
    required this.id,
    required this.nama,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      kode: json["kode"],
      pesan: json["pesan"],
      id: json["id"].toString(),
      nama: json["nama"].toString(),
    );
  }
}
