class Note {
  String title;
  String body;
  int id;
  int updatedDate;

  Note();
  Note.text(this.title, this.body);
  Note.data(this.title, this.body, this.updatedDate);
  Note.allData(this.id, this.title, this.body, this.updatedDate);

  String noteTitleForList() {
    String listTitle = this.title.replaceAll("\n", " ");
    if(listTitle.length >= 30){
      listTitle = listTitle.substring(0, 30)+" ...";
    }
    return listTitle;
  }

  String noteBodyForList() {
    String listBody = this.body.replaceAll("\n", " ");
    if(listBody.length >= 120){
      listBody = listBody.substring(0, 120)+" ...";
    }
    return listBody;
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['title'] = title;
    map['body'] = body;
    map['updatedDate'] = updatedDate;

    return map;
  }

  Note.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.title = map['title'];
    this.body = map['body'];
    this.updatedDate =  map['updatedDate'];
  }
}