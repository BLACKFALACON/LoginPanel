import 'package:flutter/material.dart';
import 'package:login_panel/database/db_helper.dart';
import 'package:login_panel/model/contact.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Contact> contacts;
  DbHelper _dbHelper;  

  @override
  void initState() {
    contacts = Contact.contacts;
    _dbHelper= DbHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Contact.contacts.sort( (Contact a, Contact b) => a.name[0].toLowerCase().compareTo(b.name[0].toLowerCase()),);

    return Scaffold(
      appBar: AppBar(
       title: Text("Kişilerim"), 
      ),

     body:FutureBuilder(
       future: _dbHelper.getContacts(),
       builder:( BuildContext context,AsyncSnapshot<List<Contact>> snapshot){
       if(!snapshot.hasData) return Padding(
          padding: const EdgeInsets.all(100),
          child: Center(child: CircularProgressIndicator()),
        );

       if(snapshot.data.isEmpty) return Padding(
          padding: const EdgeInsets.all(100),
          child: Center(child: Text("Kayıt bulunamadı")),
        ); 

        return ListView.builder(
         itemCount: snapshot.data.length,
         itemBuilder: (BuildContext context, int index)  {
           Contact contact = snapshot.data[index];
           ListTile( 
           leading: CircleAvatar( backgroundImage: AssetImage(contact.avatar.isEmpty ? "assets/img/person.jpg" : contact.avatar,),
           child: Text( contact.name[0].toUpperCase(),style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),),
           title: Text(contact.name),
           subtitle: Text(contact.phoneNumber),
           );
      
        });
      },),
    );
  }
} 