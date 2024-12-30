import 'package:flowery_rider/core/resources/color_manager.dart';
import 'package:flowery_rider/core/resources/style_manager.dart';
import 'package:flowery_rider/core/widgets/permission_service.dart';
import 'package:flutter/material.dart';
class AddImage {
  static Future<dynamic> showCupertinoModalPopupAddImage(BuildContext context,
      {required Function gallery, required Function camera}) async {
    return showModalBottomSheet(

      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: InkWell(
                  onTap: () async {
                    var permission = await isPermissionStorageGranted();
                    if (permission == false) return;
                    gallery();
                    Navigator.pop(context);
                  },
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Icon(Icons.photo_library, size: 30,color: ColorManager.pink),
                      SizedBox(height: 5),
                      Text('عرض الصور',style: getBoldStyle(color: ColorManager.grey)),
                    ],
                  ),
                ),
              ),
              Container(
                width: 1,
                height: 50,
                color: ColorManager.pink.withOpacity(.5),
              ),
              Expanded(
                child: InkWell(
                  onTap: () async {
                    var permission = await isPermissionCameraGranted();
                    if (permission == false) return;
                    camera();

                    Navigator.pop(context);
                  },
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera_alt, size: 30,color: ColorManager.pink,),
                      SizedBox(height: 5),
                      Text('الكاميرا',style: getBoldStyle(color: ColorManager.grey),),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}










