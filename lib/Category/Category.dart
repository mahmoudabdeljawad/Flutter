import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_99915215/Component/ToolBar.dart';

import 'package:http/http.dart' as http;

void main() => runApp(const Category());

class ICategory {
  int? id;
  String? name;
  bool? isDeleted;
  Null? createdDate;

  ICategory({this.id, this.name, this.isDeleted, this.createdDate});

  ICategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isDeleted = json['isDeleted'];
    createdDate = json['createdDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['isDeleted'] = this.isDeleted;
    data['createdDate'] = this.createdDate;
    return data;
  }
}

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CategoryWidget(),
    );
  }
}

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<StatefulWidget> createState() => CategoryState();
}

class CategoryState extends State<CategoryWidget> {
  var lst_category = ICategory();
  @override
  void initState() {
    super.initState();
    getcategory();
  }

  void getcategory() async {
    print('object');
    Uri url = Uri.parse('https://localhost:7243/api/Home/Category');
    final body = jsonEncode(lst_category.toJson());
    try {
      final response = await http.post(
        url,
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json"
        },
        body:
            body, // Pass the map directly, http.post will handle the conversion
      );
      print(ICategory.fromJson(jsonDecode(response.body)));
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width,
      width: MediaQuery.of(context).size.width,
      child: Column(children: [
        Container(
            padding: EdgeInsets.only(right: 10),
            alignment: Alignment.centerRight,
            child: Column(
              children: [
                Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  style: IconButton.styleFrom(),
                  color: Colors.green,
                  tooltip: 'Add',
                  iconSize: 50,
                  icon: const Icon(Icons.add_box_outlined),
                  onPressed: () =>
                      {Navigator.pushNamed(context, '/CategoryAdd')},
                ),
              ],
            )),
        ListTile(
          contentPadding: EdgeInsets.only(top: 10, left: 22, right: 22),
          leading: CircleAvatar(child: Text('A')),
          title: const Text('Headline'),
          subtitle: const Text('Supporting text'),
          trailing: IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.edit_square),
          ),
        ),
      ]),
    );
  }
}
