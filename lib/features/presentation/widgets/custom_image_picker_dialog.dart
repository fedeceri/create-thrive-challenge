import 'package:challenge/const.dart';
import 'package:challenge/features/presentation/widgets/custom_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';



class CustomDialogImagePicker extends StatefulWidget {
  const CustomDialogImagePicker({Key? key}) : super(key: key);

  @override
  _CustomDialogImagePickerState createState() => _CustomDialogImagePickerState();
}

class _CustomDialogImagePickerState extends State<CustomDialogImagePicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 32.0, top: 10),
      child: Column(
        children: [
          ListTile(
            leading: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: blueColor,
                    width: 3,
                  ),
                  shape: BoxShape.circle
              ),
              child: Icon(
                Icons.camera_alt_outlined,
                color: blueColor,
              ),
            ),
            title: Text('Camera'),
            onTap: () => Navigator.pop(context, ImageSource.camera),
          ),
          Divider(),
          ListTile(
            leading: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: blueColor,
                    width: 3,
                  ),
                  shape: BoxShape.circle
              ),
              child: Icon(
                Icons.image_outlined,
                color: blueColor,
              ),
            ),
            title: Text('Choose from Gallery'),
            onTap: () => Navigator.pop(context, ImageSource.gallery),
          ),
        ],
      ),
    );
  }
}