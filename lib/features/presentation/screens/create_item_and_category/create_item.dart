import 'dart:io';

import 'package:challenge/const.dart';
import 'package:challenge/features/domain/entities/item/item_entity.dart';
import 'package:challenge/features/presentation/cubit/shopping_item/shopping_item_cubit.dart';
import 'package:challenge/features/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../widgets/custom_bottom_sheet.dart';
import '../../widgets/custom_image_picker_dialog.dart';
import '../../widgets/custom_progress_indicator.dart';

class CreateItemSection extends StatefulWidget {
  const CreateItemSection({Key? key}) : super(key: key);

  @override
  State<CreateItemSection> createState() => _CreateItemSectionState();
}

class _CreateItemSectionState extends State<CreateItemSection> {
  var _imageFile;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();

  bool _isCreating = false;

  @override
  void dispose() {
    _nameController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 230,
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              _imageFile != null
                  ? Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.file(
                        _imageFile,
                        width: 250,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.black12),
                        width: 200,
                        height: 200,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
              Positioned(
                top: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    _pickImage(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        color: blueColor,
                        border: Border.all(
                          color: backGroundColor,
                          width: 3,
                        ),
                        shape: BoxShape.circle),
                    child: Icon(
                      Icons.edit,
                      color: backGroundColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            controller: _nameController,
            hintText: "Name",
          ),
          const SizedBox(
            height: 10,
          ),
          //TODO category is a dropdown menu, not a text field
          CustomTextField(
            controller: _categoryController,
            hintText: "Category",
          ),
          const SizedBox(height: 10,),
          _isCreating == true ? const CustomProgressIndicator() : Container(),
          Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              onPressed: () {
                _createItem();
              },
              child: const Text("Create"),
            ),
          )
        ],
      ),
    );
  }

  _createItem() {
    setState(() {
      _isCreating = true;
    });
    BlocProvider.of<ShoppingItemCubit>(context).createItem(
      item: ItemEntity(
        name: _nameController.text,
        category: _categoryController.text,
        imageUrl: ""
      ),
    ).then((value) => _clear());
  }

  _clear() {
    setState(() {
      _nameController.clear();
      _categoryController.clear();
      _imageFile = null;
      _isCreating = false;
    });
  }

  _pickImage(BuildContext context) async {
    final result = await showCustomBottomSheet(
      context,
      builder: (context, controller) => CustomDialogImagePicker(),
    );

    if (result == ImageSource.gallery) {
      _getFromGallery();
    } else if (result == ImageSource.camera) {
      _getFromCamera();
    } else {
      return;
    }
  }

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }
}
