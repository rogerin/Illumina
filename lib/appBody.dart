import 'package:flutter/material.dart';
import 'package:flutter_application_illumina/screens/agenda/Agenda.dart';
import 'package:flutter_application_illumina/screens/metodosEstudos.dart';
import 'package:flutter_application_illumina/screens/perfil/perfil.dart';
import 'package:flutter_application_illumina/screens/tarefa/tarefas.dart';

class AppBody extends StatefulWidget {
  const AppBody({super.key});

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  int currentIndex = 0;
  final screens = [
    const MetodosEstudos(),
    const Tarefas(),
    const Agenda(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Color.fromRGBO(255, 234, 0, 1)),
        ),
      drawer: Drawer(
        
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 207, 155, 0)
              ),
              accountEmail: Text("NeymarJR@gmail.com"),
              accountName: Text("Cai Cai"),
              currentAccountPicture: CircleAvatar(
                child: Text("IL"),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Perfil"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Perfil()),
                );
              },
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(65, 72, 83, 1),
        selectedItemColor: const Color.fromRGBO(255, 234, 0, 1),
        unselectedItemColor: const Color.fromRGBO(131, 135, 141, 1),
        type: BottomNavigationBarType.fixed,
        iconSize: 28,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Metodos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist),
            label: 'Tarefas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Agenda',
          )
        ],
      ),
    );
  }
}
