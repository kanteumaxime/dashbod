import 'dart:async';

import 'package:dashboard_flutter/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {

    @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      try {
        if (!mounted) return;
          setState(() {
            Timer(const Duration(seconds: 7), () {
               Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Login(),
              ),
            );
            });
          });
        
      } catch (e) {
        //
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Column(
      children: [
         const SizedBox(
          height: 300,
        ),
        Center(
          child: LoadingAnimationWidget.twistingDots(
            leftDotColor: const Color(0xFF1A1A3F),
            rightDotColor: const Color(0xFFEA3799),
            size: 200,
          ),
        ),
        const SizedBox(
          height: 290,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
                        child: const Align(
                            alignment: FractionalOffset.bottomCenter,
                            child: Text(
                              "Copyright © 2023 shop, Tous droits réservés.",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 11,
                              ),
                              textAlign: TextAlign.center,
                            )),
                        padding: const EdgeInsets.only(
                          bottom: 10,
                        ),
                      ),
        ),
      ],
      
    ),
      );
  }
}



/*code pour utiliser ce code <?php

// Endpoint pour créer un nouvel utilisateur (Create)
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Récupérer les données de l'utilisateur depuis la requête
    $nom = $_POST['nom'];
    $email = $_POST['email'];

    // Enregistrement des informations dans la base de données
    // Code pour l'enregistrement dans la base de données

    // Réponse confirmant la création de l'utilisateur
    $response = [
        'message' => 'L\'utilisateur a été créé avec succès.'
    ];
    echo json_encode($response);
}

// Endpoint pour récupérer les informations d'un utilisateur spécifique (Read)
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    // Récupérer l'identifiant de l'utilisateur depuis la requête
    $id = $_GET['id'];

    // Récupérer les informations de l'utilisateur depuis la base de données
    // Code pour récupérer les informations de l'utilisateur depuis la base de données

    // Réponse contenant les détails de l'utilisateur
    $user = [
        'id' => $id,
        'nom' => 'John Doe',
        'email' => 'johndoe@example.com'
    ];
    echo json_encode($user);
}

// Endpoint pour mettre à jour les informations d'un utilisateur existant (Update)
if ($_SERVER['REQUEST_METHOD'] === 'PUT') {
    // Récupérer l'identifiant de l'utilisateur depuis la requête
    $id = $_GET['id'];

    // Récupérer les nouvelles données de l'utilisateur depuis la requête
    $nom = $_POST['nom'];
    $email = $_POST['email'];

    // Mettre à jour les informations de l'utilisateur dans la base de données
    // Code pour mettre à jour les informations de l'utilisateur dans la base de données

    // Réponse indiquant que la mise à jour a été effectuée avec succès
    $response = [
        'message' => 'Les informations de l\'utilisateur ont été mises à jour.'
    ];
    echo json_encode($response);
}

// Endpoint pour supprimer un utilisateur (Delete)
if ($_SERVER['REQUEST_METHOD'] === 'DELETE') {
    // Récupérer l'identifiant de l'utilisateur depuis la requête
    $id = $_GET['id'];

    // Supprimer l'utilisateur de la base de données
    // Code pour supprimer l'utilisateur de la base de données

    // Réponse de confirmation de la suppression
    $response = [
        'message' => 'L\'utilisateur a été supprimé avec succès.'
    ];
    echo json_encode($response);
}
?> en flutter

import 'dart:convert';
import 'package:http/http.dart' as http;

// Endpoint pour créer un nouvel utilisateur (Create)
Future<void> createUser(String nom, String email) async {
  final url = 'http://localhost:8000/create-user';
  final response = await http.post(
    Uri.parse(url),
    body: {
      'nom': nom,
      'email': email,
    },
  );

  final responseData = json.decode(response.body);
  print(responseData['message']);
}

// Endpoint pour récupérer les informations d'un utilisateur spécifique (Read)
Future<void> getUser(String id) async {
  final url = 'http://localhost:8000/get-user?id=$id';
  final response = await http.get(Uri.parse(url));

  final responseData = json.decode(response.body);
  print('ID: ${responseData['id']}');
  print('Nom: ${responseData['nom']}');
  print('Email: ${responseData['email']}');
}

// Endpoint pour mettre à jour les informations d'un utilisateur existant (Update)
Future<void> updateUser(String id, String nom, String email) async {
  final url = 'http://localhost:8000/update-user?id=$id';
  final response = await http.put(
    Uri.parse(url),
    body: {
      'nom': nom,
      'email': email,
    },
  );

  final responseData = json.decode(response.body);
  print(responseData['message']);
}

// Endpoint pour supprimer un utilisateur (Delete)
Future<void> deleteUser(String id) async {
  final url = 'http://localhost:8000/delete-user?id=$id';
  final response = await http.delete(Uri.parse(url));

  final responseData = json.decode(response.body);
  print(responseData['message']);
}

void main() {
  // Tester les différentes fonctions
  createUser('John Doe', 'johndoe@example.com');
  getUser('1');
  updateUser('1', 'Jane Doe', 'janedoe@example.com');
  deleteUser('1');
}*/