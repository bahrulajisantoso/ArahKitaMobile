class Wisata {
  String? id, nama, kategori, deskripsi, lokasi, hargaTiket;

  Wisata(
      {this.id,
      this.nama,
      this.kategori,
      this.deskripsi,
      this.lokasi,
      this.hargaTiket});

  factory Wisata.fromJson(Map<String, dynamic> json) {
    return Wisata(
        id: json['id'].toString(),
        nama: json['nama_wisata'],
        kategori: json['kategori'],
        deskripsi: json['deskripsi'],
        lokasi: json['lokasi'],
        hargaTiket: json['harga_tiket']);
  }
}
