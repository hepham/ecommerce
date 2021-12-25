import 'package:commerce/api/User_Service.dart';
import 'package:commerce/component/form_error.dart';
import 'package:commerce/helper/keyboard.dart';
import 'package:commerce/models/UserResponse.dart';

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
  String? name, address, age, description;
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
          buildAgeFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          SizedBox(height: getProportionateScreenHeight(30),),
          buildDescriptionFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(70)),
          SizedBox(
            width: double.infinity,
            height: getProportionateScreenHeight(56),
            child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    user.username = name.toString();
                    var ageInt = int.parse(age!);
                    assert(ageInt is int);
                    user.age = ageInt;
                    user.address = address.toString();
                    user.description=description.toString();

                    User_Service.UserUpdate(user);

                    KeyboardUtil.hideKeyboard(context);
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) => ProfileScreen(),
                      ),
                    );
                    setState(() {});
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
          ),
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
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNameNullError);
          return "";
        } else if (value.length < 3) {
          addError(error: kShortNameError);
          return "";
        } else {
          name = value;
        }
        return null;
      },
    );
  }

  TextFormField buildAgeFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: "Change your age",
        labelText: "User Age",
      ),
      onSaved: (newValue) => age = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAgeNullError);
        } else if (value.length < 3) {
          removeError(error: kValidAgeError);
        }
        age = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kAgeNullError);
          return "";
        } else if (value.length >= 3) {
          addError(error: kValidAgeError);
          return "";
        } else {
          age = value;
        }
        return null;
      },
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Change your address",
        labelText: "User Address",
      ),
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        } else if (value.length > 10) {
          removeError(error: kValidAddressError);
        }
        address = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        } else if (value.length <= 10) {
          addError(error: kValidAddressError);
          return "";
        } else {
          address = value;
        }
        return null;
      },
    );
  }

  TextFormField buildDescriptionFormField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Write Something about you",
        labelText: "Description",
      ),
      onSaved: (newValue) => description = newValue,
      onChanged: (value) {
        description = value;
      },
      validator: (value) {
        description = value;
        return null;
      },
    );
  }
}
