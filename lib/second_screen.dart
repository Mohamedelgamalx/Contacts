import 'package:contacts/contact_provider.dart';
import 'package:flutter/material.dart';
import 'contact.dart';
import 'home.dart';
import 'main.dart';

class SecondScreen extends StatefulWidget {

  Contact? contact;

  SecondScreen({
    super.key,
    this.contact});

  static const route = '/secondscreen';

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  TextEditingController contactName = TextEditingController();
  TextEditingController contactNumber = TextEditingController();
  TextEditingController coverUrl = TextEditingController();

  @override
  void initState() {
    contactName.text = widget.contact!.name;
    contactNumber.text = widget.contact!.number;
    coverUrl.text = widget.contact!.url;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Details', style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color(0xff2376d2)
        ),
        ),
        backgroundColor: const Color(0x00ffffff),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              maxRadius: 150,
                backgroundImage: NetworkImage(widget.contact!.url),
            ),
            const SizedBox(height: 30,),
            TextFormField(
              controller: contactName,
              decoration: const InputDecoration(
                  labelText: 'Contact Name',
                  labelStyle: TextStyle(
                      color: Colors.black45,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
            TextFormField(
              controller: contactNumber,
              decoration: const InputDecoration(
                  labelText: 'Contact Number',
                  labelStyle: TextStyle(
                      color: Colors.black45,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
            TextFormField(
              controller: coverUrl,
              decoration: const InputDecoration(
                  labelText: 'Contact Image URL',
                  labelStyle: TextStyle(
                      color: Colors.black45,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 30,),
            SizedBox(
              width: 400,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {});
                    ContactProvider.instance.update(Contact(
                        name: contactName.text,
                        number: contactNumber.text,
                        url: coverUrl.text
                    ));

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Home()),
                    );
                  },
                  child: const Text('Save',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
            ),
            SizedBox(
              width: 400,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color(0xfffafafa)
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                            'Delete Contact',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54),
                          ),
                          content: const Text(
                            'Are you sure you want to delete this book?',
                            style: TextStyle(
                                fontSize: 18, color: Colors.grey),
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor:
                                  const Color(0xffffffff)),
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(context,MaterialPageRoute(builder: (context) => const Home())
                                );
                                ContactProvider.instance.deleteContact(widget.contact!.id!);
                              },
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor:
                                  const Color(0xffffffff)),
                              child: const Text(
                                'Yes',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                            ),
                          ],
                        );
                      });
                  setState(() {});
                },
                child: const Text('Delete',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}