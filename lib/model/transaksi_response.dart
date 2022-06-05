class TransaksiResponse {
  final int kode;
  final String pesan;

  TransaksiResponse({
    required this.kode,
    required this.pesan,
  });

  factory TransaksiResponse.fromJson(Map<String, dynamic> json) {
    return TransaksiResponse(
      kode: json["kode"],
      pesan: json["pesan"],
    );
  }
}
