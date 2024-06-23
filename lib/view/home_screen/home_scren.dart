import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pr_4_departure/provider/provider.dart';
import 'package:pr_4_departure/uitels/theme.dart';
import 'package:provider/provider.dart';

class HomeScren extends StatefulWidget {
  const HomeScren({super.key});

  @override
  State<HomeScren> createState() => _HomeScrenState();
}

class _HomeScrenState extends State<HomeScren> {
  @override
  Widget build(BuildContext context) {
    Dataprovider provider = Provider.of<Dataprovider>(context, listen: true);
    langprovider providerT = Provider.of<langprovider>(context, listen: true);
    langprovider providerF = Provider.of<langprovider>(context, listen: false);
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
              icon: Icon(Icons.menu,color: (providerT.isdark)?Colors.black:Colors.white,),
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
        title: Text('Dohe',style: Theme.of(context).textTheme.titleLarge),
      ),
      drawer: Drawer(

        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: [
                  CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage("assets/image/img.png")),
                  Text(
                    'MeetR panchal',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                ],
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
              leading: (providerT.isdark)?Icon(Icons.dark_mode):Icon(Icons.light_mode),
              title: Text('Theme'),
              onTap: () {
                providerF.boolforbool("Theme");
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
            ListTile(
              title: Row(
                children: [
            Icon(Icons.language),
                  SizedBox(width: 18,),
                  Text('language'),
                ],
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    leading: (providerT.hindi)?Icon(Icons.check_box):Icon(Icons.check_box_outline_blank),
                    title: Text('Hindi'),
                     onTap: () {
                      providerF.boolforbool('hindi');
                      Navigator.pop(context);
                     },
                  ),
                  ListTile(
                    leading: (providerT.eng)?Icon(Icons.check_box):Icon(Icons.check_box_outline_blank),
                    title: Text('English'),
                    onTap: () {
                      providerF.boolforbool('eng');
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading:(providerT.guj)?Icon(Icons.check_box):Icon(Icons.check_box_outline_blank),
                    title: Text('Gujrati'),
                    onTap: () {
                      providerF.boolforbool('guj');
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
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
                    subtitle: Text(
                      (providerT.eng)?'${dohe?.english}':(providerT.guj)?'${dohe?.gujarati}':'${dohe?.hindi}',
                      style: TextStyle(color: Colors.blue.shade200),
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
