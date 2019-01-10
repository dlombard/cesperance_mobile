import 'package:flutter/material.dart';
import 'BaseContainer.dart';
import 'App_localizations.dart';

class ContactUs extends StatefulWidget {
  @override
  ContactUsState createState() => new ContactUsState();
}

class ContactUsState extends State<ContactUs> {
  String name;
  String email;
  String message;
  final _formKey = GlobalKey<FormState>();
  ContactUsState();


  @override
  Widget build(BuildContext context) {
    return BaseContainer(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text(AppLocalizations.of(context).contactUs),
              backgroundColor: Colors.transparent,
            ),
            body: Container(
              decoration: BoxDecoration(color: Colors.white),

    child: LayoutBuilder(builder: (BuildContext context, BoxConstraints viewportConstraints){
      return SingleChildScrollView(child: ConstrainedBox(constraints: BoxConstraints(minHeight: viewportConstraints.maxHeight,), child: Column(
        children: <Widget>[
          Padding( padding: EdgeInsets.fromLTRB(10, 10, 10, 0),child: TextFormField(validator: (value) {
            if (value.isEmpty) {
              return AppLocalizations.of(context).emailValidate;
            }
          },
              maxLines: 1,decoration: InputDecoration(hintText: AppLocalizations.of(context).email, border: OutlineInputBorder(borderRadius: BorderRadius.circular(2.0), borderSide: BorderSide(color: Colors.blue, width: 2.0))))),
          Padding( padding: EdgeInsets.fromLTRB(10, 10, 10, 0),child: TextFormField(validator: (value) {
            if (value.isEmpty) {
              return AppLocalizations.of(context).messageValidate;
            }
          },maxLines: null ,decoration: InputDecoration(hintText: AppLocalizations.of(context).message,  border: OutlineInputBorder(borderRadius: BorderRadius.circular(2.0), borderSide: BorderSide(color: Colors.blue, width: 2.0)), contentPadding: EdgeInsets.symmetric(vertical: 100.0)), maxLength: 500,)),
         RaisedButton(onPressed: (){}, child: Text(AppLocalizations.of(context).send, style: TextStyle(color: Colors.white),))
        ],
      )) );
    }))));
  }
}
