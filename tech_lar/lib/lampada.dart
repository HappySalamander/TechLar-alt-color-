import 'package:flutter/material.dart';

const double minWidth = 350;
const double minHeight = 350;

class Lampada extends StatefulWidget {
  @override
  State<Lampada> createState() => _LampadaState();
}

class _LampadaState extends State<Lampada> {
  bool notification = false;
  List<bool> switchesState = [false, false, false, false, false, false, false];
  List<double> luminosidade = [50.0, 50.0, 50.0, 50.0, 50.0, 50.0, 50.0];
  List<String> comodos = ["Quarto", "Closet","Sala", "Cozinha", "Banheiro", "Garagem","Corredor"];

  void adicionarComodo(String novoComodo) {
    setState(() {
      comodos.add(novoComodo);
      switchesState.add(false);
      luminosidade.add(50.0);
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
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        title: Text(
          'Lampadas',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w100,
            fontSize: 25,
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
        elevation: 4,
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
                              Switch(
                                activeColor: Colors.blue[100],
                                value: switchesState[index],
                                onChanged: (bool value) {
                                  setState(() {
                                    switchesState[index] = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Luminosidade",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Slider(
                                value: luminosidade[index],
                                onChanged: (double value) {
                                  setState(() {
                                    luminosidade[index] = value;
                                  });
                                },
                                min: 0,
                                max: 255,
                                divisions: 10,
                                label: luminosidade[index].round().toString(),
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
    );
  }});
}
}