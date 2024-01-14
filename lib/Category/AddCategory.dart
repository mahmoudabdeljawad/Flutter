import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_99915215/Component/ToolBar.dart';
import 'dart:collection';

void main() => runApp(const AddCategory());

class ICategoryAdd {
  int? id;
  String? name;
  bool? isDeleted;
  Null? createdDate;

  ICategoryAdd({this.id, this.name, this.isDeleted, this.createdDate});

  ICategoryAdd.fromJson(List<Map<String, dynamic>> json) {
    for (var item in json) {
      id = item['id'];
      name = item['name'];
      isDeleted = item['isDeleted'];
      createdDate = item['createdDate'];
    }
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

class AddCategory extends StatelessWidget {
  const AddCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AddCategoryWidget(),
    );
  }
}

class AddCategoryWidget extends StatefulWidget {
  const AddCategoryWidget({super.key});

  @override
  State<AddCategoryWidget> createState() => AddCategoryState();
}

class AddCategoryState extends State<AddCategoryWidget> {
  final _formKey = GlobalKey<FormState>();
  var _categor = ICategoryAdd();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolBar(
        automaticallyImplyLeading: true,
        pageTitile: 'Add Category',
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 22),
          height: MediaQuery.of(context).size.width,
          width: MediaQuery.of(context).size.width,
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 22, horizontal: 22),
                      child: TextFormField(
                          onChanged: (value) => {
                                setState(() {
                                  _categor.name = value;
                                })
                              },
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            errorStyle: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Requierd Field';
                            }
                            return null;
                          })),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(4),
                                top: Radius.circular(4)),
                          ),
                        ),
                        child: const Text(
                          'Save',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                            Uri url = Uri.parse(
                                'https://localhost:7243/api/Home/Category');
                            final body = jsonEncode(_categor.toJson());
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
                              print(ICategoryAdd.fromJson(
                                  jsonDecode(response.body)));
                            } catch (e) {
                              print(e.toString());
                            }
                          }
                        },
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
