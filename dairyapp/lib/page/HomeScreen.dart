import 'package:dairyapp/model/model.dart';
import 'package:dairyapp/page/AddPage.dart';
import 'package:dairyapp/provider/NoteProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    Noteprovider noteprovider = Provider.of<Noteprovider>(context);
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 50.w,
        width: 50.w,
        child: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 20.w,
          ),
          onPressed: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => AddPage(isupdate: false),
                ));
          },
        ),
      ),
      appBar: AppBar(
        title: Text(
          'My Dailry',
          style: TextStyle(fontSize: 20.sp),
        ),
      ),
      body: GridView.builder(
        itemCount: noteprovider.list.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          Model model = Provider.of<Noteprovider>(context).list[index];
          return Padding(
            padding: EdgeInsets.all(10.w),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                      fullscreenDialog: true,
                      builder: (context) => AddPage(
                        isupdate: true,
                        models: model,
                      ),
                    ));
              },
              onLongPress: () {
                noteprovider.delete(model);
              },
              child: Container(
                padding: EdgeInsets.all(4.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      model.title!,
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Expanded(
                      child: Text(
                        maxLines: 7,
                        overflow: TextOverflow.ellipsis,
                        model.content!,
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 77, 76, 76)),
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.w),
                ),
                height: 40.w,
                width: 50.w,
              ),
            ),
          );
        },
      ),
    );
  }
}
