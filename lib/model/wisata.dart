class Wisata {
  String? id, nama, kategori, deskripsi, lokasi, hargaTiket;

  Wisata(
      {this.id,
      this.nama,
      this.kategori,
      this.deskripsi,
      this.lokasi,
      this.hargaTiket});

  factory Wisata.fromJson(Map<String, dynamic> object) {
    return Wisata(
        id: object['id'].toString(),
        nama: object['nama_wisata'],
        kategori: object['kategori'],
        deskripsi: object['deskripsi'],
        lokasi: object['lokasi'],
        hargaTiket: object['harga_tiket']);
  }
}
