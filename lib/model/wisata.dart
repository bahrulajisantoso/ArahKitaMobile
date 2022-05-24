class Wisata {
  String? id, namaWisata, kategori, deskripsi, lokasi, hargaTiket;

  Wisata(
      {this.id,
      this.namaWisata,
      this.kategori,
      this.deskripsi,
      this.lokasi,
      this.hargaTiket});

  factory Wisata.fromJson(Map<String, dynamic> json) {
    return Wisata(
        id: json['id'].toString(),
        namaWisata: json['nama_wisata'],
        kategori: json['kategori'],
        deskripsi: json['deskripsi'],
        lokasi: json['lokasi'],
        hargaTiket: json['harga_tiket']);
  }
}
