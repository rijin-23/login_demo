import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:login_demo/provider/data_provider.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _isInit = true;
  bool _isLoading = false;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<DataProvider>(context).details();
      setState(() {
        _isLoading = false;
      });
      _isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Users'),
        ),
        body: Data());
  }
}

class Data extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fname = Provider.of<DataProvider>(context).firstName;
    final lname = Provider.of<DataProvider>(context).lastName;
    final img = Provider.of<DataProvider>(context).imgUrl;

    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('${fname[index]} ${lname[index]} '),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(img[index]),
          ),
        );
      },
      itemCount: fname.length,
    );
  }
}
