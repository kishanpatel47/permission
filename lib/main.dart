import 'package:device_info_plus/device_info_plus.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => permssion(),
  ));
}

class permssion extends StatefulWidget {
  const permssion({Key? key}) : super(key: key);

  @override
  State<permssion> createState() => _permssionState();
}

class _permssionState extends State<permssion> {
  var permissionGranted = true;
  void requestStoragePermission() async {
    PermissionStatus status = await Permission.storage.request();
    if (status.isGranted) {
      // Permission granted, proceed with file operations
    } else if (status.isDenied) {
      // Permission denied
    } else if (status.isPermanentlyDenied) {
      // Permission permanently denied, navigate to app settings
      openAppSettings();
    }
  }

  void checkStoragePermission() async {
    PermissionStatus status = await Permission.storage.status;
    if (status.isGranted) {
      // Permission already granted
    } else {
      requestStoragePermission();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.mic),
                ),
                onTap: () async {
                  PermissionStatus permissionStatus =
                      await Permission.microphone.request();
                  if (permissionStatus == PermissionStatus.granted) {
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(content: Text('this is  permssion success')));
                    print('succress');
                  }

                  if (permissionStatus == PermissionStatus.denied) {
                    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    //     content: Text('this is  permssion is recommanded')));
                    print('low');
                  }

                  if (permissionStatus == PermissionStatus.permanentlyDenied) {
                    openAppSettings();
                  }
                },
                title: Text('MIC permssion'),
              ),
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.camera),
                ),
                onTap: () async {
                  PermissionStatus permissionStatus =
                      await Permission.notification.request();
                  if (permissionStatus == PermissionStatus.granted) {
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(content: Text('this is  permssion success')));
                    print('succress');
                  }

                  if (permissionStatus == PermissionStatus.denied) {
                    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    //     content: Text('this is  permssion is recommanded')));
                    print('low');
                  }

                  if (permissionStatus == PermissionStatus.permanentlyDenied) {
                    openAppSettings();
                  }
                },
                title: Text('Camera permission'),
              ),
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.storage),
                ),
                onTap: () async {
                  var permissionStatus = await Permission.storage.isGranted;
                  print("permssion ${permissionStatus}");
                  // if (permissionStatus == PermissionStatus.granted) {
                  //   // ScaffoldMessenger.of(context).showSnackBar(
                  //   //     SnackBar(content: Text('this is  permssion success')));
                  //   print('succress');
                  // }

                  // if (permissionStatus == PermissionStatus.denied) {
                  //   // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  //   //     content: Text('this is  permssion is recommanded')));
                  //   print('low');
                  // }

                  // if (permissionStatus == PermissionStatus.permanentlyDenied) {
                  //   openAppSettings();
                  // }
                },
                title: Text('storage permssion'),
              ),
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.apps),
                ),
                onTap: () async {
                  Map<Permission, PermissionStatus> status = await [
                    Permission.camera,
                    Permission.microphone,
                    Permission.storage,
                  ].request();
                },
                title: Text('App permssions'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
