class Books {
  final int id;
  final String name;
  final String yazar;

  Books({required this.id, required this.name, required this.yazar});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'yazar': yazar
    };
  }


  @override
  String toString() {
    return 'User{id: $id, name: $name, yazar: $yazar}';
  }
}