import 'dart:io';
import 'package:flutter/material.dart';

class UploadPhoto extends StatelessWidget {
  final GestureTapCallback press;
  final File image;
  final bool enable;
  final String photURL;
  const UploadPhoto({
    Key key,
    this.press,
    this.image,
    this.enable,
    this.photURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            foregroundColor: Colors.blue,
            backgroundColor: Colors.transparent,
            radius: 90.0,
            child: ClipOval(
              child: (image != null)
                  ? Image.file(
                      image,
                      fit: BoxFit.cover,
                      width: 150.0,
                      height: 150.0,
                    )
                  : !(photURL == null)
                      ? Image.network(
                          photURL,
                          fit: BoxFit.cover,
                          width: 150.0,
                          height: 150.0,
                        )
                      : Image.asset(
                          "assets/user.png",
                          fit: BoxFit.cover,
                          width: 150.0,
                          height: 150.0,
                        ),
            ),
          ),
          Positioned(
            top: 115,
            right: 15,
            child: Offstage(
              offstage: enable,
              child: GestureDetector(
                onTap: press,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle,
                    border: Border.all(width: 1.5, color: Colors.white),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.camera,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
