class HelperModel<T> {
  T Function(Map<String, dynamic> map) fromMap;
  HelperModel(this.fromMap);

  List<T> fromMapArray(dynamic map) {
    List<T> list = [];
    map.forEach((e) {
      list.add(fromMap(e));
    });

    return list;
  }
}
