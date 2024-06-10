import 'package:flutter/material.dart';

const double minWidth = 350;
const double minHeight = 350; 

class Janela extends StatefulWidget {
  @override
  State<Janela> createState() => _JanelaState();
}

class _JanelaState extends State<Janela> {
  bool notification = false;
  bool _on = false;
  List<String> comodos = ["Sala de Estar", "Quarto Casal", "Cozinha"];
  List<bool> switchesState = [false, false, false];
  void adicionarComodo(String nomeComodo) {
    setState(() {
      comodos.add(nomeComodo);
      switchesState.add(false);
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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 30),
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Janelas',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w100,
            fontSize: 25,
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
        elevation: 4,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 19, 124, 199),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Todas as Janelas",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 35),
                    child: Switch(
                      activeColor: Colors.blue[100],
                      value: _on,
                      onChanged: (bool value) {
                        setState(() {
                          _on = value;
                          switchesState =
                              List<bool>.filled(comodos.length, value);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: comodos.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: double.infinity,
                    height: 85,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 19, 124, 199),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: ListTile(
                        title: Text(
                          comodos[index],
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        trailing: Switch(
                          activeColor: Colors.blue[100],
                          value: switchesState[index],
                          onChanged: (bool value) {
                            setState(() {
                              switchesState[index] = value;
                            });
                          },
                        ),
                      ),
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
                      title: Text(
                        "Novo Cômodo"),
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
                backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 19, 124, 199),),
              ),
            ),
          ),
        ],
      ),
    );
    }}
    );
  }
}
