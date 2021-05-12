import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prueba/pages/my_second_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String nameValue;
  String lastNameValue;

  TextEditingController nameController;
  TextEditingController lastNameController;

  final formKey = GlobalKey<FormState>();

  FocusNode nameFocus;
  FocusNode lastNameFocus;
  FocusNode telephoneFocus;
  FocusNode emailFocus;
  FocusNode ageFocus;
  FocusNode webSiteFocus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar desde MyHomePage"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: "Nombre"),
                  onSaved: (value) {
                    nameValue = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Llene este campo";
                    }
                  },
                  controller: nameController,
                  focusNode: nameFocus,
                  onEditingComplete: () => requestFocus(context, lastNameFocus),
                  textInputAction: TextInputAction.next,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Apellido"),
                  onSaved: (value) {
                    lastNameValue = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Llene este campo";
                    }
                  },
                  controller: lastNameController,
                  focusNode: lastNameFocus,
                  onEditingComplete: () =>
                      requestFocus(context, telephoneFocus),
                  textInputAction: TextInputAction.next,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Numero de telefono"),
                  keyboardType: TextInputType.number,
                  focusNode: telephoneFocus,
                  onEditingComplete: () => requestFocus(context, emailFocus),
                  textInputAction: TextInputAction.next,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Correo electronico"),
                  keyboardType: TextInputType.emailAddress,
                  focusNode: emailFocus,
                  onEditingComplete: () => requestFocus(context, ageFocus),
                  textInputAction: TextInputAction.next,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Edad"),
                  keyboardType: TextInputType.number,
                  focusNode: ageFocus,
                  onEditingComplete: () => requestFocus(context, webSiteFocus),
                  textInputAction: TextInputAction.next,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Sitio Web",
                  ),
                  keyboardType: TextInputType.url,
                  focusNode: webSiteFocus,
                ),
                ElevatedButton(
                  child: Text("Mostrar segunda pantalla"),
                  onPressed: () {
                    _showSecondPage(context);
                  },
                ),
              ],
            ),
          )),
    );
  }

  void requestFocus(BuildContext context, FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }

  void _showSecondPage(BuildContext context) {
    /* final route = MaterialPageRoute(builder: (BuildContext context) {
      return MySecondPage(name: "Marvin");
    });
    Navigator.of(context).push(route); */

    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      Navigator.of(context).pushNamed("/second",
          arguments: SecondPageArgument(
              name: this.nameValue, lastName: this.lastNameValue));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController(text: "Gianicola");
    lastNameController = TextEditingController(text: "Jara");

    nameFocus = FocusNode();
    lastNameFocus = FocusNode();
    telephoneFocus = FocusNode();
    emailFocus = FocusNode();
    ageFocus = FocusNode();
    webSiteFocus = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    lastNameController.dispose();
    nameFocus.dispose();
    lastNameFocus.dispose();
    telephoneFocus.dispose();
    emailFocus.dispose();
    ageFocus.dispose();
    webSiteFocus.dispose();
  }
}
