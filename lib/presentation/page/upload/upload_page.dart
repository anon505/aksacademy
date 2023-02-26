import 'dart:io';

import 'package:aksacademy/common/colors.dart';
import 'package:aksacademy/common/image_picker_helper.dart';
import 'package:aksacademy/common/state_enum.dart';
import 'package:aksacademy/presentation/component/common/app_navbar.dart';
import 'package:aksacademy/presentation/component/common/button.dart';
import 'package:aksacademy/presentation/component/common/modal_bottom_sheet.dart';
import 'package:aksacademy/presentation/component/common/no_internet_widget.dart';
import 'package:aksacademy/presentation/provider/upload_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UploadPage extends StatefulWidget {
  static const routeName = 'upload_page';
  const UploadPage({
    Key? key,
  }) : super(key: key);
  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final ImagePicker _picker = ImagePicker();
  String? imagePath;
  BuildContext? dialogContext;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNavBar(
        foreColor: BaseColors.neutral900,
        leadingView: InkWell(
          child: const Icon(Iconsax.arrow_left),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: 'Upload File',
      ),
      body: Consumer<UploadProvider>(builder: (context, provider, child) {
        if (dialogContext != null) {
          Navigator.pop(dialogContext!);
          dialogContext = null;
        }
        if (ModalRoute.of(context)!.isCurrent) {
          if (provider.doUploadState == RequestState.Loaded) {
            if (provider.doUploadData != null) {
              Fluttertoast.showToast(msg: provider.doUploadData!);
              Future.microtask(() =>
              Provider.of<UploadProvider>(context, listen: false)
                ..resetState());


            }
          } else if (provider.doUploadState == RequestState.Loading) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    dialogContext = context;
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  });
            });
            // return const CircularProgressIndicator();
          } else if (provider.doUploadState == RequestState.Error) {
            ModalBottomSheet modalBottomSheet = ModalBottomSheet();
            modalBottomSheet.showModal(
                context,
                provider.doUploadFailure!.code == -1
                    ? const NoInternetWidget()
                    : NoInternetWidget(
                  title: 'Error ${provider.doUploadFailure!.code}',
                  subTitle: provider.doUploadFailure!.message,
                ));
            Future.microtask(() =>
            Provider.of<UploadProvider>(context, listen: false)
              ..resetState());
          }
        }
        return Column(
          children: [
            InkWell(
              onTap: () async {
                // Pick an image
                final XFile? image = await _picker.pickImage(
                    source: ImageSource.gallery,
                    imageQuality: 50, // <- Reduce Image quality
                    maxHeight: 500, // <- reduce the image size
                    maxWidth: 500);
                String? path;
                if (image != null) {
                  path = await getImagePath(image);
                }
                setState(() {
                  imagePath = path;
                });
              },
              child: Container(
                width: 58,
                height: 58,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: BaseColors.neutral200),
                child: imagePath == null
                    ? Center(
                        child: Icon(
                        Iconsax.profile_circle5,
                        size: 58,
                        color: BaseColors.neutral500,
                      ))
                    : ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(29)),
                        child: Image.file(
                          File(imagePath!),
                          fit: BoxFit.cover,
                          width: 58,
                          height: 58,
                        ),
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
              child: Button(
                listener: () {
                  if(imagePath!=null) {
                    Future.microtask(() => provider.doUploadAction(imagePath!));
                  }
                },
                buttonType: ButtonType.solid,
                backgroundColor: BaseColors.neutral900,
                captionColor: BaseColors.white,
                caption: 'Upload',
              ),
            )
          ],
        );
      }),
    );
  }
}
