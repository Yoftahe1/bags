import 'package:bagstore/models/product.dart';
import 'package:bagstore/provider/products_provider.dart';
import 'package:bagstore/widgets/add_display.dart';
import 'package:bagstore/widgets/add_elevated_button.dart';
import 'package:bagstore/widgets/add_outlined_button.dart';
import 'package:bagstore/widgets/input_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class AddForm extends ConsumerStatefulWidget {
  const AddForm({super.key});

  @override
  ConsumerState<AddForm> createState() => _AddFormState();
}

class _AddFormState extends ConsumerState<AddForm> {
  final _formKey = GlobalKey<FormState>();
  String? title;
  String? description;
  String? price;
  bool isImage = true;
  var pickedColor = Colors.black12;
  String? _image;
  void pickColor() {
    var newColor = pickedColor;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Pick a color'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ColorPicker(
                    pickerColor: pickedColor,
                    onColorChanged: (color) {
                      newColor = color;
                    },
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          pickedColor = newColor;
                        });
                        Navigator.of(context).pop();
                      },
                      child: const Text('Pick'))
                ],
              ),
            ));
  }

  void pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) {
        return;
      }
      setState(() {
        _image = image.path;
      });
    } catch (error) {
      print(error);
    }
  }

  void addProduct() {
    var isValid = _formKey.currentState!.validate();
    if (_image == null) {
      setState(() {
        isImage = false;
      });
      return;
    } else if (_image != null) {
      setState(() {
        isImage = true;
      });
    }
    if (isValid && isImage) {
      _formKey.currentState!.save();
      var product = ref.read(productsProvider);
      var newProduct = Product(
          id: product.length,
          image: _image.toString(),
          title: title!,
          price: int.parse(price!),
          description: description!,
          color: pickedColor);
      ref.read(productsProvider.notifier).addProduct(newProduct);

      Navigator.of(context).pop();
    }
  }

  void onSave(String type, String newValue) {
    if (type == 'Title') {
      title = newValue;
    } else if (type == 'Description') {
      description = newValue;
    } else if (type == 'Price') {
      price = newValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AddDisplay(
                  color: pickedColor,
                  pickColor: pickColor,
                  image: _image,
                  isImage: isImage),
              InputField(type: "Title", onSave: onSave),
              InputField(type: "Description", onSave: onSave),
              InputField(type: "Price", onSave: onSave),
              Row(
                children: [
                  AddOutlinedButton(
                      label: "Pick an image",
                      iconData: Icons.image,
                      pickImage: pickImage),
                  const SizedBox(width: 10),
                  AddOutlinedButton(
                      label: "Take an image",
                      iconData: Icons.camera_alt,
                      pickImage: pickImage),
                ],
              ),
              AddElevatedButton(
                color: pickedColor,
                title: 'Add Product',
                onPress: addProduct,
              )
            ],
          ),
        ),
      ),
    );
  }
}
