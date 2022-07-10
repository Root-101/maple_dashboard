import 'package:clean_core/clean_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maple_dashboard/maple_exporter.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:tuple/tuple.dart';

class MapleDrawer extends StatelessWidget {
  final _controller = SidebarXController(selectedIndex: -1, extended: true);

  ///relacion indice/pagina, necesario para los indices del SidebarXController
  late final List<Tuple2<int, AppMainModule>> _list;

  ///singleton para si se usa en varios lugares mantenda la misma instancia
  MapleDrawer._() {
    //mapeo indice/pagina de todos los `mainModules`
    //primer indice en cero
    int index = 0;
    //mapeo la lista de modulos a su correspondiente indice
    _list = AppModuleRegister.mainModules()
        .map(
          (e) => Tuple2(index++, e), //aumento el indice en cada iteracion
        )
        .toList();
  }

  static final instance = MapleDrawer._();

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      items: [
        ..._list.map(
          (module) => SidebarXItem(
            icon: module.item2.moduleIcon,
            label: module.item2.moduleName,
            onTap: () {
              ///para cerrar el drawer
              Get.back();

              //solucion 1
              /*Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            module.moduleHomePage),
                    (route) => route.isFirst);*/

              //solucion 2
              /*navigator!.popUntil((route) => route.isFirst);
                ///navegar hacia la proxima pagina
                Get.to(
                  module.moduleHomePage,

                  ///quitado el preventDuplicates para si hay en un mismo modulo varios items que sean del mismo tipo pero tal vez con parametros diferentes.);
                  preventDuplicates: false,
                  transition: Transition.rightToLeft,
                );*/

              //solucion 3
              if (_controller.selectedIndex != module.item1) {
                _controller.selectIndex(module.item1);

                Get.offUntil(
                  GetPageRoute(
                    page: () => module.item2.moduleHomePage,
                    transition: Transition.rightToLeft,
                  ),
                  (route) => route.isFirst,
                );
              }
            },
          ),
        ),
        const SidebarXItem(
          icon: Icons.search,
          label: 'Search',
        ),
        const SidebarXItem(
          icon: Icons.people,
          label: 'People',
        ),
        const SidebarXItem(
          icon: Icons.favorite,
          label: 'Favorite',
        ),
      ],
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        textStyle: const TextStyle(color: Colors.white),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          border: Border.all(color: canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [accentCanvasColor, canvasColor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: canvasColor,
        ),
        margin: EdgeInsets.only(right: 10),
      ),
      //footerDivider: divider,
      footerBuilder: (context, extended) {
        return SafeArea(
          child: Container(
            height: 100,
            color: Colors.pink,
          ),
        );
      },
      headerBuilder: (context, extended) {
        return GestureDetector(
          onTap: () {
            //cierra el drawer
            Get.back();
            if (_controller.selectedIndex != -1) {
              //seteo el index a -1, deselecciono all
              _controller.selectIndex(-1);
              //push por named porque se declara como page global al principo
              Get.offAllNamed(MapleDashboardScreen.ROUTE_NAME);
            }
          },
          child: SafeArea(
            child: SizedBox(
              height: Get.height / 6.5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('assets/app_icon.png'),
              ),
            ),
          ),
        );
      },
    );
  }
}

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
const actionColor = Color(0xFF5F5FA7);

final divider = Divider(color: white.withOpacity(0.3), height: 1);
