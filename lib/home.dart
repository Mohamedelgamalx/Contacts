import 'package:contacts/contact.dart';
import 'package:contacts/second_screen.dart';
import 'package:flutter/material.dart';
import 'bottom_sheet.dart';
import 'contact_provider.dart';
import 'main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static const route = '/';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController contactName = TextEditingController();
  TextEditingController contactNumber = TextEditingController();
  TextEditingController coverUrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Contacts', style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color(0xff2376d2)
          ),
          ),
          backgroundColor: const Color(0x00ffffff),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff2376d2),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return BottomSheetCustomWidget(
                    contactName: contactName,
                    contactNumber: contactNumber,
                    coverUrl: coverUrl,
                  );
                });
          },
          child: const Icon(
            Icons.add,
            size: 40,
          ),
        ),
        body: FutureBuilder<List<Contact>>(
          future: ContactProvider.instance.getAllContacts(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            if (snapshot.hasData) {
              contactList = snapshot.data!;
            }
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>
                            SecondScreen(contact: contactList[index],)));
                  },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0x0fffffff),
                          elevation: 0
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            maxRadius: 60,
                            backgroundImage: NetworkImage(contactList[index]
                                .url),
                          ),
                          Text(contactList[index].name, style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),
                          ),
                          Text(
                            contactList[index].number, style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black45
                          ),
                          ),
                        ],
                      )
                  ),
                );
              },
            );
          }
        ),
    );
  }
}