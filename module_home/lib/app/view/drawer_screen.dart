import 'package:commons/commons.dart';
import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../domain/controller/pagina_controller.dart';
import '../domain/controller/modulo_controller.dart';
import '../data/model/modulo.dart';

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _moduloController = Modular.get<ModuloController>();
    final _pageController = Modular.get<PaginaController>();

    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Defaults.primaryColor,
                  image: DecorationImage(
                    image: AssetImage(AppImages.drawer_image),
                    fit: BoxFit.contain,
                  ),
                ),
                child: Text('', style: TextStyle(color: Colors.white)),
              ),
            ),
            StreamBuilder<int?>(
              stream: _moduloController.menuIndex,
              builder: (context, menuIndex) {
                return Expanded(
                  child: CustomScrollView(
                    slivers: <Widget> [
                      SliverToBoxAdapter(
                        child: Card(
                          color: menuIndex.data == -1 ? Defaults.primaryColor : Colors.white,
                          child: ListTile(
                            title: Text(
                              "Início",
                              style: TextStyle(
                                color: menuIndex.data == -1 ? Colors.white : Colors.black,
                              ),
                            ),
                            leading: Icon(
                              Icons.home,
                              color: menuIndex.data == -1 ? Colors.white : Colors.grey[600],
                            ),
                            onTap: () {
                              _pageController.setPageIndex(0);
                              _moduloController.setMenuIndex(-1);
                              Navigator.pop(context);
                              Navigator.pushReplacementNamed(context, "/home");
                            },
                          ),
                        ),
                      ),
                      StreamBuilder<List<Modulo>?>(
                        stream: _moduloController.outModulos,
                        builder: (context, moduloList) {
                          if (!moduloList.hasData) return SliverToBoxAdapter(child: Container());
                          return SliverList(
                            delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                    return Card(
                                      color: menuIndex.data == index ? Defaults.primaryColor : Colors.white,
                                      child: ListTile(
                                        title: Text(
                                          moduloList.data![index].nome.toString(),
                                          style: TextStyle(
                                            color: menuIndex.data == index ? Colors.white : Colors.black,
                                          ),
                                        ),
                                        leading: Icon(
                                          Defaults.menuIcons[index],
                                          color: menuIndex.data == index ? Colors.white : Colors.grey[600],
                                        ),
                                        onTap: () {
                                          _moduloController.setMenuIndex(index);
                                          Navigator.pop(context);
                                          Modular.to.navigate("/" + moduloList.data![index].nome.toString());
                                        },
                                      ),
                                    );
                              },
                              childCount: moduloList.data!.length,
                            ),
                          );
                        }
                      )
                    ],
                  )
                );
              }
            ),
          ],
        )
      ),
    );
  }
}