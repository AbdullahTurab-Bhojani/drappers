part of '../../drappers.dart';

class ConfirmationModal extends StatelessWidget {
  Future<void> show(BuildContext context) async {
    if (isDialog) {
      return showDialog(
        barrierDismissible: false,
        useRootNavigator: true,
        context: context,
        builder: (_) {
          return Dialog(child: this);
        },
      );
    } else {
      return showModalBottomSheet(
        isDismissible: true,
        isScrollControlled: false,
        useRootNavigator: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (_) {
          return BackdropFilter(
            filter: ImageFilter.blur(
              sigmaY: 4,
              sigmaX: 4,
              tileMode: TileMode.clamp,
            ),
            child: this,
          );
        },
      );
    }
  }

  const ConfirmationModal({
    super.key,
    required this.title,
    required this.desc,
    required this.icon,
    required this.onYes,
    this.yesBtnColor,
    this.yesBtnText,
    this.isDialog = false,
  });

  final String title;
  final String desc;
  final Widget icon;
  final String? yesBtnText;
  final VoidCallback onYes;
  final Color? yesBtnColor;
  final bool isDialog;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: isDialog ? 400 : MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
            bottomLeft: isDialog ? Radius.circular(20) : Radius.zero,
            bottomRight: isDialog ? Radius.circular(20) : Radius.zero,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!isDialog) ...[
              SizedBox(height: 8),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 6,
                  width: 52,
                  decoration: BoxDecoration(
                    color: AppColors.color9CA3AF,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ],

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Center(child: icon),
            ),
            PlusJakartaText(
              title,
              size: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.darkText,
            ),
            SizedBox(height: 4),
            PlusJakartaText(
              desc,
              size: 16,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w400,
              color: AppColors.lightText,
            ),
            SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: AppButton(
                      border: true,
                      onPressed: () {
                        context.pop();
                      },
                      title: 'Cancel',
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: AppButton(
                      onPressed: () {
                        onYes();
                      },
                      title: yesBtnText ?? 'Yes',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
