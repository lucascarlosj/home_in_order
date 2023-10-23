import 'package:flutter/material.dart';



class AuthLoginNotifier extends ChangeNotifier {}

// Pega todos os usuarios perto da minha localização
/* // Lista para armazenar usuários dentro do raio de 20 km
List<Usuario> usuariosProximos = [];

// Calcule a distância entre a localização atual e cada usuário e filtre os usuários
usuarios.forEach((usuario) {
  final double kilometers = distance(
    LatLng(currentLatitude, currentLongitude),
    LatLng(usuario.latitude, usuario.longitude),
  ).kilometers;

  print('Distância até ${usuario.nome}: $kilometers km');

  // Se a distância for menor ou igual a 20 km, adicione o usuário à lista de usuários próximos
  if (kilometers <= 20) {
    usuariosProximos.add(usuario);
  }
});

// Ordene a lista de usuários próximos pela distância até a localização atual
usuariosProximos.sort((a, b) {
  final double distanceA = distance(
    LatLng(currentLatitude, currentLongitude),
    LatLng(a.latitude, a.longitude),
  ).kilometers;

  final double distanceB = distance(
    LatLng(currentLatitude, currentLongitude),
    LatLng(b.latitude, b.longitude),
  ).kilometers;

  return distanceA.compareTo(distanceB);
});

// Imprima os usuários próximos ordenados pela proximidade
usuariosProximos.forEach((usuario) {
  print(usuario.nome);
});

 */