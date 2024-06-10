import 'package:flutter/material.dart';
import 'package:tech_lar/home.dart';

  const double minWidth = 350;
  const double minHeight = 350;

class addComodo extends StatefulWidget {
  @override
  State<addComodo> createState() => _addComodo();
}

class _addComodo extends State<addComodo> {
  bool notification = false;
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyHomePage(
                      title: 'Home Page',
                    )));
      }
    });
  }
  List<String> comodos = ["Quarto", "Sala", "Cozinha", "Banheiro", "Garagem", "Corredor"];

  void adicionarComodo(String novoComodo) {
    setState(() {
      comodos.add(novoComodo);
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
                  color: Color.fromARGB(255, 19, 124, 199),
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: comodos.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 19, 124, 199),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                comodos[index],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    String novoComodo = "";
                    return AlertDialog(
                      title: Text("Novo Cômodo"),
                      content: TextField(
                        onChanged: (value) {
                          novoComodo = value;
                        },
                        decoration: InputDecoration(
                          hintText: "Nome do cômodo",
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Cancelar"),
                        ),
                        TextButton(
                          onPressed: () {
                            adicionarComodo(novoComodo);
                            Navigator.of(context).pop();
                          },
                          child: Text("Adicionar"),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.add, color: Colors.white),
              label: Text("Novo Cômodo", style: TextStyle(color: Colors.white)),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 19, 124, 199),),
              ),
            ),
          ),
        ],
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
  }});
}
}