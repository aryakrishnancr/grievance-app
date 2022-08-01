import 'package:flutter/material.dart';
import 'package:user_auth/data/models/user_model.dart';
import 'package:user_auth/data/remote_data_source/firestore_helper.dart';

class EditPage extends StatefulWidget {
  final UserModel user;
  const EditPage({Key? key, required this.user}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  String? username;
  String? department;
  String? desc;
  String? type;
  String? image;

  @override
  void initState() {
    super.initState();
    _loadData();
    userfromfirestore();
  }

  _loadData() {
    print(widget.user.image);
    setState(() {
      username = widget.user.username;
      department = widget.user.department;
      desc = widget.user.desc;
      type = widget.user.type;
      image = widget.user.image;
    });
  }

  userfromfirestore() async {
    final user = await FirestoreHelper.read();
    setState(() {
      //  final userData = snapshot.data;
    });
  }

  @override
  void dispose() {
    // _usernameController!.dispose();
    // _ageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("complaints"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Text(username!),
              const SizedBox(
                height: 20,
              ),
              Text(department!),
              const SizedBox(
                height: 20,
              ),
              Text(type!),
              const SizedBox(
                height: 20,
              ),
              Text(desc!),
              const SizedBox(
                height: 10,
              ),
              image == null
                  ? const CircularProgressIndicator()
                  : Image.network(image!),
              // InkWell(
              //   onTap: () {
              //     FirestoreHelper.update(
              //       UserModel(
              //           id: widget.user.id,
              //           username: _usernameController!.text,
              //           department: _ageController!.text),
              //     ).then((value) {
              //       Navigator.pop(context);
              //     });
              //   },
              //   // child: Container(
              //   //   width: 100,
              //   //   height: 30,
              //   //   decoration: BoxDecoration(
              //   //     borderRadius: BorderRadius.circular(20),
              //   //     color: Colors.green,
              //   //   ),
              //   //   // child: Row(
              //   //   //   mainAxisAlignment: MainAxisAlignment.center,
              //   //   //   children: [
              //   //   //     Icon(
              //   //   //       Icons.add,
              //   //   //       color: Colors.white,
              //   //   //     ),
              //   //   //     SizedBox(
              //   //   //       width: 5,
              //   //   //     ),
              //   //   //     Text(
              //   //   //       "Update",
              //   //   //       style: TextStyle(color: Colors.white),
              //   //   //     ),
              //   //   //   ],
              //   //   // ),
              //   // ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
