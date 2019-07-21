import 'package:flutter/material.dart';
import './ContactData.dart';
class Contact extends StatefulWidget{

  final List<ContactData>
  Contact(this._addNewContact);

  @override
  State<Contact> createState() {
    print(_addNewContact);
    return new _ContactFormState();
  }
}

class _ContactFormState extends State<Contact>{

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  ContactData _data;

  void submit() {
    // First validate form.
    print('Email:');
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save(); // Save our form now.

     widget._addNewContact(_data);

      print('Email: ${_data.email}');
      print('Name: ${_data.name}');
    }
  }


@override
  Widget build(BuildContext context){
    return new Scaffold(
      body:new SingleChildScrollView(
        child:new Form(key: this._formKey,
        child:new Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         children: <Widget>[
           new Image.asset('Assets/Add-Male-User.png'),
          new ListTile(
            leading: const Icon(Icons.person),
            title: new TextFormField(
              decoration: new InputDecoration(
                hintText: "Name",
              ),
                onSaved: (String value) {
                  this._data.name = value;
                   }
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.work),
            title: new TextFormField(
              decoration: new InputDecoration(
                hintText: "Designation",
              ),
                onSaved: (String value) {
                  this._data.designation = value;
                }

            ),
          ),
          new ListTile(
            leading: const Icon(Icons.apps),
            title: new TextFormField(
              decoration: new InputDecoration(
                hintText: "Company",
              ),
                onSaved: (String value) {
                  this._data.company = value;
                }
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.phone),
            title: new TextFormField(
              decoration: new InputDecoration(
                hintText: "Phone",
              ),
                onSaved: (String value) {
                  this._data.phone = value;
                }
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.email),
            title: new TextFormField(
              decoration: new InputDecoration(
                hintText: "Email",
              ),
                onSaved: (String value) {
                  this._data.email = value;
                }
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.place),
            title: new TextFormField(
              decoration: new InputDecoration(
                hintText: "Place",
              ),
                onSaved: (String value) {
                  this._data.place = value;
                }
            ),
          ),
           new ListTile(
             title: new RaisedButton(
               onPressed:()=> submit() ,
               child: new Text(
                   'Save',
                 style: new TextStyle(
                     color: Colors.white
                 ),),
               color:Colors.blue,

             ),
             ),

         ]


      ),


      ),
      ),
    );
  }

}