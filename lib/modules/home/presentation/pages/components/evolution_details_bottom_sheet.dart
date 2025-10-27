// import 'dart:math' as math;

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:pokedex/core/constants/constants.dart';
// import 'package:pokedex/core/design_system/imports.dart';
// import 'package:pokedex/modules/home/domain/models/pokemon_model.dart';

// class PokemonDetailContent extends StatelessWidget {
//   final PokemonModel pokemon;

//   const PokemonDetailContent({super.key, required this.pokemon});

//   @override
//   Widget build(BuildContext context) {
//     final primaryColor = pokemon.elements.first.cardColor;
//     final size = MediaQuery.of(context).size;

//     return ClipRRect(
//       borderRadius: const BorderRadius.only(
//         topLeft: Radius.circular(28),
//         topRight: Radius.circular(28),
//       ),
//       child: Column(
//         children: [
//           // ===== CABEÇALHO COM INCLINAÇÃO =====
//           Stack(
//             clipBehavior: Clip.none,
//             children: [
//               // Fundo inclinado com gradiente
//               Transform(
//                 transform: Matrix4.skewY(-8 * math.pi / 180), // inclinação sutil
//                 child: Container(
//                   height: 180,
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [Colors.white, primaryColor],
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                     ),
//                   ),
//                 ),
//               ),

//               // Conteúdo textual
//               Positioned(
//                 top: 40,
//                 left: 24,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     AppText.regular(
//                       '#${pokemon.id.toString().padLeft(3, '0')}',
//                       size: 14,
//                       color: Colors.white70,
//                     ),
//                     const SizedBox(height: 4),
//                     AppText.bold(pokemon.name.toUpperCase(), size: 28, color: Colors.white),
//                   ],
//                 ),
//               ),

//               // Botão de favorito
//               Positioned(
//                 top: 32,
//                 right: 24,
//                 child: Container(
//                   decoration: const BoxDecoration(color: Colors.white24, shape: BoxShape.circle),
//                   child: const Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Icon(Icons.favorite_border, color: Colors.white, size: 28),
//                   ),
//                 ),
//               ),

//               // Pokémon centralizado e saindo da borda inferior
//               Positioned(
//                 bottom: -50,
//                 left: (size.width / 2) - 80,
//                 child: Hero(
//                   tag: 'pokemon_${pokemon.id}',
//                   child: CachedNetworkImage(
//                     imageUrl: '$pokemonBaseUrlImage${pokemon.id}.png',
//                     height: 160,
//                     width: 160,
//                     fit: BoxFit.contain,
//                     placeholder: (context, _) => const Center(child: CircularProgressIndicator()),
//                   ),
//                 ),
//               ),
//             ],
//           ),

//           const SizedBox(height: 80), // Espaço pro Pokémon sobreposto
//           // ===== SEÇÃO EVOLUTION =====
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'Evolution',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.redAccent,
//                     fontSize: 16,
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 Container(
//                   height: 150,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: Colors.grey.shade100,
//                     borderRadius: BorderRadius.circular(16),
//                     border: Border.all(color: Colors.grey.shade300),
//                   ),
//                   child: const Center(
//                     child: Text(
//                       'Evolution Section (coming soon)',
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
