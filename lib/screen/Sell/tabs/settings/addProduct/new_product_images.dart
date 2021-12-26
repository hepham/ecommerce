import 'dart:convert';
import 'dart:io';
import 'dart:io' as Io;
import 'package:commerce/screen/Sell/tabs/settings/addProduct/new_product_info.dart';
import 'package:commerce/screen/Sell/tabs/MyShop/myshop.dart';
import 'package:flutter/material.dart';
import 'package:commerce/models/ProductResponse.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../config.dart';



class NewProductImage extends StatefulWidget {
  @override
  State<NewProductImage> createState() => _NewProductImagesState();
}

class _NewProductImagesState extends State<NewProductImage> {
  final ImagePicker _picker = ImagePicker();
  List<XFile> _imageList = [];
  List<File> _imageListFile = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Choose Product Preview",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => MyShop(),
              ),
            );
          },
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemCount: _imageList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.file(
                          File(_imageList[index].path),
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: -4,
                          right: -4,
                          child: Container(
                            color: Color.fromRGBO(255, 255, 244, 0.5),
                            child: IconButton(
                              onPressed: () {
                                _imageList.removeAt(index);
                                setState(() {});
                              },
                              icon: Icon(Icons.delete),
                              color: Colors.redAccent,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
          OutlinedButton(
              onPressed: () {
                selectImageCamera();
              },
              child: Text("Select image from Camera")),
          OutlinedButton(
              onPressed: () {
                selectImageGallery();
              },
              child: Text("Select image from Gallery")),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: getProportionateScreenWidth(200),
            height: getProportionateScreenHeight(56),
            child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (ctx) => NewProductInfo(),
                    ),
                  );
                  _imageListFile.forEach((index) {
                    final bytes =
                    Io.File(index.path.toString()).readAsBytesSync();
                    String img64 = base64Encode(bytes);
                    print(img64.substring(0, 100));
                    newProductInstance.images.add(img64);

                  });
                  setState(() {

                  });
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
          SizedBox(
            height: 100,
          ),
        ],
      )),
    );
  }

  void selectImageCamera() async {
    final XFile? selectedImage =
        await _picker.pickImage(source: ImageSource.camera);
    if (selectedImage!.path.isNotEmpty) {
      _imageList.add(selectedImage);
      _imageListFile.add(File(selectedImage.path));
    }

    setState(() {});
  }

  void selectImageGallery() async {
    final XFile? selectedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (selectedImage!.path.isNotEmpty) {
      _imageList.add(selectedImage);
      _imageListFile.add(File(selectedImage.path));
    }
    setState(() {});
  }
}
