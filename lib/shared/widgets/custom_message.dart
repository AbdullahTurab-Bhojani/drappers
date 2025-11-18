part of '../../drappers.dart';

Future<bool?> $showMessage(String message, {bool isError = false}) {
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: kIsWeb ? ToastGravity.TOP : ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: !isError ? AppColors.primary : Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
    webBgColor: !isError ? "#606C38" : '#E57373',
  );
}

void $hidleLoading(BuildContext context) {
  context.pop();
}

Future<void> $showLoading(BuildContext context, {String? message}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    // useRootNavigator: false,
    builder: (context) {
      return Dialog(
        child: Container(
          height: 150,
          width: 100,
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation(AppColors.primary),
              ),
              SizedBox(height: 16),
              PlusJakartaText(
                message ?? 'Processing...',
                size: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.darkText,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    },
  );
}
