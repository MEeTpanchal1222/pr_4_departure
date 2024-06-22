import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pr_4_departure/provider/provider.dart';
import 'package:pr_4_departure/uitels/theme.dart';
import 'package:provider/provider.dart';

class HomeScren extends StatelessWidget {
  const HomeScren({super.key});

  @override
  Widget build(BuildContext context) {
    Dataprovider provider = Provider.of<Dataprovider>(context, listen: true);
    log('-------------------- ${provider.datalist.length}');
    List<String> imagePaths = [
      "assets/image/img_1.png",
      "assets/image/img_2.png",
      "assets/image/img_3.png",
      "assets/image/img_4.png",
      "assets/image/img_5.png",
      "assets/image/img_6.png",
    ];
    return Scaffold(
      appBar: AppBar(
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ],
        leading: Row(
          children: [
            SizedBox(width: 20),
            CircleAvatar(backgroundImage: AssetImage("assets/image/img.png")),
          ],
        ),
        leadingWidth: 70,
        title: Text('Dohe'),
      ),

   drawer: Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            'Drawer Header',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.contact_mail),
          title: Text('Contact'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    ),
  ),
      body: ListView.builder(
        itemCount: provider.userlist.length,
        itemBuilder: (context, index) {
          final dohe = provider.userlist[index].dohe;
          int imageIndex = index % imagePaths.length;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              child: CupertinoContextMenu(
                actions: [
                  CupertinoContextMenuAction(
                    child: const Text("Copy"),
                    onPressed: () => Navigator.pop(context),
                    isDefaultAction: true,
                    trailingIcon: CupertinoIcons.doc_on_clipboard_fill,
                  ),
                  CupertinoContextMenuAction(
                    child: const Text("Share"),
                    onPressed: () => Navigator.pop(context),
                    isDefaultAction: true,
                    trailingIcon: CupertinoIcons.share,
                  ),
                  CupertinoContextMenuAction(
                    child: const Text("Favourite"),
                    onPressed: () => Navigator.pop(context),
                    isDefaultAction: true,
                    trailingIcon: CupertinoIcons.heart,
                  ),

                  CupertinoContextMenuAction(
                    child: const Text(
                      "Remove",
                      style: TextStyle(color: CupertinoColors.destructiveRed),
                    ),
                    onPressed: () => Navigator.pop(context),
                    isDefaultAction: true,
                    trailingIcon: CupertinoIcons.delete_simple,
                  ),
                ],
                child: Card(
                  shape: CircleBorder(),
                  child: Container(
                    height: 410,
                    width: 400,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        image: DecorationImage(
                            image: AssetImage(imagePaths[imageIndex]),
                            fit: BoxFit.cover)),
                    child: ListTile(

                      leading: Text(
                        "${provider.userlist[index].index}",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      title: Text(dohe?.original ?? 'No original text'),
                      subtitle: Text(dohe?.english ?? 'No English text',style: TextStyle(
                        color: Colors.blue.shade200
                      ),),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
