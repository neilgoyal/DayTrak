import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './Component11.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home_Page extends StatelessWidget {
  Home_Page({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xde000000),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(28.0, 758.0),
            child:
                // Adobe XD layer: 'Icon feather-home' (group)
                SizedBox(
              width: 40.0,
              height: 40.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 39.7, 39.5),
                    size: Size(39.7, 39.5),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: SvgPicture.string(
                      _svg_ghvbf6,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(15.3, 24.5, 9.0, 15.0),
                    size: Size(39.7, 39.5),
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: SvgPicture.string(
                      _svg_bwtdob,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(122.0, 764.0),
            child: SvgPicture.string(
              _svg_5ixeyc,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(269.0, 37.0),
            child: Text(
              'Day',
              style: TextStyle(
                fontFamily: 'Protipo Compact',
                fontSize: 40,
                color: const Color(0xff9b8fb1),
                fontWeight: FontWeight.w100,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(16.0, 193.0),
            child: SizedBox(
              width: 338.0,
              height: 287.0,
              child: Component11(),
            ),
          ),
          Transform.translate(
            offset: Offset(22.0, 40.0),
            child: Text(
              'March 13',
              style: TextStyle(
                fontFamily: 'Protipo Compact',
                fontSize: 40,
                color: const Color(0xff9b8fb1),
                fontWeight: FontWeight.w100,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(16.0, 148.0),
            child: Text(
              'Upcoming Tasks',
              style: TextStyle(
                fontFamily: 'Protipo Compact',
                fontSize: 27,
                color: const Color(0xfff0f1f0),
                fontWeight: FontWeight.w100,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(64.0, 218.0),
            child: SizedBox(
              width: 247.0,
              height: 193.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 12.0, 6.0, 6.0),
                    size: Size(247.0, 193.1),
                    pinLeft: true,
                    pinTop: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        color: const Color(0xfff0f1f0),
                        border: Border.all(
                            width: 1.0, color: const Color(0x00000000)),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(16.5, 0.0, 230.5, 25.0),
                    size: Size(247.0, 193.1),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    fixedHeight: true,
                    child: SingleChildScrollView(
                        child: Text(
                      'Meet Andrew ',
                      style: TextStyle(
                        fontFamily: 'Protipo Compact',
                        fontSize: 25,
                        color: const Color(0xfff0f1f0),
                        fontWeight: FontWeight.w100,
                      ),
                      textAlign: TextAlign.left,
                    )),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 70.0, 6.0, 6.0),
                    size: Size(247.0, 193.1),
                    pinLeft: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        color: const Color(0xfff0f1f0),
                        border: Border.all(
                            width: 1.0, color: const Color(0x00000000)),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(16.5, 56.0, 216.5, 25.0),
                    size: Size(247.0, 193.1),
                    pinLeft: true,
                    pinRight: true,
                    fixedHeight: true,
                    child: SingleChildScrollView(
                        child: Text(
                      'Meet Ganesh',
                      style: TextStyle(
                        fontFamily: 'Protipo Compact',
                        fontSize: 25,
                        color: const Color(0xfff0f1f0),
                        fontWeight: FontWeight.w100,
                      ),
                      textAlign: TextAlign.left,
                    )),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 123.0, 6.0, 6.0),
                    size: Size(247.0, 193.1),
                    pinLeft: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        color: const Color(0xfff0f1f0),
                        border: Border.all(
                            width: 1.0, color: const Color(0x00000000)),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(16.5, 112.1, 166.0, 25.0),
                    size: Size(247.0, 193.1),
                    pinLeft: true,
                    pinRight: true,
                    fixedHeight: true,
                    child: SingleChildScrollView(
                        child: Text(
                      'Meet Neil',
                      style: TextStyle(
                        fontFamily: 'Protipo Compact',
                        fontSize: 25,
                        color: const Color(0xfff0f1f0),
                        fontWeight: FontWeight.w100,
                      ),
                      textAlign: TextAlign.left,
                    )),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 180.0, 6.0, 6.0),
                    size: Size(247.0, 193.1),
                    pinLeft: true,
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        color: const Color(0xfff0f1f0),
                        border: Border.all(
                            width: 1.0, color: const Color(0x00000000)),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(16.5, 168.1, 202.0, 25.0),
                    size: Size(247.0, 193.1),
                    pinLeft: true,
                    pinRight: true,
                    pinBottom: true,
                    fixedHeight: true,
                    child: SingleChildScrollView(
                        child: Text(
                      'Meet Obama',
                      style: TextStyle(
                        fontFamily: 'Protipo Compact',
                        fontSize: 25,
                        color: const Color(0xfff0f1f0),
                        fontWeight: FontWeight.w100,
                      ),
                      textAlign: TextAlign.left,
                    )),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(28.0, 527.0),
            child: Text(
              'Add a task ',
              style: TextStyle(
                fontFamily: 'Protipo Compact',
                fontSize: 27,
                color: const Color(0xfff0f1f0),
                fontWeight: FontWeight.w100,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(22.0, 574.0),
            child: Container(
              width: 332.0,
              height: 105.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(36.0),
                gradient: LinearGradient(
                  begin: Alignment(-1.0, -1.0),
                  end: Alignment(1.0, 0.74),
                  colors: [const Color(0xbfd270aa), const Color(0xbfd99175)],
                  stops: [0.0, 1.0],
                ),
                border: Border.all(width: 1.0, color: const Color(0xbf707070)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(71.5, 647.5),
            child: SvgPicture.string(
              _svg_m966y,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(22.0, 83.0),
            child: Text(
              'Friday  ',
              style: TextStyle(
                fontFamily: 'Protipo Compact',
                fontSize: 27,
                color: const Color(0xffbadfca),
                fontWeight: FontWeight.w100,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(165.0, 241.0),
            child: Text(
              '@Monday 1:30 ',
              style: TextStyle(
                fontFamily: 'Protipo Compact',
                fontSize: 17,
                color: const Color(0xff101829),
                fontWeight: FontWeight.w100,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(165.0, 300.0),
            child: Text(
              '@Monday 1:30 ',
              style: TextStyle(
                fontFamily: 'Protipo Compact',
                fontSize: 17,
                color: const Color(0xff101829),
                fontWeight: FontWeight.w100,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(165.0, 353.0),
            child: Text(
              '@Monday 1:30 ',
              style: TextStyle(
                fontFamily: 'Protipo Compact',
                fontSize: 17,
                color: const Color(0xff101829),
                fontWeight: FontWeight.w100,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(165.0, 412.0),
            child: Text(
              '@Monday 1:30 ',
              style: TextStyle(
                fontFamily: 'Protipo Compact',
                fontSize: 17,
                color: const Color(0xff101829),
                fontWeight: FontWeight.w100,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(334.0, 37.0),
            child: Text(
              '1',
              style: TextStyle(
                fontFamily: 'Protipo Compact',
                fontSize: 40,
                color: const Color(0xff9b8fb1),
                fontWeight: FontWeight.w100,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, 44.0),
            child: SvgPicture.string(
              _svg_banqsj,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(93.0, 83.0),
            child: Text(
              '25',
              style: TextStyle(
                fontFamily: 'Protipo Compact',
                fontSize: 27,
                color: const Color(0xffbadfca),
                fontWeight: FontWeight.w100,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(120.0, 83.0),
            child: Text(
              '˚c',
              style: TextStyle(
                fontFamily: 'Protipo Compact',
                fontSize: 27,
                color: const Color(0xffbadfca),
                fontWeight: FontWeight.w100,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_ghvbf6 =
    '<svg viewBox="4.5 3.0 39.7 39.5" ><path transform="translate(0.0, 0.0)" d="M 4.5 16.82814407348633 L 24.32932662963867 3.000000238418579 L 44.15865325927734 16.82814407348633 L 44.15865325927734 38.55808258056641 C 44.15865325927734 40.74010467529297 42.185791015625 42.50898361206055 39.75214385986328 42.50898361206055 L 8.906518936157227 42.50898361206055 C 6.472866058349609 42.50898361206055 4.500001430511475 40.74010467529297 4.5 38.55808258056641 L 4.5 16.82814407348633 Z" fill="#6ce6e2" fill-opacity="0.83" stroke="#f7f7f7" stroke-width="3" stroke-opacity="0.83" stroke-linecap="round" stroke-linejoin="round" /></svg>';
const String _svg_bwtdob =
    '<svg viewBox="19.8 27.5 9.0 15.0" ><path transform="translate(6.33, 9.51)" d="M 13.5 33 L 13.5 18 L 22.5 18 L 22.5 33" fill="#6ce6e2" fill-opacity="0.83" stroke="#f7f7f7" stroke-width="3" stroke-opacity="0.83" stroke-linecap="round" stroke-linejoin="round" /></svg>';
const String _svg_5ixeyc =
    '<svg viewBox="122.0 764.0 213.0 34.3" ><path transform="translate(122.0, 763.63)" d="M 5.625 25.875 L 1.125 25.875 C 0.503679633140564 25.875 -1.192092895507812e-07 26.3786792755127 0 27 L 0 31.5 C 0 32.12131881713867 0.5036795735359192 32.625 1.124999761581421 32.625 L 5.625 32.625 C 6.246320247650146 32.625 6.75 32.12131881713867 6.75 31.5 L 6.75 27 C 6.75 26.3786792755127 6.246320247650146 25.875 5.625 25.875 Z M 5.625 3.375 L 1.125 3.375 C 0.503679633140564 3.375 -1.192092895507812e-07 3.878679752349854 0 4.5 L 0 9 C 0 9.621320724487305 0.5036795735359192 10.125 1.124999761581421 10.125 L 5.625 10.125 C 6.246320247650146 10.125 6.75 9.621320724487305 6.75 9 L 6.75 4.5 C 6.75 3.878679752349854 6.246320247650146 3.375 5.625 3.375 Z M 5.625 14.625 L 1.125 14.625 C 0.503679633140564 14.625 -1.192092895507812e-07 15.12868022918701 0 15.75 L 0 20.25 C 0 20.8713207244873 0.5036795735359192 21.375 1.124999761581421 21.375 L 5.625 21.375 C 6.246320247650146 21.375 6.75 20.8713207244873 6.75 20.25 L 6.75 15.75 C 6.75 15.1286792755127 6.246320247650146 14.625 5.625 14.625 Z M 34.875 27 L 12.375 27 C 11.7536792755127 27 11.25 27.5036792755127 11.25 28.125 L 11.25 30.375 C 11.25 30.9963207244873 11.7536792755127 31.5 12.375 31.5 L 34.875 31.5 C 35.49631881713867 31.5 36 30.9963207244873 36 30.375 L 36 28.125 C 36 27.5036792755127 35.49631881713867 27 34.875 27 Z M 34.875 4.5 L 12.375 4.5 C 11.7536792755127 4.5 11.25 5.003679752349854 11.25 5.625 L 11.25 7.875 C 11.25 8.496320724487305 11.7536792755127 9 12.375 9 L 34.875 9 C 35.49631881713867 9 36 8.496320724487305 36 7.875 L 36 5.625 C 36 5.003679752349854 35.49631881713867 4.5 34.875 4.5 Z M 34.875 15.75 L 12.375 15.75 C 11.7536792755127 15.75 11.25 16.2536792755127 11.25 16.875 L 11.25 19.125 C 11.25 19.7463207244873 11.7536792755127 20.25 12.375 20.25 L 34.875 20.25 C 35.49631881713867 20.25 36 19.7463207244873 36 19.125 L 36 16.875 C 36 16.2536792755127 35.49631881713867 15.75 34.875 15.75 Z" fill="#f6f6f4" fill-opacity="0.83" stroke="none" stroke-width="1" stroke-opacity="0.83" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(209.38, 761.0)" d="M 20.0947265625 3 C 10.64899063110352 3 2.999999523162842 10.67199993133545 2.999999523162842 20.12500190734863 C 2.999999523162842 29.57799911499023 10.64899063110352 37.25 20.0947265625 37.25 C 29.55757331848145 37.25 37.22367477416992 29.57800102233887 37.22367477416992 20.12500190734863 C 37.22367477416992 10.67199897766113 29.55757331848145 3 20.0947265625 3 Z M 20.11183738708496 33.82500076293945 C 12.54840469360352 33.82500076293945 6.422367572784424 27.69425201416016 6.422367572784424 20.12500190734863 C 6.422367572784424 12.55574989318848 12.54840469360352 6.425000190734863 20.11183738708496 6.425000190734863 C 27.67527198791504 6.425000190734863 33.80130767822266 12.55575084686279 33.80130767822266 20.12500190734863 C 33.80130767822266 27.69425201416016 27.67527198791504 33.82500076293945 20.11183738708496 33.82500076293945 Z M 20.96743011474609 11.5625 L 18.40065574645996 11.5625 L 18.40065574645996 21.83750152587891 L 27.38437080383301 27.23187446594238 L 28.66775703430176 25.12550163269043 L 20.96743011474609 20.55312538146973 L 20.96743011474609 11.5625 Z" fill="#f6f6f6" fill-opacity="0.83" stroke="none" stroke-width="1" stroke-opacity="0.83" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(296.45, 760.5)" d="M 35.73959732055664 20.99921989440918 C 35.73959732055664 19.19461822509766 36.90121459960938 17.65641021728516 38.55054092407227 17.03768920898438 C 38.11604309082031 15.27605152130127 37.39778900146484 13.62613105773926 36.44898223876953 12.13088893890381 C 35.88147354125977 12.37150096893311 35.27849578857422 12.50040149688721 34.66665267944336 12.50040149688721 C 33.54936981201172 12.50040149688721 32.43208312988281 12.08792209625244 31.57195091247559 11.26295948028564 C 30.25071907043457 9.982552528381348 29.95809745788574 8.10060977935791 30.66748237609863 6.536622047424316 C 29.13343620300293 5.617134094238281 27.42204284667969 4.921073913574219 25.61310577392578 4.5 C 24.9835262298584 6.08976936340332 23.38740921020508 7.224089622497559 21.5252685546875 7.224089622497559 C 19.66312980651855 7.224089622497559 18.0670108795166 6.08976936340332 17.43742942810059 4.5 C 15.61962890625 4.921073913574219 13.9171028137207 5.617134094238281 12.37418556213379 6.536623001098633 C 13.09244155883789 8.09201717376709 12.79095077514648 9.982552528381348 11.46971893310547 11.26296234130859 C 10.61845397949219 12.08792304992676 9.492305755615234 12.50040245056152 8.375020980834961 12.50040245056152 C 7.763176441192627 12.50040245056152 7.160198211669922 12.38009548187256 6.592689037322998 12.13088989257812 C 5.652752876281738 13.63472366333008 4.934499263763428 15.28464508056641 4.500000476837158 17.0462818145752 C 6.140456199645996 17.65641021728516 7.310943126678467 19.19461822509766 7.310943126678467 21.0078125 C 7.310943126678467 22.81241416931152 6.149322986602783 24.35062408447266 4.508867740631104 24.9693431854248 C 4.943366527557373 26.73097801208496 5.661620140075684 28.38089942932129 6.610424518585205 29.87614059448242 C 7.177933216094971 29.63552665710449 7.780911922454834 29.51522064208984 8.383890151977539 29.51522064208984 C 9.50117301940918 29.51522064208984 10.61845779418945 29.92770004272461 11.47858810424805 30.75266265869141 C 12.79095077514648 32.02447509765625 13.09244155883789 33.91501235961914 12.38305473327637 35.47040557861328 C 13.92597007751465 36.38990020751953 15.63736534118652 37.08595657348633 17.44629859924316 37.50703048706055 C 18.07588005065918 35.91726303100586 19.66312980651855 34.79153442382812 21.5252685546875 34.79153442382812 C 23.38740921020508 34.79153442382812 24.97466087341309 35.91726303100586 25.60424041748047 37.50703048706055 C 27.42204284667969 37.08595657348633 29.12456893920898 36.38990020751953 30.66748237609863 35.47040557861328 C 29.95809745788574 33.91501235961914 30.25958824157715 32.03307342529297 31.57195091247559 30.75266265869141 C 32.4232177734375 29.92770195007324 33.54050064086914 29.51522064208984 34.66665267944336 29.51522064208984 C 35.26963043212891 29.51522064208984 35.88147735595703 29.63552665710449 36.44011688232422 29.87614059448242 C 37.38892364501953 28.38089752197266 38.10717391967773 26.72238349914551 38.54167175292969 24.9693431854248 C 36.91008377075195 24.35062408447266 35.73959732055664 22.81241416931152 35.73959732055664 20.99921989440918 Z M 21.60507583618164 27.86530113220215 C 17.67685127258301 27.86530113220215 14.5112133026123 24.7802906036377 14.5112133026123 20.99062728881836 C 14.5112133026123 17.20096397399902 17.67685127258301 14.11595249176025 21.60507583618164 14.11595249176025 C 25.53330039978027 14.11595249176025 28.69893836975098 17.20096397399902 28.69893836975098 20.99062728881836 C 28.69893836975098 24.7802906036377 25.53330039978027 27.86530113220215 21.60507583618164 27.86530113220215 Z" fill="#f5f4f4" fill-opacity="0.83" stroke="none" stroke-width="1" stroke-opacity="0.83" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_m966y =
    '<svg viewBox="71.5 647.5 233.0 1.0" ><path transform="translate(71.5, 647.5)" d="M 0 0 L 233 0" fill="none" fill-opacity="0.75" stroke="#eeefee" stroke-width="4" stroke-opacity="0.75" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_banqsj =
    '<svg viewBox="0.0 44.0 375.0 1.0" ><path  d="M 375 44 L 0 44 L 375 44 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path  d="M 375 44 L 0 44 L 375 44 Z" fill="#000000" fill-opacity="0.83" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
