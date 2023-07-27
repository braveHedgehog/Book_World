class book {
  bool? success;
  List<Result>? result;

  book({this.success, this.result});

  book.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = success;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? url;
  String? indirim;
  String? fiyat;
  String? yayN;
  String? yazar;
  String? title;
  String? image;

  Result(
      {this.url,
        this.indirim,
        this.fiyat,
        this.yayN,
        this.yazar,
        this.title,
        this.image});

  Result.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    indirim = json['indirim'];
    fiyat = json['fiyat'];
    yayN = json['yayın'];
    yazar = json['yazar'];
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['url'] = url;
    data['indirim'] = indirim;
    data['fiyat'] = fiyat;
    data['yayın'] = yayN;
    data['yazar'] = yazar;
    data['title'] = title;
    data['image'] = image;
    return data;
  }
}