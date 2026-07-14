import 'dart:developer';
import 'package:file_picker_pro/file_data.dart';
import 'package:file_picker_pro/file_picker.dart';
import 'package:file_picker_pro/files.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FileData _fileData = FileData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('file_picker_pro')),
        body: SafeArea(
          child: Column(
            children: [
              ///////////////////////////////  Org   ////////////////////////////////////////////////
              FilePicker(
                context: context,
                height: 100,
                fileData: _fileData,
                crop: true,
                maxFileSizeInMb: 10,
                allowedExtensions: const [
                  Files.txt,
                  Files.png,
                  Files.jpg,
                  Files.pdf,
                ],
                onSelected: (fileData) {
                  _fileData = fileData;
                  log(fileData.filePath);
                  setState(() {});
                },
                onCancel: (message, messageCode) {
                  log("[$messageCode] $message");
                },
              ),
              /////////////////////////////////////////////////////////////////////////////////////////
              SizedBox(height: 24),
              ///////////////////////////// Test //////////////////////////////////////////////////////
              FilePicker(
                height: 100,
                fileData: _fileData,
                backgroundColor: Colors.blue,
                bottomSheet:
                    (context) => TestBottom(
                      pickerContext: context,
                      maxFileSizeInMb: 10,
                      fileData: _fileData,
                      crop: true,
                      onSelected: (FileData fileData) {
                        _fileData = fileData;
                        log(fileData.filePath);
                        setState(() {});
                      },
                      onCancel: (message, messageCode) {
                        log("[$messageCode] $message");
                      },
                      allowedExtensions: [
                        Files.txt,
                        Files.png,
                        Files.jpg,
                        Files.pdf,
                      ],
                    ),
              ),
              ///////////////////////////////////////////////////////////////////////////////////////
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class TestBottom extends StatelessWidget {
  const TestBottom({
    super.key,
    required this.pickerContext,
    required this.fileData,
    required this.crop,
    this.maxFileSizeInMb,
    this.allowedExtensions,
    required this.onSelected,
    this.onCancel,
  });

  final BuildContext pickerContext;
  final FileData fileData;
  final bool crop;
  final int? maxFileSizeInMb;
  final List<String>? allowedExtensions;

  final ValueChanged<FileData> onSelected;
  final void Function(String message, int messageCode)? onCancel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(88),
          topRight: Radius.circular(88),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Files.filePickerOptions(
                context: context,
                fileData: fileData,
                fileMode: FileMode.gallery,
                onSelected: onSelected,
              );
            },
            child: Icon(Icons.add_a_photo, size: 44),
          ),
        ],
      ),
    );
  }
}
