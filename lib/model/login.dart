
class Contact {
   int id;
  String password;
  String userName;
  
  static List<Contact> contacts = [
    Contact(id:1,userName:'shn',password: "1"),
  ];

  Contact({this.id,this.userName,this.password});

    Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["userName"] = userName;
    map["password"] = password;
    return map;
  }

}