import 'package:flutter/material.dart';

import './Contact.dart';
import './EditContact.dart';
import './ContactData.dart';
main()=>runApp(new MaterialApp(
  home: new AppHome(),
));

class AppHome extends StatefulWidget{
  @override
  State<AppHome> createState() {
    return new AppState();
  }
}

class AppState extends State<AppHome>{
  List<ContactData>  names = new List<ContactData>();

  @override
  void initState()
  {
    names.add(new ContactData("Abhishek","Boss","VelaAcademy","8989899854","abhi@gmail.com","Delhi"));
    names.add(new ContactData("Anki","Boss","BoringAcademy","8989893854","anki@gmail.com","Delhi"));
    super.initState();
  }

  void addNewContact(ContactData _data)
  {
    print("gau");
    setState((){
      names.add(new ContactData('${_data.name}','${_data.designation}','${_data.company}','${_data.phone}','${_data.email}','${_data.place}') );
    });
  }

  void editContact(ContactData _data)
  {
    final tile = names.firstWhere((item) => item.name == _data.name);
    setState(() {tile.designation = _data.designation;
                 tile.company=_data.company;
                  tile.phone=_data.phone;
                   tile.email=_data.email;
                    tile.place=_data.place;});
  }

  void _pushAddScreen() {
    // Push this page onto the stack
    Navigator.of(context).push(
      // MaterialPageRoute will automatically animate the screen entry, as well
      // as adding a back button to close it
        new MaterialPageRoute(
            builder: (context) {
              return new Scaffold(
                  appBar: new AppBar(
                      title: new Text('Add a new Contact')
                  ),
                  body: Contact(addNewContact:addNewContact),
              );
            }
        )
    );
  }
  @override
  Widget build(BuildContext context) {


    return new Scaffold(
      appBar: AppBar(
        title: new Text("Contacts"),
      ),
      body: new Container(
          child:ListView.builder(
          reverse: false,
          itemBuilder: (_,int index)=>EachList(this.names[index],this.editContact),
          itemCount: this.names.length,
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _pushAddScreen ,
        tooltip: 'New Contact',
        child: new Icon(Icons.add),
      ),
    );
  }
}
class EachList extends StatelessWidget{
  final ContactData list;
  final Function(ContactData) editContact;
  EachList(this.list,this.editContact);
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new Scaffold(
                appBar: new AppBar(
                    title: new Text('Add a new Contact')
                ),
                body:EditContact(namelist: list,editContact: editContact,),
              );
            },
          ),
        );
      },
        child:new Card(
          child: new Container(
            padding: EdgeInsets.all(8.0),
            child: new Row(

               children: <Widget>[
                 new CircleAvatar(child: new Text(list.name[0]),),
                 new Padding(padding: EdgeInsets.only(right: 10.0)),
                 new Text(list.name,style: TextStyle(fontSize: 20.0),)
          ],
        ),
        ),
        ),
    );
  }

}