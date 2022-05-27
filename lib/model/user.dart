class User {
  String? id, namaUser, username, jenisKelamin, tglLahir, noHp, email, password;

  User(
      {this.id,
      this.namaUser,
      this.username,
      this.jenisKelamin,
      this.tglLahir,
      this.noHp,
      this.email,
      this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'].toString(),
        namaUser: json['nama'],
        username: json['username'],
        jenisKelamin: json['jenis_kelamin'],
        tglLahir: json['tgl_lahir'],
        noHp: json['no_hp'],
        email: json['email'],
        password: json['password']);
  }
}
