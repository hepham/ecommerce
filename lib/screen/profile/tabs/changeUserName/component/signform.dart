
import 'package:commerce/component/form_error.dart';
import 'package:commerce/helper/keyboard.dart';
import 'package:commerce/screen/Home/homeScreen.dart';
import 'package:commerce/screen/profile/profile_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../config.dart';
import '../../../../../constants.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? name;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),

          SizedBox(height: getProportionateScreenHeight(30)),

          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                KeyboardUtil.hideKeyboard(context);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => ProfileScreen(),
                  ),
                );
                }
              },
              color: Colors.redAccent,
              child: Text(
                "Continue",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: getProportionateScreenWidth(18),
                ),
              )),
        ],
      ),
    );
  }



  TextFormField buildNameFormField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Change your name",
        labelText: "User Name",
      ),
      onSaved: (newValue) => name = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNameNullError);
        } else if (value.length > 3) {
          removeError(error: kShortNameError);
        }
        name = value;
        userName = name.toString();

      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNameNullError);
          return "";
        } else if (value.length < 3) {
          addError(error: kShortNameError);
          return "";
        }
        return null;
      },

    );
  }
}