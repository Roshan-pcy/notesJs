import 'package:dairyapp/model/model.dart';
import 'package:dairyapp/provider/NoteProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AddPage extends StatelessWidget {
  final TextEditingController titleControl = TextEditingController();
  final TextEditingController contentControl = TextEditingController();

  final FocusNode focusNode = FocusNode();
  AddPage({super.key});

  void addnote(BuildContext context) {
    Model myModel = Model(
        id: Uuid().v1(),
        title: titleControl.text,
        content: contentControl.text,
        dateadded: DateTime.now());
    Provider.of<Noteprovider>(context, listen: false).AddNote(myModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                addnote(context);
                Navigator.pop(context);
              },
              icon: Icon(
                size: 15.w,
                Icons.done,
                color: Colors.white,
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            TextFormField(
              controller: titleControl,
              onFieldSubmitted: (value) {
                if (value != '') {
                  focusNode.requestFocus();
                }
              },
              style: TextStyle(fontSize: 30.sp, color: Colors.black),
              autofocus: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Title',
                hintStyle: TextStyle(fontSize: 30.sp, color: Colors.black),
              ),
            ),
            Expanded(
              flex: 5,
              child: TextFormField(
                controller: contentControl,
                focusNode: focusNode,
                style: TextStyle(fontSize: 20.sp, color: Colors.black),
                maxLines: null,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'content',
                    hintStyle: TextStyle(fontSize: 20.sp, color: Colors.black)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
