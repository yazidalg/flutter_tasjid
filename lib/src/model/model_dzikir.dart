class ModelDzikir {
  int id;
  String name;
  String read;
  String translate;

  ModelDzikir({this.id, this.name, this.read, this.translate});

  ModelDzikir.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    read = json['read'];
    translate = json['translate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['read'] = this.read;
    data['translate'] = this.translate;
    return data;
  }
}

class Increment {
  String title;
  int counter;
  Increment(this.title, this.counter);
}
