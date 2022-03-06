class Messages {
  String? title;
  String? body;

  Messages(String title, String body) {
    this.title=title;
    this.body=body;
  }

  void setTitle(String title){
    this.title=title;
  }
  String? getTitle(){
    return title;
  }

  void setBody(String body){
    this.body=body;
  }

  String? getBody(){
    return body;
  }
}
