import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:muslim_in/view/qiblat_screen.dart';

class Qiblat extends StatefulWidget {
  const Qiblat({super.key});

  @override
  State<Qiblat> createState() => _QiblatState();
}

class _QiblatState extends State<Qiblat> {
  bool hasPermission = false;

  Future getPermission() async {
    if (await Permission.location.serviceStatus.isEnabled) {
      var status = await Permission.location.status;
      if (status.isGranted) {
        hasPermission = true;
      } else {
        Permission.location.request().then((value) {
          setState(() {
            hasPermission = (value == PermissionStatus.granted);
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (hasPermission) {
          return const QiblahScreen();
        } else {
          // Navigator.of(context).pop();
          return const Scaffold(
            backgroundColor: Color.fromARGB(255, 48, 48, 48),
          );
        }
      },
      future: getPermission(),
    );
  }
}
