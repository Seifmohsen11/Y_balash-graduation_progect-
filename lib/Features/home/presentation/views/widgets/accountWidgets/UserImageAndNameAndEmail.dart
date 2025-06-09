import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:y_balash/core/helper/shared_pref_helper.dart';

class UserImageAndNameAndEmail extends StatelessWidget {
  const UserImageAndNameAndEmail({
    super.key,
    required this.image,
    required this.userName,
    required this.email,
    this.onImageChanged,
    this.onImageRemoved,
    this.isLoading = false,
  });
  final String? image;
  final String userName;
  final String email;
  final bool isLoading;

  final void Function(XFile?)? onImageChanged;
  final VoidCallback? onImageRemoved;

  double getProportionalHeight(BuildContext context, double originalHeight) {
    return (originalHeight / 932) * MediaQuery.of(context).size.height;
  }

  double getProportionalWidth(BuildContext context, double originalWidth) {
    return (originalWidth / 430) * MediaQuery.of(context).size.width;
  }

  void _showImageOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text('Choose from Gallery'),
              onTap: () async {
                final picker = ImagePicker();
                final pickedFile =
                    await picker.pickImage(source: ImageSource.gallery);
                Navigator.pop(context);
                if (pickedFile != null) {
                  await SharedPrefHelper.saveUserImage(
                      pickedFile.path); // ✅ حفظ الصورة

                  onImageChanged?.call(pickedFile);
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take a Photo'),
              onTap: () async {
                final picker = ImagePicker();
                final pickedFile =
                    await picker.pickImage(source: ImageSource.camera);
                Navigator.pop(context);
                if (pickedFile != null) {
                  await SharedPrefHelper.saveUserImage(
                      pickedFile.path); // ✅ حفظ الصورة

                  onImageChanged?.call(pickedFile);
                }
              },
            ),
            if (image != null) // Only show delete if image exists
              ListTile(
                leading: const Icon(Icons.delete, color: Colors.red),
                title: const Text('Remove Image'),
                onTap: () async {
                  Navigator.pop(context);
                  await SharedPrefHelper.removeUserImage(); // ✅ حذف الصورة

                  onImageRemoved?.call();
                },
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: getProportionalWidth(context, 18)),
        GestureDetector(
            onTap: () => _showImageOptions(context),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: getProportionalHeight(context, 76),
                  width: getProportionalHeight(context, 76),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: .5),
                    borderRadius: BorderRadius.circular(
                      getProportionalWidth(context, 56),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        getProportionalWidth(context, 56)),
                    child: image != null
                        ? Image.network(
                            image!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'assets/images/user.png',
                                fit: BoxFit.cover,
                              );
                            },
                          )
                        : Image.asset(
                            'assets/images/user.png',
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                if (isLoading)
                  Container(
                    height: getProportionalHeight(context, 76),
                    width: getProportionalHeight(context, 76),
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(
                        getProportionalWidth(context, 56),
                      ),
                    ),
                    child: Center(
                        child: SpinKitThreeBounce(
                      color: Colors.blue,
                      size: 18.h,
                    )),
                  ),
              ],
            )),
        SizedBox(width: getProportionalWidth(context, 18)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName,
              style: TextStyle(
                  color: const Color(0xff003366),
                  fontSize: getProportionalWidth(context, 12),
                  fontWeight: FontWeight.bold),
            ),
            Text(
              email,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: getProportionalWidth(context, 12),
                  fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    );
  }
}
