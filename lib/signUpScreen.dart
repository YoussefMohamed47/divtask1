import 'package:divtask1/loginScreen.dart';
import 'package:flutter/material.dart';
import 'commonWidgets.dart';
import 'inpursettings.dart';
import 'main.dart';

class SignUp extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final RegExp regexpusername=RegExp(r'[Aa-zZ]');
final RegExp regexpPhone=RegExp(r'[0-9]');
final RegExp regexpCountry=RegExp(r'[Aa-zZ]');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: new BottomNavigationBar(items: [
        new BottomNavigationBarItem(icon: Icon(Icons.login),title: Text('LogIn'),),
        new BottomNavigationBarItem(icon: Icon(Icons.create_sharp),title: Text('Start Up'),),
      ],type: BottomNavigationBarType.fixed,onTap: (val){
        if(val==0)
        { Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
        }
        else{
          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
          //Navigator.pop(context);
        }
      },),
      body: SafeArea(
        child: SharedWidget(fullTextFieldWidget:fullTextFieldWidget(),imagename: 'images/witcher.jpg',
          buttonAction:buttonAction,frontText:'Welcome',buttonText: 'Sign Up',),
      ),
    );
  }
String?  validationUserName(String? val){
      if (val!.isEmpty ||
          !regexpusername
              .hasMatch(val)) {
        return 'Enter a valid User Name!';
      }
      return null;
  }
  String?  validationcountry(String? val){
    if (val!.isEmpty ||
        !regexpCountry
            .hasMatch(val)) {
      return 'Enter a valid Country Name!';
    }
    return null;
  }
  String?  validationphone(String? val){
    if (val!.isEmpty ||
        !regexpPhone
            .hasMatch(val)) {
      return 'Enter a valid Phone!';
    }
    return null;
  }
void buttonAction(){
  if(_formKey.currentState!.validate()) {
    _formKey.currentState!.save();
  }
}
  Widget fullTextFieldWidget(){
    return  Form(
      key: _formKey,
      child: Column(
        children: [
          InputWidgets(validation:(value)=>validationUserName(value),labelText: 'User Name',iconType: Icons.email_outlined,obsecuringText: false,
        regexptype: regexpusername,keyboadtype: TextInputType.text,) ,

      InputWidgets(validation:(value)=>validationcountry(value),labelText: 'Phone',iconType: Icons.phone,obsecuringText: false,
        regexptype: regexpPhone,keyboadtype: TextInputType.phone,) ,

          InputWidgets(validation:(value)=>validationphone(value),labelText: 'Country',iconType: Icons.add_location,obsecuringText: false,
            regexptype: regexpCountry,keyboadtype: TextInputType.text,) ,

        ],
      ),
    );
  }

}
