import 'package:flutter/material.dart';

class InputDataType {
    static const String textBox = 'Text Box';
    static const String colorSelector = 'Color Selector';
    static const String textSelector = 'Text Selector';
    static const String oneUseStopwatch = 'One Use Stopwatch';
    static const String checkbox = 'Checkbox';
    static const String gridButton = 'Grid Button';
    static const String counter = 'Counter';
}

class InputData {
    final String id;
    final String type;
    final List<String> selection;
    final List<Color> colorSelection;
    final List<List<int>> grid;
    
    InputData({
        this.id,
        this.type,
        this.selection,
        this.colorSelection,
        this.grid,
    });
    
}

List<InputData> deepspace2019 = [
    InputData(
        id: 'Team Number',
        type: InputDataType.textBox,
    ),
    InputData(
        id: 'Driver Station Color',
        type: InputDataType.colorSelector,
        colorSelection: [
            Colors.red,
            Colors.blue,
        ],
    ),
    InputData(
        id: 'Driver Station Alignment',
        type: InputDataType.textSelector,
        selection: [
            'Left', 
            'Middle', 
            'Right',
        ],
    ),
    InputData(
        id: 'Cargo Placement',
        type: InputDataType.gridButton,
        selection: [
            'Take cargo',
            'Place cargo',
        ],
        grid: [
            [111, 000, 211, 000, 000, 212, 000, 311],
            [121, 000, 221, 000, 000, 222, 000, 321],
            [131, 000, 231, 000, 000, 232, 000, 331],
            [000, 000, 000, 241, 242, 000, 000, 000],
            [132, 000, 000, 000, 000, 000, 000, 332],
            [122, 000, 000, 000, 000, 000, 000, 322],
            [112, 000, 000, 000, 000, 000, 000, 312],
        ],
    ),
    InputData(
        id: 'Hatch Placement',
        type: InputDataType.gridButton,
        selection: [
            'Take hatch',
            'Place hatch',
        ],
        grid: [
            [111, 000, 211, 000, 000, 212, 000, 311],
            [121, 000, 221, 000, 000, 222, 000, 321],
            [131, 000, 231, 000, 000, 232, 000, 331],
            [000, 000, 000, 241, 242, 000, 000, 000],
            [132, 000, 000, 000, 000, 000, 000, 332],
            [122, 000, 000, 000, 000, 000, 000, 322],
            [112, 000, 000, 000, 000, 000, 000, 312],
        ],
    ),
    InputData(
        id: 'Hab Climb Time',
        type: InputDataType.oneUseStopwatch,
        selection: [
            'Start the counter', 
            'End the counter', 
            '%counter',
        ],
    ),
    InputData(
        id: 'Hab Start Level',
        type: InputDataType.textSelector,
        selection: [
            '0', 
            '1',
            '2',
            '3',
        ],
    ),
    InputData(
        id: 'Hab End Level',
        type: InputDataType.textSelector,
        selection: [
            '0',
            '1',
            '2',
            '3',
        ],
    ),
    InputData(
        id: 'Robot Count',
        type: InputDataType.textSelector,
        selection: [
            '1',
            '2',
            '3',
        ],
    ),
    InputData(
        id: 'Robot Type',
        type: InputDataType.textSelector,
        selection: [
            'Teleop', 
            'Autonomous',
            'Mixed',
        ],
    ),
    InputData(
        id: 'Autonomous Starts With',
        type: InputDataType.textSelector,
        selection: [
            'Cargo', 
            'Hatch', 
            'Mixed'
        ],
    ),
    InputData(
        id: 'Crossing The Line',
        type: InputDataType.checkbox,
    ),
    InputData(
        id: 'Defense Notes',
        type: InputDataType.textBox,
    ),
    InputData(
        id: 'Notes',
        type: InputDataType.textBox,
    ),
];

List<InputData> infiniterecharge2020 = [
    InputData(
        id: 'Team Number',
        type: InputDataType.textBox,
    ),
    InputData(
        id: 'Ball Count of Lower Hole / Teleop',
        type: InputDataType.counter,
    ),
    InputData(
        id: 'Ball Count of Upper Hole / Teleop',
        type: InputDataType.counter,
    ),
    InputData(
        id: 'Ball Count of Small Hole / Teleop',
        type: InputDataType.counter,
    ),
    InputData(
        id: 'Ball Count of Lower Hole / Autonomous',
        type: InputDataType.counter,
    ),
    InputData(
        id: 'Ball Count of Upper Hole / Autonomous',
        type: InputDataType.counter,
    ),
    InputData(
        id: 'Ball Count of Small Hole / Autonomous',
        type: InputDataType.counter,
    ),
    InputData(
        id: 'Staying in Balance',
        type: InputDataType.checkbox,
    ),
    InputData(
        id: 'Can Adjust Balance',
        type: InputDataType.checkbox,
    ),
    InputData(
        id: 'Moved Away From Line',
        type: InputDataType.checkbox,
    ),
    InputData(
        id: 'Did Trench Run',
        type: InputDataType.checkbox,
    ),
    InputData(
        id: 'Bar Climb Time',
        type: InputDataType.oneUseStopwatch,
        selection: [
            'Start the counter',
            'End the counter',
            '%counter',
        ],
    ),
    InputData(
        id: 'Control Panel',
        type: InputDataType.textSelector,
        selection: [
            'None',
            '3 lap',
            '3 lap with precise alignment'
        ],
    ),
    InputData(
        id: 'Notes',
        type: InputDataType.textBox,
    ),
];