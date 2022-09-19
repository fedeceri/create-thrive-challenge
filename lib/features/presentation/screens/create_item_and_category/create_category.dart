import 'package:challenge/features/domain/entities/category/category_entity.dart';
import 'package:challenge/features/presentation/cubit/category_cubit/category_cubit.dart';
import 'package:challenge/features/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../widgets/custom_progress_indicator.dart';

class CreateCategorySection extends StatefulWidget {
  const CreateCategorySection({Key? key}) : super(key: key);

  @override
  State<CreateCategorySection> createState() => _CreateCategorySectionState();
}

class _CreateCategorySectionState extends State<CreateCategorySection> {
  Color _selectedColor = Colors.lightBlue;
  TextEditingController _nameController = TextEditingController();
  bool _isCreating = false;


  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 230,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            controller: _nameController,
            hintText: "Name",
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              OutlinedButton(
                onPressed: () {
                  _pickColorDialog(context);
                },
                child: const Text("Pick color"),
              ),
              Container(
                width: 30,
                height: 30,
                margin: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(color: _selectedColor, shape: BoxShape.circle),
              )
            ],
          ),
          const SizedBox(height: 10,),
          _isCreating == true ? const CustomProgressIndicator() : Container(),
          const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              onPressed: () {
                _createCategory();
              },
              child: const Text("Create"),
            ),
          )
        ],
      ),
    );
  }

  _createCategory() {
    setState(() {
      _isCreating = true;
    });
    BlocProvider.of<CategoryCubit>(context).createCategory(
      category: CategoryEntity(
          name: _nameController.text,
          color: "0x${_selectedColor.value.toRadixString(16)}",
      ),
    ).then((value) => _clear());
  }

  _clear() {
    setState(() {
      _nameController.clear();
      _isCreating = false;
    });
  }

  _pickColorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick a category color'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: _selectedColor,
              onColorChanged: (Color color) {
                setState(() {
                  _selectedColor = color;
                });
              },
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('DONE'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
