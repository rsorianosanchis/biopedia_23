// en esta clase evitamos los posibles errores en los strings que usamos en diferentes lugares.
//De esta manera lalmamos a la clase y seleccionamos la variable

import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String theMovieDbKey = dotenv.env['THE_MOVIEDB_KEY'] ?? 'API key NOT available';
}
