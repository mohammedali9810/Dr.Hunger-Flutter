import 'package:DrHunger/widgets/raw_materials/veg_drop_down.dart';
import 'package:flutter/material.dart';

import 'FruitDropDown.dart';
import 'custom_text_filed.dart';

class MainRawMaterials extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'VEGETABLES',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 95,right: 95),
                child: Divider(
                  color: Colors.red,
                  height: 4,
                  thickness: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8, bottom: 8, left: 16, right: 16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          VegDropDown(),
                          VegDropDown(),
                          VegDropDown(),
                          VegDropDown(),
                          VegDropDown(),
                          VegDropDown(),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          CustomTextField(
                            getValue: (value) {
                              String val = value;
                            },
                          ),
                          CustomTextField(
                            getValue: (value) {
                              String val = value;
                            },
                          ),
                          CustomTextField(
                            getValue: (value) {
                              String val = value;
                            },
                          ),
                          CustomTextField(
                            getValue: (value) {
                              String val = value;
                            },
                          ),
                          CustomTextField(
                            getValue: (value) {
                              String val = value;
                            },
                          ),
                          CustomTextField(
                            getValue: (value) {
                              String val = value;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'FRUITS',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 110,right: 110),
                child: Divider(
                  color: Colors.red,
                  height: 4,
                  thickness: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:8,bottom: 8,left: 16,right: 16 ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          FruitsDropDown(),
                          FruitsDropDown(),
                          FruitsDropDown(),
                          FruitsDropDown(),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          CustomTextField(
                            getValue: (value) {
                              String val = value;
                            },
                          ),
                          CustomTextField(
                            getValue: (value) {
                              String val = value;
                            },
                          ),
                          CustomTextField(
                            getValue: (value) {
                              String val = value;
                            },
                          ),
                          CustomTextField(
                            getValue: (value) {
                              String val = value;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
