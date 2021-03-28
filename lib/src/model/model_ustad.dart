class ModelUstad {
  int id;
  String nama;
  String desc;
  String image;

  ModelUstad({this.id, this.nama, this.desc, this.image});

  ModelUstad.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    desc = json['desc'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['desc'] = this.desc;
    data['image'] = this.image;
    return data;
  }
}
