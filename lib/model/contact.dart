class Contact {
  int id;
  String name;
  String phoneNumber;
  String note;
  String avatar;

  static List<Contact> contacts = [
    Contact(name: "Ali Kemal", phoneNumber: "0555 555 55 55",note:'d',avatar:''),
    Contact(name: "Dali", phoneNumber: "0555 555 55 55",note:'d',avatar:''),
    Contact(name: "Ergun", phoneNumber: "0555 555 55 55",note:'d',avatar:''),
    Contact(name: "Esra", phoneNumber: "0555 555 55 55",note:'d',avatar:''),
    Contact(name: "Fatih", phoneNumber: "0555 555 55 55",note:'d',avatar:''),
    Contact(name: "Kadir", phoneNumber: "0555 555 55 55",note:'d',avatar:''),
  ];

  Contact({this.name, this.phoneNumber,this.note,this.avatar});


  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["name"] = name;
    map["phone_number"] = phoneNumber;
    map["avatar"] = avatar;
    return map;
  }

  Contact.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    name = map["name"];
    phoneNumber = map["phone_number"];
    avatar = map["avatar"];
  }
}