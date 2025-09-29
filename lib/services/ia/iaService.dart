import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class IAService {
  final GenerativeModel _model;

  IAService()
    : _model = GenerativeModel(
        model: 'gemini-2.5-flash-lite',
        apiKey: dotenv.env['GEMINI_API_KEY'] ?? '',
      );

  Future<String> responder(
    String nombreUsuario,
    String genero,
    String mensaje,
    String contexto,
  ) async {
    final prompt =
        """
Eres AmigoIA, un amigo cercano y empático.
Siempre hablas con calidez y mencionando el nombre de la persona.
El usuario se llama $nombreUsuario y su género es $genero.

Contexto de conversación:
$contexto

Mensaje del usuario:
$mensaje

Responde como su mejor amigo, en un tono positivo y empático, pero con frases cortas, claras y directas, sin extenderte más de lo necesario.
""";

    final response = await _model.generateContent([Content.text(prompt)]);
    return response.text ?? "Lo siento, no entendí lo que dijiste.";
  }
}
