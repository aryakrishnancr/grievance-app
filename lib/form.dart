import 'package:flutter/material.dart';
import 'package:user_auth/submission.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  late String _name;
  late String _email;
  late String _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String dropdownValue = 'Canteen';

  Widget _buildName() {
    return TextFormField(
        decoration: const InputDecoration(labelText: 'Name'),
        onSaved: (String? value) {
          _name = value!;
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'Enter a valid Name!';
          }
          return null;
        });
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Department'),
      onSaved: (String? value) {
        _email = value!;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Description in Detail'),
      onSaved: (String? value) {
        _password = value!;
      },
    );
  }

  Widget _buildDropDown() => DropdownButton<String>(
        isExpanded: true,
        hint: const Text("Type of Complaint"),
        style: const TextStyle(color: Colors.deepPurple),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>[
          'Canteen',
          'Mess',
          'Hostel',
          'College',
          'Management',
          'Lectures',
          'Other'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Form")),
      body: Container(
        margin: const EdgeInsets.all(24),
        child: Form(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildName(),
            _buildEmail(),
            _buildPassword(),
            _buildDropDown(),
            const SizedBox(height: 100),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Page1()));
                }

                // print(_name);
                // print(_email);
                // print(_phoneNumber);
                // print(_url);
                // print(_password);
                // print(_calories);

                )
          ],
        )),
      ),
    );
  }
}
