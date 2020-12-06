import 'package:flutter/material.dart';
import 'dart:math';


class AllergLevels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Мои непереносимости'),
          backgroundColor: Color.alphaBlend(Color.fromRGBO(56, 183, 143, 1),
                  Color.fromRGBO(58, 167, 177, 1)),
        ),
        body: Column(
          children: <Widget>[
            Flexible(fit: FlexFit.tight, child: Widj(0)),
            Flexible(fit: FlexFit.tight, child: Widj(1)),
            Flexible(fit: FlexFit.tight, child: Widj(2)),
            Flexible(fit: FlexFit.tight, child: Widj(3)),
            Flexible(fit: FlexFit.tight, child: Widj(4)),
            Flexible(fit: FlexFit.tight, child: Widj(5)),
          ],
        ),
      ),
    );
  }
}

var list = [
  Color.fromRGBO(83, 220, 80, 1),
  Color.fromRGBO(173, 204, 34, 1),
  Color.fromRGBO(220, 139, 80, 1),
  Color.fromRGBO(233, 103, 75, 1),
  Color.fromRGBO(220, 88, 80, 1)
];

var levels = [0, 0, 0, 0, 0, 0];

class Widj extends StatelessWidget {
  var ind;
  Widj(int i) {
    ind = i;
  }
  var names = [
    'Фруктоза (Ф)',
    'Лактоза (Л)',
    'Гистамин (Ги)',
    'Сорбитол (Со)',
    'Глютен (Гл)',
    'Сальциловая Кислота (СК)'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        height: 30,
        width: double.infinity,
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(left: 10),
        child: Text(names[ind], style: TextStyle(fontSize: 15)),
      ),
      Slyd(ind),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            5,
            (index) => Text(
              "$index",
              style: TextStyle(color: list[index]),
            ),
          ),
        ),
      ),
    ]);
  }
}

class Slyd extends StatefulWidget {
  int indr;
  Slyd(ind) {
    indr = ind;
  }

  @override
  _SlydState createState() => _SlydState(indr);
}

class _SlydState extends State<Slyd> {
  int ind;
  double _currentSliderValue = 0;
  _SlydState(indr) {
    ind = indr;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          activeTrackColor: list[_currentSliderValue.round()],
          inactiveTrackColor: list[_currentSliderValue.round()],
          trackShape: RoundSliderTrackShape(),
          trackHeight: 22.0,
          rangeTrackShape: RoundedRectRangeSliderTrackShape(),
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
          thumbColor: Colors.white,
          overlayShape: RoundSliderOverlayShape(overlayRadius: 22.0),
          activeTickMarkColor: list[_currentSliderValue.round()],
          inactiveTickMarkColor: list[_currentSliderValue.round()],
        ),
        child: Slider(
            value: _currentSliderValue,
            min: 0,
            max: 4,
            divisions: 4,
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
                levels[ind] = value.round();
              });
            }),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////

class RoundSliderTrackShape extends SliderTrackShape {
  const RoundSliderTrackShape({this.disabledThumbGapWidth = 2.0});
  final double disabledThumbGapWidth;

  @override
  Rect getPreferredRect({
    RenderBox parentBox,
    Offset offset = Offset.zero,
    SliderThemeData sliderTheme,
    bool isEnabled,
    bool isDiscrete,
  }) {
    final double overlayWidth =
        sliderTheme.overlayShape.getPreferredSize(isEnabled, isDiscrete).width;
    final double trackHeight = sliderTheme.trackHeight;
    assert(overlayWidth >= 0);
    assert(trackHeight >= 0);
    assert(parentBox.size.width >= overlayWidth);
    assert(parentBox.size.height >= trackHeight);

    final double trackLeft = offset.dx + overlayWidth / 2;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width - overlayWidth;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    RenderBox parentBox,
    SliderThemeData sliderTheme,
    Animation<double> enableAnimation,
    TextDirection textDirection,
    Offset thumbCenter,
    bool isDiscrete,
    bool isEnabled,
  }) {
    if (sliderTheme.trackHeight == 0) {
      return;
    }

    final ColorTween activeTrackColorTween = ColorTween(
        begin: sliderTheme.disabledActiveTrackColor,
        end: sliderTheme.activeTrackColor);
    final ColorTween inactiveTrackColorTween = ColorTween(
        begin: sliderTheme.disabledInactiveTrackColor,
        end: sliderTheme.inactiveTrackColor);
    final Paint activePaint = Paint()
      ..color = activeTrackColorTween.evaluate(enableAnimation);
    final Paint inactivePaint = Paint()
      ..color = inactiveTrackColorTween.evaluate(enableAnimation);
    Paint leftTrackPaint;
    Paint rightTrackPaint;
    switch (textDirection) {
      case TextDirection.ltr:
        leftTrackPaint = activePaint;
        rightTrackPaint = inactivePaint;
        break;
      case TextDirection.rtl:
        leftTrackPaint = inactivePaint;
        rightTrackPaint = activePaint;
        break;
    }

    double horizontalAdjustment = 0.0;
    if (!isEnabled) {
      final double disabledThumbRadius =
          sliderTheme.thumbShape.getPreferredSize(false, isDiscrete).width /
              2.0;
      final double gap = disabledThumbGapWidth * (1.0 - enableAnimation.value);
      horizontalAdjustment = disabledThumbRadius + gap;
    }

    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );
    final Rect leftTrackSegment = Rect.fromLTRB(trackRect.left, trackRect.top,
        thumbCenter.dx - horizontalAdjustment, trackRect.bottom);

    double m = 11.0;

    // Left Arc
    context.canvas.drawArc(
        Rect.fromCircle(
            center: Offset(trackRect.left, trackRect.top + m), radius: m),
        -pi * 3 / 2, // -270 degrees
        pi, // 180 degrees
        false,
        trackRect.left - thumbCenter.dx == 0.0
            ? rightTrackPaint
            : leftTrackPaint);

    // Right Arc
    context.canvas.drawArc(
        Rect.fromCircle(
            center: Offset(trackRect.right, trackRect.top + m), radius: m),
        -pi / 2, // -90 degrees
        pi, // 180 degrees
        false,
        trackRect.right - thumbCenter.dx == 0.0
            ? leftTrackPaint
            : rightTrackPaint);

    context.canvas.drawRect(leftTrackSegment, leftTrackPaint);
    final Rect rightTrackSegment = Rect.fromLTRB(
        thumbCenter.dx + horizontalAdjustment,
        trackRect.top,
        trackRect.right,
        trackRect.bottom);
    context.canvas.drawRect(rightTrackSegment, rightTrackPaint);
  }
}
