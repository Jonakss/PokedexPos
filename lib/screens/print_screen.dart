// import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:sunmi_printer/sunmi_printer.dart';

class Print extends StatefulWidget {
  Print({Key? key}) : super(key: key);

  @override
  _PrintState createState() => _PrintState();
}

class _PrintState extends State<Print> {
  TextEditingController textController = TextEditingController();

  String? _printerStatus = '';
  @override
  void initState() {
    super.initState();

    _bindingPrinter().then((binded) async => {
          if (binded!)
            {
              _getPrinterStatus(),
              _getPrinterMode(),
            }
        });
  }

  Future<bool?> _bindingPrinter() async {
    final bool? result = await SunmiPrinter.bindingPrinter();
    return result;
  }

  Future<void> _getPrinterStatus() async {
    final String? result = await SunmiPrinter.getPrinterStatus();
    setState(() {
      _printerStatus = result;
    });
  }

  Future<void> _getPrinterMode() async {
    final String? result = await SunmiPrinter.getPrinterMode();
    print('printer mode: $result');
  }

  // Future<void> _printLabel(Uint8List img) async {
  //   if (_printerStatus == 'Works normally') {
  //     print('printing..!');
  //     try {
  //       await SunmiPrinter.startLabelPrint();
  //       await SunmiPrinter.setAlignment(0);
  //       await SunmiPrinter.lineWrap(1);
  //       await SunmiPrinter.printImage(img);
  //       await SunmiPrinter.lineWrap(1);
  //       await SunmiPrinter.exitLabelPrint();
  //     } catch (e) {
  //       print('error');
  //     }
  //   }
  // }

  Future<void> _printText(String text) async {
    //if (_printerStatus == 'Works normally') {
    print('printing..!');
    try {
      await SunmiPrinter.setAlignment(0);
      await SunmiPrinter.printText(text);
      await SunmiPrinter.lineWrap(1);
    } catch (e) {
      print('error');
    }
    //}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Text(
                'Printer Status: $_printerStatus',
              ),
              IconButton(
                  onPressed: () {
                    _printText("012345678901234567890123456789");
                  },
                  icon: Icon(Icons.print)),
            ],
          ),
        ),
      ),
    );
  }
}
