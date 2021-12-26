import 'package:commerce/api/Login_Service.dart';
import 'package:commerce/api/User_Service.dart';
import 'package:commerce/api/apiResponse.dart';
import 'package:commerce/component/custom_surfix_icon.dart';
import 'package:commerce/component/form_error.dart';
import 'package:commerce/helper/keyboard.dart';
import 'package:commerce/models/Login.dart';
import 'package:commerce/models/UserResponse.dart';
import 'package:commerce/screen/Home/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../config.dart';
import '../../../constants.dart';
import '../../forgot_password/forgotpassword.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  bool remember = false;
  TextEditingController phone = TextEditingController();
  TextEditingController pass = TextEditingController();
  late Box box1;

  late LoginRequest loginRequest;
  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    loginRequest = new LoginRequest();
    createBox();

  }

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


  void createBox()async{
    box1=await Hive.openBox("logindata");
    getData();
  }

  void getData()async{
    if(box1.get('phone')!=null){
      phone.text=box1.get('phone');
      remember = true;
      setState(() {

      });
    }
    if(box1.get('pass')!=null){
      pass.text=box1.get('pass');
      remember = true;
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildPhoneFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: Colors.redAccent,
                onChanged: (value) {
                  setState(() {
                    remember = value!;
                  });
                },
              ),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (ctx) => ForgotPassword(),
                    ),
                  );
                  setState(() {

                  });
                },
                child: Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          SizedBox(
            width: double.infinity,
            height: getProportionateScreenHeight(56),
            child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onPressed: () {
                  if(remember){
                    box1.put('phone', phone.text);
                    box1.put('pass', pass.text);
                  };

                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Login_Services loginService = new Login_Services();
                    loginService.login(loginRequest).then((value) async {
                      print(value.status);
                      if (value.status == 'success') {

                        final tempt=await User_Service.GetUserbyId(
                            int.parse(value.dataLogin.accessToken));
                        user=tempt;

                        print(user.phone);
                        user.password=loginRequest.password!;
                        print(user.password);
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (ctx) => homeScreen(),
                          ),
                        );
                        setState(() {

                        });
                      }
                    });

                    KeyboardUtil.hideKeyboard(context);
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

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => loginRequest.password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => loginRequest.phone = newValue!,
      onChanged: (value) {},
      validator: (value) {},
      decoration: InputDecoration(
        labelText: "Phone",
        hintText: "Enter your phone",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }
  // bool validateAndSave() {
  //   final form = _formkey.currentState;
  //   if (form!.validate()) {
  //     form.save();
  //     return true;
  //   }
  //   return false;
  // }
}
