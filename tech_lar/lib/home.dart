import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tech_lar/janela.dart';
import 'package:tech_lar/lampada.dart';
import 'package:tech_lar/porta.dart';
import 'package:tech_lar/addComodo.dart';

const double minWidth = 350;
const double minHeight = 350;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool notification = false;
  bool _janela = false;
  bool _lampada = false;
  bool _porta = false;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => addComodo()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < minWidth ||
          constraints.maxHeight < minHeight) {
        return Center(
          child: Text(
            'Tela muito pequena para exibir o conteúdo',
            style: TextStyle(fontSize: 20),
          ),
        );
      } else {
        return Scaffold(
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(200, 19, 124, 199),
                      //roxo - 53/51/205
                      //azulClaro - 19/124/190
                      //roxoClaro - 111/99/243
                      //cinza - 71/72/72
                      //azulMaisClaro - 110/237/218
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Olá, Fulano!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )),
                ListTile(
                  title: Text('Perfil'),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Configurações'),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Ajuda'),
                  onTap: () {},
                )
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: true,
            title: Text(
              'Tech-Lar',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w100,
                letterSpacing: 0,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  (notification == false)
                      ? Icons.notifications_sharp
                      : Icons.notifications_off,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () {
                  setState(() {
                    notification = !notification;
                  });
                },
              ),
            ],
            centerTitle: true,
            elevation: 1,
          ),
          body: Center(
            child: ListView(children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(45, 100, 45, 0),
                    child: ExpansionTile(
                      collapsedShape: const ContinuousRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      shape: const ContinuousRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      collapsedBackgroundColor: Color.fromARGB(255, 19, 124, 199),
                      backgroundColor: Colors.blue,
                      collapsedIconColor: Colors.white,
                      iconColor: Colors.white,
                      title: Text("Controle Geral",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      children: [
                        //Janelas
                        SwitchListTile(
                          title: Text("Janelas",
                              style: TextStyle(
                                color: Colors.white,
                              )),
                          activeColor: Colors.blue[100],
                          value: _janela,
                          onChanged: (bool value) {
                            setState(() {
                              _janela = value;
                            });
                          },
                        ),
                        //Lampadas
                        SwitchListTile(
                          title: Text("Luzes",
                              style: TextStyle(color: Colors.white)),
                          activeColor: Colors.blue[100],
                          value: _lampada,
                          onChanged: (bool value) {
                            setState(() {
                              _lampada = value;
                            });
                          },
                        ),
                        //Portas
                        SwitchListTile(
                          title: Text("Portas",
                              style: TextStyle(color: Colors.white)),
                          activeColor: Colors.blue[100],
                          value: _porta,
                          onChanged: (bool value) {
                            setState(() {
                              _porta = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 85),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(70),
                              color: Color.fromARGB(255, 19, 124, 199),
                            ),
                            child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Janela()),
                                );
                              },
                              icon: Icon(
                                  size: 45,
                                  color: Colors.white,
                                  Icons.window_outlined),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Container(
                              width: 130,
                              height: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(70),
                                color: Color.fromARGB(255, 19, 124, 199),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Lampada()),
                                  );
                                },
                                icon: Icon(
                                    size: 45,
                                    color: Colors.white,
                                    Icons.lightbulb),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Container(
                              width: 130,
                              height: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(70),
                                color: Color.fromARGB(255, 19, 124, 199),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Porta()),
                                  );
                                },
                                icon: Icon(
                                    size: 45,
                                    color: Colors.white,
                                    Icons.door_back_door),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Menu',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'Adicionar Cômodo',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Color.fromARGB(255, 19, 124, 199),
            onTap: _onItemTapped,
          ),
        );
      }
    });
  }
}
