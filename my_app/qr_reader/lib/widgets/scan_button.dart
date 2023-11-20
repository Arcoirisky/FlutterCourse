import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#3D8BEF',
          'Cancelar',
          false,
          ScanMode.QR,
        );

        //const barcodeScanRes = "https://www.tucar.app";
        //const barcodeScanRes = "geo:-33.403764,-70.576064";

        // En caso de que se cancele
        if (barcodeScanRes == "-1") {
          return;
        }

        print(barcodeScanRes);
        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);
        final newScan = await scanListProvider.nuevoScan(barcodeScanRes);
        // Redirige al mapa if tipo === geo o al link if tipo === http
        launchURL(context, newScan);
      },
      child: const Icon(Icons.filter_center_focus_outlined),
    );
  }
}
