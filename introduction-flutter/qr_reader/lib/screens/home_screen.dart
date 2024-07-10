import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';
import 'package:qr_reader/screens/screens.dart';
import 'package:qr_reader/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
        actions: [
          IconButton(
            onPressed: () {
              final scanListProvider =
                  Provider.of<ScanListProvider>(context, listen: false);
              scanListProvider.borrarPorTipo(scanListProvider.tipoSeleccionado);
            },
            icon: const Icon(Icons.delete_forever_outlined),
          ),
        ],
      ),
      body: _HomeScreenBody(),
      bottomNavigationBar: const CustomNavigationbar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomeScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtener el selectedMenuOpt del provider
    final uiProvider = Provider.of<UiProvider>(context);
    // Cambiar para mostrar la página respectiva
    final currentIndex = uiProvider.selectedMenuOpt;

    // final tempScan = ScanModel(valor: "http://www.google.com");
    // DBProvider.db.nuevoScan(tempScan);
    // DBProvider.db.getScanById(2).then((scan) => print(scan!.valor));
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);
    // Usar el currentIndex para mostrar la página respectiva
    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScansPorTipo('geo');
        return const MapsScreen();
      case 1:
        scanListProvider.cargarScansPorTipo('http');
        return const DirectionsScreen();
      default:
        return const MapsScreen();
    }
  }
}
