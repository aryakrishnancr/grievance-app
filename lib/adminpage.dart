import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:user_auth/data/models/user_model.dart';
import 'package:user_auth/data/remote_data_source/firestore_helper.dart';
import 'package:user_auth/details.dart';
import 'package:user_auth/user_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
//import 'package:flutter_firebase_crud/presentation/pages/edit_page.dart';

class admin extends StatefulWidget {
  const admin({Key? key}) : super(key: key);

  @override
  State<admin> createState() => _HomePageState();
}

class _HomePageState extends State<admin> {
  FirebaseStorage storage = FirebaseStorage.instance;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _descrptionController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _Controller = TextEditingController();
  final List<String> type = [
    'Canteen',
    'Mess',
    'Hostel',
    'College',
    'Management',
    'Lectures',
    'others'
  ];
  String? typeselected;
  String? imageurl;
  Uint8List? _pickedImage;
  String? image;
  bool _isUploading = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _departmentController.dispose();
    _descrptionController.dispose();
    _typeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Complaint List"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // TextFormField(
              //   controller: _usernameController,
              //   decoration: InputDecoration(
              //       border: OutlineInputBorder(), hintText: "Name"),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // TextFormField(
              //   controller: _departmentController,
              //   decoration: InputDecoration(
              //       border: OutlineInputBorder(), hintText: "Department"),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // TextFormField(
              //   controller: _descrptionController,
              //   decoration: InputDecoration(
              //       border: OutlineInputBorder(),
              //       hintText: "Description in Detail"),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Text(
              //   "Please Choose your type of complaint",
              //   style: TextStyle(
              //     color: Colors.grey[700],
              //     fontSize: 17,
              //     fontWeight: FontWeight.w500,
              //   ),
              // ),
              // DropdownButton(
              //   icon: const Icon(Icons.location_pin),
              //   borderRadius: BorderRadius.circular(5),
              //   style: const TextStyle(fontSize: 20, color: Colors.black),
              //   // Not necessary for Option 1
              //   value: typeselected,
              //   onChanged: (newValue) {
              //     setState(() {
              //       typeselected = newValue as String?;
              //     });
              //   },
              //   items: type.map((location) {
              //     return DropdownMenuItem(
              //       child: Text(location),
              //       value: location,
              //     );
              //   }).toList(),
              // ),
              // Container(
              //     margin: EdgeInsets.all(15),
              //     padding: EdgeInsets.all(15),
              //     decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.all(
              //         Radius.circular(15),
              //       ),
              //       border: Border.all(color: Colors.white),
              //       boxShadow: [
              //         BoxShadow(
              //           color: Colors.black12,
              //           offset: Offset(2, 2),
              //           spreadRadius: 2,
              //           blurRadius: 1,
              //         ),
              //       ],
              //     ),
              //     child: (_pickedImage != null)
              //         ? Image.memory(_pickedImage!)
              //         : Image.network('https://i.imgur.com/sUFH1Aq.png')),
              // SizedBox(
              //   height: 0,
              // ),
              // InkWell(
              //   onTap: () {
              //     _upload('gallary');
              //     // _create();
              //   },
              //   child: Container(
              //     width: 100,
              //     height: 30,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(20),
              //       color: Colors.green,
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Icon(
              //           Icons.upload,
              //           color: Colors.white,
              //         ),
              //         SizedBox(
              //           width: 5,
              //         ),
              //         Text(
              //           _isUploading ? "loading" : "upload",
              //           style: TextStyle(color: Colors.white),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 30,
              // ),
              // InkWell(
              //   onTap: () async {
              //     setState(() {
              //       _isUploading = true;
              //     });
              //     try {
              //       String uid = Uuid().v1();
              //       var a = await storage.ref(uid).putFile(
              //           imagefile,
              //           SettableMetadata(customMetadata: {
              //             'uploaded_by': '',
              //             'description': 'Some description...'
              //           }));
              //       image = await a.ref.getDownloadURL();
              //       print(image);

              //       await FirestoreHelper.create(UserModel(
              //           username: _usernameController.text,
              //           department: _departmentController.text,
              //           desc: _descrptionController.text,
              //           type: typeselected,
              //           image: image));
              //     } catch (e) {
              //       print(e.toString());
              //     }

              //     setState(() {
              //       _isUploading = false;
              //     });

              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (context) => NewHomeScreen()));

              //     // _create();
              //   },
              //   child: Container(
              //     width: 150,
              //     height: 50,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(20),
              //       color: Colors.green,
              //     ),
              //     child: _isUploading
              //         ? CircularProgressIndicator()
              //         : Row(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Icon(
              //                 Icons.add,
              //                 color: Colors.white,
              //               ),
              //               SizedBox(
              //                 width: 5,
              //               ),
              //               Text(
              //                 "Create",
              //                 style: TextStyle(color: Colors.white),
              //               ),
              //             ],
              //           ),
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              StreamBuilder<List<UserModel>>(
                  stream: FirestoreHelper.read(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text("some error occured"),
                      );
                    }
                    if (snapshot.hasData) {
                      final userData = snapshot.data;
                      return Expanded(
                        child: ListView.builder(
                            itemCount: userData!.length,
                            itemBuilder: (context, index) {
                              final singleUser = userData[index];
                              return Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                child: ListTile(
                                  onLongPress: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text("Delete"),
                                            content: const Text(
                                                "Are you sure you want to delete"),
                                            actions: [
                                              ElevatedButton(
                                                  onPressed: () {
                                                    FirestoreHelper.delete(
                                                            singleUser)
                                                        .then((value) {
                                                      Navigator.pop(context);
                                                    });
                                                  },
                                                  child: const Text("Delete"))
                                            ],
                                          );
                                        });
                                  },
                                  leading: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                        color: Colors.deepPurple,
                                        shape: BoxShape.circle),
                                  ),
                                  title: Text("${singleUser.username}"),
                                  subtitle: Text("${singleUser.department}"),
                                  trailing: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => EditPage(
                                                      user: UserModel(
                                                          username: singleUser
                                                              .username,
                                                          department: singleUser
                                                              .department,
                                                          desc: singleUser.desc,
                                                          type: singleUser.type,
                                                          image:
                                                              singleUser.image,
                                                          id: singleUser.id),
                                                    )));
                                      },
                                      child: const Icon(Icons.edit)),
                                ),
                              );
                            }),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  late File imagefile;
  Future<void> _upload(String inputSource) async {
    // final _firebaseStorage = FirebaseStorage.instance;
    XFile? pickedImage;
    final picker = ImagePicker();

    try {
      pickedImage = await picker.pickImage(
          source: inputSource == 'camera'
              ? ImageSource.camera
              : ImageSource.gallery,
          maxWidth: 1920);

      final String imageurl = path.basename(pickedImage!.path);
      imagefile = File(pickedImage.path);
      var pngbytes = await pickedImage.readAsBytes();

      setState(() {
        _pickedImage = pngbytes;
      });

      setState(() {
        _isUploading = true;
      });

      // try {
      //   // Uploading the selected image with some custom meta data
      //   var a = await storage.ref(imageurl).putFile(
      //       imageFile,
      //       SettableMetadata(customMetadata: {
      //         'uploaded_by': '',
      //         'description': 'Some description...'
      //       }));
      //   image = await a.ref.getDownloadURL();
      //   print(image);
      //   // Refresh the UI

      // } on FirebaseException catch (error) {
      //   if (kDebugMode) {
      //     print(error);
      //   }
      // }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
    setState(() {
      _isUploading = false;
    });
  }

  Future<void> imageupload() async {
    try {
      // Uploading the selected image with some custom meta data

      // Refresh the UI

    } on FirebaseException catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }

// Future _create() async {
//   final userCollection = FirebaseFirestore.instance.collection("users");
//
//   final docRef = userCollection.doc();
//
//   await docRef.set({
//     "username": _usernameController.text,
//     "age": _ageController.text
//   });
//
//
// }
  }
}
