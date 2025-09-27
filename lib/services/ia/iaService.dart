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
      String nombreUsuario, String mensaje, String contexto) async {
    final prompt = """
Eres un amigo empático y cercano llamado AmigoIA.
Hablas siempre de manera cálida y usando el nombre de la persona.
El usuario se llama $nombreUsuario.

Contexto de conversación:
$contexto

Mensaje del usuario:
$mensaje

Responde como si fueras su mejor amigo, en un tono positivo y empático.
""";

    final response = await _model.generateContent([Content.text(prompt)]);
    return response.text ?? "Lo siento, no entendí lo que dijiste.";
  }
}