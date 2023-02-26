import 'package:aksacademy/common/failure.dart';
import 'package:aksacademy/common/state_enum.dart';
import 'package:aksacademy/domain/usecase/do_upload.dart';
import 'package:flutter/material.dart';

class UploadProvider extends ChangeNotifier {

  String? _doUploadData;
  String? get doUploadData => _doUploadData;

  RequestState _doUploadState = RequestState.Empty;
  RequestState get doUploadState => _doUploadState;

  RequestFailure? _doUploadFailure;
  RequestFailure? get doUploadFailure => _doUploadFailure;
  UploadProvider({
    required this.doUpload,
  });
  void resetState(){
    _doUploadFailure=null;
    _doUploadState=RequestState.Empty;
    _doUploadData=null;
  }
  final DoUpload doUpload;

  Future<void> doUploadAction(String imagePath) async {
    _doUploadState = RequestState.Loading;
    notifyListeners();

    final result = await doUpload.execute(imagePath);
    result.fold(
      (failure) {
        _doUploadState = RequestState.Error;
        _doUploadFailure = failure as RequestFailure?;
        notifyListeners();
      },
      (result) {
        _doUploadState = RequestState.Loaded;
        _doUploadData = result;
        notifyListeners();
      },
    );
  }
}
