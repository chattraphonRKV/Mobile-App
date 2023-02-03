import 'package:cs311hw06/pokemon_api.dart';
import 'package:flutter/material.dart';

class PokemonService extends ChangeNotifier {
  int pokemonCount = 1;
  int poindex = 1;
  int getColor = 0xFF7AC74C;
  void changePokemonCount(int value) {
    pokemonCount += value;
    if (pokemonCount < 0) {
      pokemonCount = 0;
    }
    notifyListeners();
  }

  void changecolor (int index)async{ 
    poindex = index;
    PokemonInfo Typepo = await fetchPokemonInfo(poindex);
    String collectpo = Typepo.types[0]; 
    if (collectpo == "normal"){
      getColor = 0xFFA8A77A;
    }else if (collectpo == "fire"){
      getColor = 0xFFEE8130;
    }else if (collectpo == "water"){
      getColor = 0xFF6390F0;
    }else if (collectpo == "electric"){
      getColor = 0xFFF7D02C;
    }else if (collectpo == "grass"){
      getColor = 0xFF7AC74C;
    }else if (collectpo == "ice"){
      getColor = 0xFF96D9D6;
    }else if (collectpo == "fighting"){
      getColor = 0xFFC22E28;
    }else if (collectpo == "poison"){
      getColor = 0xFFA33EA1;
    }else if (collectpo == "ground"){
      getColor = 0xFFE2BF65;
    }else if (collectpo == "flying"){
      getColor = 0xFFA98FF3;
    }else if (collectpo == "psychic"){
      getColor = 0xFFF95587;
    }else if (collectpo == "bug"){
      getColor = 0xFFA6B91A;
    }else if (collectpo == "rock"){
      getColor = 0xFFB6A136;
    }else if (collectpo == "ghost"){
      getColor = 0xFF735797;
    }else if (collectpo == "dragon"){
      getColor = 0xFF6F35FC;
    }else if (collectpo == "dark"){
      getColor = 0xFF705746;
    }else if (collectpo == "steel"){
      getColor = 0xFFB7B7CE;
    }else if (collectpo == "fairy"){
      getColor = 0xFFD685AD;
    }
    notifyListeners();
    print(collectpo);
  }
}