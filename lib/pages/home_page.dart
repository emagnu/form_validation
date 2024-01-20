//  //
//  Import LIBRARIES
import 'package:flutter/material.dart';
import 'package:form_validation/utils/extensions.dart';
//  Import FILES
import '../widgets/custom_form_field.dart';
//  PARTS
//  PROVIDERS

//

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//  key for the form. This allows  to manage and persist the state of the form during the runtime of the application
  final _formKey = GlobalKey<FormState>();
  String? email, password, phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                CustomFormField(
                  hintText: "Email",
                  validator: (value) {
                    if (!value!.isValidEmail) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),
                CustomFormField(
                  hintText: "Phone",
                  validator: (value) {
                    if (!value!.isValidPhone) {
                      return 'Enter a valid phone number';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    setState(() {
                      phone = val;
                    });
                  },
                ),
                CustomFormField(
                  hintText: "Password",
                  obscureText: true,
                  validator: (value) {
                    if (!value!.isValidPassword) {
                      return 'Enter a valid password';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        debugPrint("Form Data Validated & Saved!");
                        debugPrint("$email, $password, $phone");
                      }
                    },
                    child: const Text('Register'))
              ],
            )),
      ),
    );
  }
}
