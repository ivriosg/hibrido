class Pages {
  List<Page> items = [];

  Pages();

  Pages.fromJsonList(List<dynamic> jsonList) {
    // ignore: unnecessary_null_comparison
    if (jsonList == null) return;
    for (var item in jsonList) {
      final page = new Page.fromJsonMap(item);
      items.add(page);
    }
  }
}

class Page {
  String? title;
  String? content;

  Page({
    this.title,
    this.content,
  });

  Page.fromJsonMap(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content']['rendered'];
  }
}
