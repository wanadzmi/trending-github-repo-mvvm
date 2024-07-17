import 'package:flutter/material.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;

  const ExpandableTextWidget({super.key, required this.text});

  @override
  ExpandableTextWidgetState createState() => ExpandableTextWidgetState();
}

class ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  bool isExpanded = false;
  final int maxLines = 3;
  late String displayText;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.bodySmall!.copyWith(
          fontWeight: FontWeight.normal,
        );

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        TextPainter textPainter = TextPainter(
          text: TextSpan(text: widget.text, style: textStyle),
          maxLines: maxLines,
          textDirection: TextDirection.ltr,
        );
        textPainter.layout(maxWidth: constraints.maxWidth);

        bool isTextOverflowing = textPainter.didExceedMaxLines;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.text,
              style: textStyle,
              maxLines: isExpanded ? null : maxLines,
              overflow:
                  isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            Visibility(
              visible: isTextOverflowing,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Text(
                  isExpanded ? 'Show less' : 'Show more',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.normal,
                        color: Colors.blue,
                      ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
