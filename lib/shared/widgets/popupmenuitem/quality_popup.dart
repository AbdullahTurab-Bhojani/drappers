import 'package:flutter/material.dart';
import '../../../drappers.dart'; // PoppinsText, AppColors

class QualityPopup extends StatelessWidget {
  final String selectedQuality;
  final Function(String) onSelected;

  const QualityPopup({
    super.key,
    required this.selectedQuality,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final qualities = ['Auto', '4k', '1440p', '1080p'];

    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: Center(
          child: Container(
            width: 320,
            padding: EdgeInsets.only(top: 16, left: 24, right: 24),
            decoration: BoxDecoration(
              color: AppColors.dRegular,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _popupHeader(context, "Quality"),
                Divider(),
                ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: qualities.length,
                  itemBuilder: (_, index) {
                    final text = qualities[index];
                    final isSelected = selectedQuality == text;

                    return GestureDetector(
                      onTap: () {
                        onSelected(text);
                        Navigator.pop(context);
                      },
                      child: _popupItem(context, text, isSelected),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _popupHeader(BuildContext context, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PoppinsText(
          context,
          title,
          fontSize: PoppinsFontSizeVariant.size28,
          fontWeight: PoppinsFontWeightVariant.regular,
          color: AppColors.wDark,
        ),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.close, color: AppColors.white),
        ),
      ],
    );
  }

  Widget _popupItem(BuildContext context, String text, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.popselectcolor19193F : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          if (isSelected) Icon(Icons.check, color: AppColors.white, size: 18),
          if (isSelected) SizedBox(width: 10),
          PoppinsText(
            context,
            text,
            fontSize: PoppinsFontSizeVariant.size28,
            fontWeight: PoppinsFontWeightVariant.regular,
            color: AppColors.wDark,
          ),
        ],
      ),
    );
  }
}
