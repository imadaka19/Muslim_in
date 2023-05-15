import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SideMenu extends StatelessWidget {
  final currentUser = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      backgroundColor: const Color(0xFF272A35),
      child: Column(
        children: [
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .where('id', isEqualTo: currentUser.currentUser!.uid)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    // Remove padding
                    // padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, i) {
                      var data = snapshot.data!.docs[i];
                      return UserAccountsDrawerHeader(
                        accountName: Text(
                          data['username'],
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        accountEmail: Text(data['email']),
                        currentAccountPicture: CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: ClipOval(
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 50,
                            ),
                            // Image.network(
                            //   'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF272A35),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('sources/profile-bg3.jpg')),
                        ),
                      );
                    },
                  );
                } else {
                  return CircularProgressIndicator();
                }
              }),
          // ListTile(
          //   leading: Icon(Icons.favorite, color: Colors.white),
          //   title: Text(
          //     'Favorites',
          //     style: TextStyle(color: Colors.white),
          //   ),
          //   onTap: () => null,
          // ),
          // ListTile(
          //   leading: Icon(Icons.person, color: Colors.white),
          //   title: Text(
          //     'Friends',
          //     style: TextStyle(color: Colors.white),
          //   ),
          //   onTap: () => null,
          // ),
          // ListTile(
          //   leading: Icon(Icons.share, color: Colors.white),
          //   title: Text(
          //     'Share',
          //     style: TextStyle(color: Colors.white),
          //   ),
          //   onTap: () => null,
          // ),
          // ListTile(
          //   leading: Icon(Icons.notifications, color: Colors.white),
          //   title: Text(
          //     'Request',
          //     style: TextStyle(color: Colors.white),
          //   ),
          // ),
          // Divider(
          //   color: Colors.white,
          // ),
          // ListTile(
          //   leading: Icon(Icons.settings, color: Colors.white),
          //   title: Text(
          //     'Settings',
          //     style: TextStyle(color: Colors.white),
          //   ),
          //   onTap: () => null,
          // ),
          // ListTile(
          //   leading: Icon(Icons.description, color: Colors.white),
          //   title: Text(
          //     'Policies',
          //     style: TextStyle(color: Colors.white),
          //   ),
          //   onTap: () => null,
          // ),
          // Divider(
          //   color: Colors.white,
          // ),
          ListTile(
            title: Text(
              'Exit',
              style: TextStyle(color: Colors.white),
            ),
            leading: Icon(Icons.exit_to_app, color: Colors.white),
            onTap: () => FirebaseAuth.instance.signOut(),
          ),
        ],
      ),
    );
  }
}
