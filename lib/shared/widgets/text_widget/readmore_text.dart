part of '../../../drappers.dart';

class ExpandableText extends ConsumerStatefulWidget {
  const ExpandableText({
    super.key,
    required this.text,
    this.trimLines = 3,
    this.fontWeight,
    this.size,
    this.color,
  }) : assert(text != "");

  final String text;
  final int trimLines;
  final double? size;
  final FontWeight? fontWeight;
  final Color? color;

  @override
  ConsumerState<ExpandableText> createState() => ExpandableTextState();
}

class ExpandableTextState extends ConsumerState<ExpandableText> {
  bool _readMore = true;

  void _onTapLink() {
    setState(() => _readMore = !_readMore);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.text.isEmpty) {
      return const SizedBox();
    }

    final defaultStyle = GoogleFonts.inter(
      fontSize: widget.size,
      fontWeight: widget.fontWeight,
      color: widget.color,
    );

    final link = TextSpan(
      text: _readMore ? "Show More" : "Show Less",
      style: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.primary,
      ),
      recognizer: TapGestureRecognizer()..onTap = _onTapLink,
    );

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        assert(constraints.hasBoundedWidth);
        final double maxWidth = constraints.maxWidth;

        final fullText = TextSpan(text: widget.text, style: defaultStyle);

        final textPainter = TextPainter(
          text: fullText,
          maxLines: widget.trimLines,
          textDirection: TextDirection.ltr,
          ellipsis: '...',
        );

        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);

        if (textPainter.didExceedMaxLines) {
          // Get position where the link will be appended
          final linkPainter = TextPainter(
            text: link,
            maxLines: widget.trimLines,
            textDirection: TextDirection.ltr,
          );
          linkPainter.layout(
            minWidth: constraints.minWidth,
            maxWidth: maxWidth,
          );
          final linkSize = linkPainter.size;

          final pos = textPainter.getPositionForOffset(
            Offset(
              textPainter.size.width - linkSize.width,
              textPainter.size.height,
            ),
          );
          final endIndex =
              textPainter.getOffsetBefore(pos.offset) ?? widget.text.length;

          final visibleText = widget.text.length > endIndex
              ? widget.text.substring(0, endIndex)
              : widget.text;

          final textSpan = TextSpan(
            style: defaultStyle,
            text: _readMore ? visibleText : widget.text,
            children: <TextSpan>[link],
          );

          return Text.rich(
            textSpan,
            softWrap: true,
            overflow: TextOverflow.clip,
          );
        } else {
          return PoppinsText(widget.text, textOverflow: TextOverflow.clip);
        }
      },
    );
  }
}
