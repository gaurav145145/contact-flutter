import 'package:flutter/material.dart';
import './ContactData.dart';
class EditContact extends StatefulWidget{
   final ContactData  namelist;
   EditContact({Key key,@required this.namelist}): super(key: key);
  //final Function(ContactData) addNewContact;
  //Contact({Key key,@required this.addNewContact}): super(key: key);

  @override
  State<EditContact> createState() {
    return new _ContactFormState();
  }
}

class _ContactFormState extends State<EditContact>{

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  ContactData _data=new ContactData('','','','','','') ;

  void submit() {
    final form = _formKey.currentState;

    if (form.validate()) {
      form.save(); // Save our form now.

      //widget.addNewContact(_data);
      print('Email: ${_data.email}');
      print('Name: ${_data.name}');
      Navigator.of(context).pop();
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
                      initialValue: widget.namelist.name,
                      onSaved: (String value) {
                        this._data.name = value;
                      }
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.work),
                  title: new TextFormField(
                      initialValue: widget.namelist.designation,
                      onSaved: (String value) {
                        this._data.designation = value;
                      }

                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.apps),
                  title: new TextFormField(
                      initialValue: widget.namelist.company,
                      onSaved: (String value) {
                        this._data.company = value;
                      }
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.phone),
                  title: new TextFormField(
                      initialValue: widget.namelist.phone,
                      onSaved: (String value) {
                        this._data.phone = value;
                      }
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.email),
                  title: new TextFormField(
                      initialValue: widget.namelist.email,
                      onSaved: (String value) {
                        this._data.email = value;
                      }
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.place),
                  title: new TextFormField(
                      initialValue: widget.namelist.place,
                      onSaved: (String value) {
                        this._data.place = value;
                      }
                  ),
                ),
                new ListTile(
                  title: new RaisedButton(
                    onPressed:null ,
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