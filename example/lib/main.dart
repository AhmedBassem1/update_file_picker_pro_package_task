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

  GlobalKey<ScaffoldState> globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: globalKey,
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
                backgroundColor: Colors.blue,
                bottomSheet: (context) => TestBottom(),
              ),
///////////////////////////////////////////////////////////////////////////////////////              
              SizedBox(height: 24),

              MaterialButton(
                onPressed: () {
                  globalKey.currentState!.showBottomSheet(
                    (context) => TestBottom(),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  color: Colors.blue,

                  child: Text('Bottom Sheet'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TestBottom extends StatelessWidget {
  const TestBottom({super.key});

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
          Icon(Icons.add_a_photo, size: 44),
          SizedBox(width: 12),
          Icon(Icons.add_alert, size: 44),
        ],
      ),
    );
  }
}
