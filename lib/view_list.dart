import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:path_provider/path_provider.dart';

class View_List extends StatefulWidget {
  const View_List({Key? key}) : super(key: key);

  @override
  State<View_List> createState() => _View_ListState();
}

class _View_ListState extends State<View_List> {
  List<String> itemList = new List.empty(growable: true);

  void initData() async {
    var result = await readListFile();
    setState(() {
      itemList.addAll(result);
    });
  }

  Future<List<String>> readListFile() async {
    List<String> itemList = new List.empty(growable: true);
    var key = 'first';

    var dir = await getApplicationDocumentsDirectory();
    bool fileExist = await File(dir.path + '/fruit.txt').exists();

    if (fileExist == false) {
      var file =
          await DefaultAssetBundle.of(context).loadString('repo/fruit.txt');

      File(dir.path + '/fruit.txt').writeAsStringSync(file);

      var array = file.split('\n');
      for (var item in array) {
        print('new file : ' + item);
        itemList.add(item);
      }
      return itemList;
    } else {
      var file = await File(dir.path + '/fruit.txt').readAsStringSync();

      var array = file.split('\n');
      for (var item in array) {
        print('already exist file : ' + item);
        itemList.add(item);
      }

      return itemList;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List 01'),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: Center(
                child: Column(
                  children: [
                    Text('날짜 : ${itemList[index].split('/')[0]}'),
                    Text('운동내용 : ${itemList[index].split('/')[1]}'),
                  ],
                ),
              ),
            );
          },
          itemCount: itemList.length),
    );
  }
}
