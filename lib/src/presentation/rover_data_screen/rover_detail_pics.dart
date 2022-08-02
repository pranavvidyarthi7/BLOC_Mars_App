import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mars_rover_app/src/data/models/rover_detail_model.dart';
import 'package:mars_rover_app/src/data/repositories/rover_data_repository.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class RoverDetailPicsBody extends StatefulWidget {
  final String roverName;
  const RoverDetailPicsBody({Key? key, required this.roverName})
      : super(key: key);

  @override
  _RoverDetailPicsBodyState createState() => _RoverDetailPicsBodyState();
}

class _RoverDetailPicsBodyState extends State<RoverDetailPicsBody> {
  final List<String> _cameraList = const [
    'FHAZ',
    'RHAZ',
    'MAST',
    'CHEMCAM',
    'MAHLI',
    'MARDI',
    'NAVCAM',
    'PANCAM',
    'MINITES'
  ];
  late List<String> _solList;
  late List<DropdownMenuItem<String>> _camMenuList, _solMenuList;
  late String _selectedSol, _selectedCam;
  Future<List<String>> getSolData() async =>
      await Provider.of<RoverDataRepository>(context).getRoverPicUrls(
          roverName: widget.roverName, sol: _selectedSol, camera: _selectedCam);

  @override
  void initState() {
    _solList = roverDetailMap[widget.roverName]!.sols.keys.toList();
    _selectedSol = _solList[0];
    _selectedCam = _cameraList[0];
    _solMenuList = _solList.map((value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(
          value,
        ),
      );
    }).toList();
    _camMenuList = _cameraList.map((value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(
          value,
        ),
      );
    }).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('BUILD PICS BODY');
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<String>>(
          future: getSolData(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Column(mainAxisSize: MainAxisSize.max, children: [
                  Flexible(
                    flex: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          child: DropDownBtnRow(
                            title: 'Sol',
                            onChanged: (s) {},
                            dropDownItems: _solMenuList,
                            selectedVal: _selectedSol,
                          ),
                        ),
                        Flexible(
                          child: DropDownBtnRow(
                            title: 'Camera',
                            onChanged: (s) {},
                            selectedVal: _selectedCam,
                            dropDownItems: _camMenuList,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 0,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: AutoSizeText(
                        'Earth Date: ${roverDetailMap[widget.roverName]!.sols[_selectedSol]}',
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.start,
                        maxLines: 2,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: constraints.maxWidth ~/ 250,
                      ),
                      itemCount: 5,
                      itemBuilder: (_, i) => Shimmer.fromColors(
                        baseColor: Colors.white,
                        highlightColor: Colors.black54,
                        child: const Card(
                          margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  )
                ]);
              case ConnectionState.done:
                if (snapshot.hasData &&
                    snapshot.data != null &&
                    snapshot.data!.isNotEmpty) {
                  return Column(mainAxisSize: MainAxisSize.max, children: [
                    Flexible(
                      flex: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            child: DropDownBtnRow(
                              title: 'Sol',
                              onChanged: (String? newValue) {
                                if (newValue != _selectedSol) {
                                  setState(() {
                                    _selectedSol = newValue!;
                                  });
                                }
                              },
                              dropDownItems: _solMenuList,
                              selectedVal: _selectedSol,
                            ),
                          ),
                          Flexible(
                            child: DropDownBtnRow(
                              title: 'Camera',
                              onChanged: (newValue) {
                                if (newValue != _selectedCam) {
                                  setState(() {
                                    _selectedCam = newValue!;
                                  });
                                }
                              },
                              selectedVal: _selectedCam,
                              dropDownItems: _camMenuList,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 0,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: AutoSizeText(
                          'Earth Date: ${roverDetailMap[widget.roverName]!.sols[_selectedSol]}',
                          style: const TextStyle(color: Colors.white),
                          textAlign: TextAlign.start,
                          maxLines: 2,
                        ),
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: constraints.maxWidth ~/ 250,
                        ),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, i) => Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: CachedNetworkImage(
                            imageUrl: snapshot.data![i],
                            fit: BoxFit.cover,
                            placeholder: (_, url) => Shimmer.fromColors(
                              baseColor: Colors.white,
                              highlightColor: Colors.black54,
                              child: const Card(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ]);
                } else {
                  return Column(mainAxisSize: MainAxisSize.max, children: [
                    Flexible(
                      flex: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            child: DropDownBtnRow(
                              title: 'Sol',
                              onChanged: (String? newValue) {
                                if (newValue != _selectedSol) {
                                  setState(() {
                                    _selectedSol = newValue!;
                                  });
                                }
                              },
                              dropDownItems: _solMenuList,
                              selectedVal: _selectedSol,
                            ),
                          ),
                          Flexible(
                            child: DropDownBtnRow(
                              title: 'Camera',
                              onChanged: (newValue) {
                                if (newValue != _selectedCam) {
                                  setState(() {
                                    _selectedCam = newValue!;
                                  });
                                }
                              },
                              selectedVal: _selectedCam,
                              dropDownItems: _camMenuList,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 0,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: AutoSizeText(
                          'Earth Date: ${roverDetailMap[widget.roverName]!.sols[_selectedSol]}',
                          style: const TextStyle(color: Colors.white),
                          textAlign: TextAlign.start,
                          maxLines: 2,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          'No Images Found',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ]);
                }
              default:
                if (snapshot.hasError) {
                  return Column(mainAxisSize: MainAxisSize.max, children: [
                    Flexible(
                      flex: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            child: DropDownBtnRow(
                              title: 'Sol',
                              onChanged: (String? newValue) {
                                if (newValue != _selectedSol) {
                                  setState(() {
                                    _selectedSol = newValue!;
                                  });
                                }
                              },
                              dropDownItems: _solMenuList,
                              selectedVal: _selectedSol,
                            ),
                          ),
                          Flexible(
                            child: DropDownBtnRow(
                              title: 'Camera',
                              onChanged: (newValue) {
                                if (newValue != _selectedCam) {
                                  setState(() {
                                    _selectedCam = newValue!;
                                  });
                                }
                              },
                              selectedVal: _selectedCam,
                              dropDownItems: _camMenuList,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 0,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: AutoSizeText(
                          'Earth Date: ${roverDetailMap[widget.roverName]!.sols[_selectedSol]}',
                          style: const TextStyle(color: Colors.white),
                          textAlign: TextAlign.start,
                          maxLines: 2,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: TextButton(
                          child: const Text(
                            'Retry',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            setState(() {});
                          },
                        ),
                      ),
                    )
                  ]);
                } else if (snapshot.hasData &&
                    snapshot.data != null &&
                    snapshot.data!.isNotEmpty) {
                  return Column(mainAxisSize: MainAxisSize.max, children: [
                    Flexible(
                      flex: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            child: DropDownBtnRow(
                              title: 'Sol',
                              onChanged: (String? newValue) {
                                if (newValue != _selectedSol) {
                                  setState(() {
                                    _selectedSol = newValue!;
                                  });
                                }
                              },
                              dropDownItems: _solMenuList,
                              selectedVal: _selectedSol,
                            ),
                          ),
                          Flexible(
                            child: DropDownBtnRow(
                              title: 'Camera',
                              onChanged: (newValue) {
                                if (newValue != _selectedCam) {
                                  setState(() {
                                    _selectedCam = newValue!;
                                  });
                                }
                              },
                              selectedVal: _selectedCam,
                              dropDownItems: _camMenuList,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 0,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: AutoSizeText(
                          'Earth Date: ${roverDetailMap[widget.roverName]!.sols[_selectedSol]}',
                          style: const TextStyle(color: Colors.white),
                          textAlign: TextAlign.start,
                          maxLines: 2,
                        ),
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: constraints.maxWidth ~/ 250,
                        ),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, i) => Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: CachedNetworkImage(
                            imageUrl: snapshot.data![i],
                            fit: BoxFit.cover,
                            placeholder: (_, url) => Shimmer.fromColors(
                              baseColor: Colors.white,
                              highlightColor: Colors.black54,
                              child: const Card(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ]);
                } else {
                  return Column(mainAxisSize: MainAxisSize.max, children: [
                    Flexible(
                      flex: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            child: DropDownBtnRow(
                              title: 'Sol',
                              onChanged: (String? newValue) {
                                if (newValue != _selectedSol) {
                                  setState(() {
                                    _selectedSol = newValue!;
                                  });
                                }
                              },
                              dropDownItems: _solMenuList,
                              selectedVal: _selectedSol,
                            ),
                          ),
                          Flexible(
                            child: DropDownBtnRow(
                              title: 'Camera',
                              onChanged: (newValue) {
                                if (newValue != _selectedCam) {
                                  setState(() {
                                    _selectedCam = newValue!;
                                  });
                                }
                              },
                              selectedVal: _selectedCam,
                              dropDownItems: _camMenuList,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 0,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: AutoSizeText(
                          'Earth Date: ${roverDetailMap[widget.roverName]!.sols[_selectedSol]}',
                          style: const TextStyle(color: Colors.white),
                          textAlign: TextAlign.start,
                          maxLines: 2,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          'No Images Found',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ]);
                }
            }
          },
        ),
      );
    });
  }
}

class DropDownBtnRow extends StatelessWidget {
  final List<DropdownMenuItem<String>> dropDownItems;
  final Function(String?)? onChanged;
  final String selectedVal, title;
  const DropDownBtnRow(
      {Key? key,
      required this.dropDownItems,
      required this.selectedVal,
      required this.title,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
          child: AutoSizeText(
            'Select $title: ',
            style: const TextStyle(color: Colors.white),
          ),
        ),
        Flexible(
          child: DropdownButton<String>(
            dropdownColor: Colors.black54,
            value: selectedVal,
            underline: const SizedBox(),
            icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
            elevation: 16,
            style: const TextStyle(color: Colors.white),
            onChanged: onChanged,
            items: dropDownItems,
          ),
        )
      ],
    );
  }
}
