import 'package:contacts/contact.dart';
import 'package:contacts/main.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class BottomSheetCustomWidget extends StatefulWidget {
  TextEditingController contactName = TextEditingController();
  TextEditingController contactNumber = TextEditingController();
  TextEditingController coverUrl = TextEditingController();

  BottomSheetCustomWidget({
    super.key,
    required this.contactName,
    required this.contactNumber,
    required this.coverUrl,
  });

  @override
  State<BottomSheetCustomWidget> createState() =>
      _BottomSheetCustomWidgetState();
}

class _BottomSheetCustomWidgetState extends State<BottomSheetCustomWidget> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextFormField(
            controller: widget.contactName,
            decoration: const InputDecoration(
                labelText: 'Contact Name',
                labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          TextFormField(
            controller: widget.contactNumber,
            decoration: const InputDecoration(
                labelText: 'Contact Number',
                labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          TextFormField(
            controller: widget.coverUrl,
            decoration: const InputDecoration(
                labelText: 'Contact Image URL',
                labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 400,
            child: ElevatedButton(
                onPressed: () {
                  setState(() {});
                  contactList.add(Contact(
                      name: widget.contactName.text,
                      number: widget.contactNumber.text,
                      url: widget.coverUrl.text
                  ));

                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) => const Home()),
                          (Route<dynamic> route) => false
                  );

                  widget.contactName.text = '';
                  widget.contactNumber.text = '';
                  widget.coverUrl.text = '';
                },
                child: const Text('ADD',
                    style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          )
        ],
      ),
    );
  }
}
