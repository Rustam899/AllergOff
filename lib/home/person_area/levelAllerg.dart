import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:allerg_off_prototype/domain/UserLocal.dart';
import 'package:path_provider/path_provider.dart';

class AllergLevels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Мои непереносимости'),
        backgroundColor: Color.alphaBlend(
            Color.fromRGBO(56, 183, 143, 1), Color.fromRGBO(58, 167, 177, 1)),
      ),
      body: Column(
        children: <Widget>[
          Flexible(fit: FlexFit.tight, child: Level(0)),
          Flexible(fit: FlexFit.tight, child: Level(1)),
          Flexible(fit: FlexFit.tight, child: Level(2)),
          Flexible(fit: FlexFit.tight, child: Level(3)),
          Flexible(fit: FlexFit.tight, child: Level(4)),
          Flexible(fit: FlexFit.tight, child: Level(5)),
        ],
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

class Level extends StatelessWidget {
  var ind;
  Level(int i) {
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
  var zero= 0;
  var levels;
  String str='';
  double _currentSliderValue = 0;
  String _localFileContent='';
  _SlydState(indr) {
    ind = indr;
  }
  @override
  void initState() {
    super.initState();
    this.read();
  }

  void write(String str) async{
    await this._writeTextToLocalFile(str);
  }
  void read () async{
    await this._readTextFromLocalFile();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: list[(ind == 0)
                      ? Provider.of<UserLocal>(context, listen: true).fructose.round()
                      : (ind == 1)
                          ? Provider.of<UserLocal>(context, listen: true)
                              .lactose
                              .round()
                          : (ind == 2)
                              ? Provider.of<UserLocal>(context, listen: true)
                                  .histamine
                                  .round()
                              : (ind == 3)
                                  ? Provider.of<UserLocal>(context, listen: true)
                                      .sorbitol
                                      .round()
                                  : (ind == 4)
                                      ? Provider.of<UserLocal>(context, listen: true)
                                          .gluten
                                          .round()
                                      : (ind == 5)
                                          ? Provider.of<UserLocal>(context,
                                                  listen: true)
                                              .salcylicAcid
                                              .round()
                                          : DoNothingAction()],
                  inactiveTrackColor: list[(ind == 0)
                      ? Provider.of<UserLocal>(context, listen: true).fructose.round()
                      : (ind == 1)
                          ? Provider.of<UserLocal>(context, listen: true)
                              .lactose
                              .round()
                          : (ind == 2)
                              ? Provider.of<UserLocal>(context, listen: true)
                                  .histamine
                                  .round()
                              : (ind == 3)
                                  ? Provider.of<UserLocal>(context, listen: true)
                                      .sorbitol
                                      .round()
                                  : (ind == 4)
                                      ? Provider.of<UserLocal>(context, listen: true)
                                          .gluten
                                          .round()
                                      : (ind == 5)
                                          ? Provider.of<UserLocal>(context,
                                                  listen: true)
                                              .salcylicAcid
                                              .round()
                                          : DoNothingAction()],
                  trackShape: RoundSliderTrackShape(),
                  trackHeight: 22.0,
                  rangeTrackShape: RoundedRectRangeSliderTrackShape(),
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                  thumbColor: Colors.white,
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 22.0),
                  activeTickMarkColor: list[(ind == 0)
                      ? Provider.of<UserLocal>(context, listen: true).fructose.round()
                      : (ind == 1)
                          ? Provider.of<UserLocal>(context, listen: true)
                              .lactose
                              .round()
                          : (ind == 2)
                              ? Provider.of<UserLocal>(context, listen: true)
                                  .histamine
                                  .round()
                              : (ind == 3)
                                  ? Provider.of<UserLocal>(context, listen: true)
                                      .sorbitol
                                      .round()
                                  : (ind == 4)
                                      ? Provider.of<UserLocal>(context, listen: true)
                                          .gluten
                                          .round()
                                      : (ind == 5)
                                          ? Provider.of<UserLocal>(context,
                                                  listen: true)
                                              .salcylicAcid
                                              .round()
                                          : DoNothingAction()],
                  inactiveTickMarkColor: list[(ind == 0)
                      ? Provider.of<UserLocal>(context, listen: true).fructose.round()
                      : (ind == 1)
                          ? Provider.of<UserLocal>(context, listen: true)
                              .lactose
                              .round()
                          : (ind == 2)
                              ? Provider.of<UserLocal>(context, listen: true)
                                  .histamine
                                  .round()
                              : (ind == 3)
                                  ? Provider.of<UserLocal>(context, listen: true)
                                      .sorbitol
                                      .round()
                                  : (ind == 4)
                                      ? Provider.of<UserLocal>(context, listen: true)
                                          .gluten
                                          .round()
                                      : (ind == 5)
                                          ? Provider.of<UserLocal>(context,
                                                  listen: true)
                                              .salcylicAcid
                                              .round()
                                          : DoNothingAction()],
                ),
                child: Slider(
                    value: (ind == 0)
                        ? (Provider.of<UserLocal>(context, listen: true).fructose)
                        : (ind == 1)
                            ? Provider.of<UserLocal>(context, listen: true).lactose
                            : (ind == 2)
                                ? Provider.of<UserLocal>(context, listen: true)
                                    .histamine
                                : (ind == 3)
                                    ? Provider.of<UserLocal>(context, listen: true)
                                        .sorbitol
                                    : (ind == 4)
                                        ? Provider.of<UserLocal>(context, listen: true)
                                            .gluten
                                        : (ind == 5)
                                            ? Provider.of<UserLocal>(context,
                                                    listen: true)
                                                .salcylicAcid
                                            : DoNothingAction(),
                    min: 0,
                    max: 4,
                    divisions: 4,
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                        (ind == 0)
                            ? Provider.of<UserLocal>(context, listen: false)
                                .setFructose = value
                            : (ind == 1)
                                ? Provider.of<UserLocal>(context, listen: false)
                                    .setLactose = value
                                : (ind == 2)
                                    ? Provider.of<UserLocal>(context, listen: false)
                                        .setHistamine = value
                                    : (ind == 3)
                                        ? Provider.of<UserLocal>(context, listen: false)
                                            .setSorbitol = value
                                        : (ind == 4)
                                            ? Provider.of<UserLocal>(context,
                                                    listen: false)
                                                .setGluten = value
                                            : (ind == 5)
                                                ? Provider.of<UserLocal>(context,
                                                        listen: false)
                                                    .setSalcylicAcid = value
                                                : DoNothingAction();
                        str=Provider.of<UserLocal>(context, listen: false).fructose.toString()+" "+
                        Provider.of<UserLocal>(context, listen: false).lactose.toString()+" "+
                        Provider.of<UserLocal>(context, listen: false).histamine.toString()+" "+
                        Provider.of<UserLocal>(context, listen: false).sorbitol.toString()+" "+
                        Provider.of<UserLocal>(context, listen: false).gluten.toString()+" "+
                        Provider.of<UserLocal>(context, listen: false).salcylicAcid.toString();
                        this._writeTextToLocalFile(str);
                      });
                       
                        
                    }
                ),
              ),
            );
  }

  Future<String> get _getLocalPath async {
    final directory =await getApplicationDocumentsDirectory();
    return directory.path;
  }
  
  Future<File> get _getLocalFile async {
    final path = await _getLocalPath;
    return File('$path/uevels.txt');
  }

  Future<File> _writeTextToLocalFile(String text) async {
    final file = await _getLocalFile;
    return file.writeAsString(text);
  }

  Future _readTextFromLocalFile() async{
    String content;
    try{
      final file = await _getLocalFile;
      content= await file.readAsString();
    }catch(e)
    {
      content= 'Error loading loacl file: $e';
    }

    setState(() {
      this._localFileContent=content;
    });
  }
  /* Future _readTextFromLocalFile() async {
    String content;
    try {
      final file = await _getLocalFile;
      content = await file.readAsString();
    } catch(e){
      content='Error loading local file: $e';
    }
    setState(() {
      this.text=content;
    });
  } */
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
