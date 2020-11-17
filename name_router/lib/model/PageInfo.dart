class PageInfo {
  String id;
  String pageName;

  PageInfo.fromJsonMap(Map<String, dynamic> map)
      : id = map["id"],
        pageName = map["pageName"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['pageName'] = pageName;
    return data;
  }
}
