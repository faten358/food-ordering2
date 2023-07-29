import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering2/core/enums/message_file.dart';
import 'package:food_ordering2/ui/shared/color.dart';
import 'package:food_ordering2/ui/shared/custom_widgets/custom_button.dart';
import 'package:food_ordering2/ui/shared/custom_widgets/custom_toast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class Singup2View extends StatefulWidget {
  Singup2View({Key? key}) : super(key: key);

  @override
  State<Singup2View> createState() => _Singup2ViewState();
}

class _Singup2ViewState extends State<Singup2View> {
  final ImagePicker picker = ImagePicker();
  FileModel? selectedFile;
  bool showOptions = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Center(
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              InkWell(
                onTap: selectedFile == null || selectedFile!.path.isEmpty
                    ? () {
                        setShowOPtion(true);
                      }
                    : null,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColors.mainOrangeColor,
                  child: selectedFile == null
                      ? Icon(Icons.person)
                      : selectedFile!.path.isNotEmpty &&
                              selectedFile!.type == FileType.FILE
                          ? Icon(Icons.file_copy)
                          : selectedFile!.path.isNotEmpty
                              ? Image.file(File(selectedFile!.path))
                              : Icon(Icons.person),
                ),
              ),
              Visibility(
                  visible:
                      selectedFile != null && selectedFile!.path.isNotEmpty,
                  child: InkWell(
                    onTap: () {
                      setShowOPtion(true);
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColors.mainOrangeColor,
                    ),
                  ))
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Visibility(
          visible: showOptions,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButton(
                text: 'Camera',
                onPressed: () {
                  pickFile(FileType.CAMERA)
                      .then((value) => selectedFile = value);
                }, imageName: '',
              ),
              CustomButton(
                text: 'Gallery',
                onPressed: () {
                  pickFile(FileType.GALLERY)
                      .then((value) => selectedFile = value);
                }, imageName: '',
              ),
              CustomButton(
                text: 'File',
                onPressed: () {
                  pickFile(FileType.FILE).then((value) => selectedFile = value);
                }, imageName: '',
              ),
            ],
          ),
        ),
        CustomButton(text: 'click here', onPressed: () async {
          final Uri _url = Uri.parse('https://flutter.dev');
          //mode: LaunchMode.externalApplication for open in browser
          if (!await launchUrl(_url,mode: LaunchMode.externalApplication)) {
    CoustomToast.showMessage(
     
     message: 'can not',
     messageType: MessageType.REJECTED);
  }
      }, imageName: '',)
      ]),
      
    );
  }

  void setShowOPtion(bool value) {
    setState(() {
      showOptions = value;
    });
  }

  Future<FileModel> pickFile(FileType type) async {
    //path  for save link of file
    String path = '';

    switch (type) {
      case FileType.CAMERA:
        await picker
            .pickImage(source: ImageSource.camera)
            .then((value) => path = value?.path ?? '');
        break;
      case FileType.GALLERY:
        await picker
            .pickImage(source: ImageSource.gallery)
            .then((value) => path = value?.path ?? '');
        break;
      case FileType.FILE:
        await FilePicker.platform
            .pickFiles()
            .then((value) => path = value?.paths[0] ?? '');
        break;
    }
    //for button or head
    setShowOPtion(false);
    return FileModel(path.isNotEmpty ? path : selectedFile!.path,
        path.isNotEmpty ? type : selectedFile!.type);
  }
}

//second step
class FileModel {
  //type for icone or photo
  FileType type;
  String path;

  FileModel(this.path, this.type);
}
//first step
enum FileType { CAMERA, GALLERY, FILE }