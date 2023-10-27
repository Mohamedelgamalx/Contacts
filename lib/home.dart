import 'package:flutter/material.dart';
import 'bottom_sheet.dart';
import 'main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

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
      body: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
      ),
        itemCount: contactList.length,
        itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0x0fffffff),
                  elevation: 0
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    maxRadius: 60,
                    child: Icon(Icons.person,
                    size: 80,),

                  ),
                  Text(contactName.text, style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),
                  ),
                  Text(contactNumber.text, style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black45
                  ),
                  ),
                ],
              )
          ),
        );
      },
      ),
    );
  }
}
