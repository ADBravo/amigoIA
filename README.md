
# 🤖 AmigoIA

AmigoIA es una aplicación Flutter que permite al usuario conversar con una inteligencia artificial, gestionar múltiples chats, y personalizar su experiencia. Está diseñada con arquitectura modular, SQLite local, y conexión a Gemini AI vía API.

---

## 🚀 Características principales

- 🧠 Chat con IA usando Gemini API
- 💬 Múltiples conversaciones con títulos editables
- 📝 Persistencia local con SQLite
- 👤 Personalización del nombre del usuario
- 🛡️ Middleware para limitar mensajes por tiempo
- 🧪 Scripts de desarrollo para resetear la base de datos

---

## 🛠️ Requisitos

- Flutter 3.10 o superior
- Dart SDK
- Cuenta en [Gemini](https://ai.google.dev/)
- Clave API de Gemini
- Android Studio o VS Code (opcional)

---

## 📦 Instalación

1. **Clona el repositorio**

```bash
git clone https://github.com/tuusuario/amigoia.git
cd amigoia
```

2. **Instala dependencias**

```bash
flutter pub get
```

3. **Configura tu archivo `.env`**

Crea un archivo `.env` en la raíz con tu clave de Gemini y parámetros de control:

```env
GEMINI_API_KEY=TU_API_KEY_AQUI
MESSAGE_LIMIT=10
MESSAGE_WINDOW_SECONDS=10
MESSAGE_COOLDOWN_SECONDS=5
```

> También puedes usar `.env.example` como plantilla.

4. **Ejecuta la app**

```bash
flutter run
```

---

## 📱 Compilar APK

```bash
flutter build apk --release
```

El archivo estará en:

```
build/app/outputs/flutter-apk/app-release.apk
```

---

## 🧹 Scripts útiles

### 🔥 Borrar toda la base de datos (solo escritorio)

```bash
dart run scripts/reset_db.dart
```

Este script elimina todas las tablas de SQLite. Úsalo solo en desarrollo.

---

## 🧭 Estructura del proyecto

```
lib/
├── controllers/       # Lógica de negocio
├── models/            # Modelos de datos
├── routes/            # Routers y navegación
├── services/          # Base de datos y API
├── views/             # Pantallas y UI
├── scripts/           # Herramientas para desarrolladores
```

---

## 👨‍💻 ¿Qué hacer si tomas este proyecto?

1. Instala Flutter y clona el repo
2. Crea tu `.env` con tu clave de Gemini
3. Ejecuta `flutter pub get`
4. Corre la app con `flutter run`
5. Usa los scripts si necesitas limpiar la base de datos
6. Personaliza la UI, lógica o conexión según tus necesidades

---

## 📌 Notas técnicas

- La base de datos se inicializa automáticamente en `DBService`
- El nombre del usuario se guarda en la tabla `user` con `id = 1`
- Los chats se guardan en `chat`, y los mensajes en `message`
- El middleware limita la cantidad de mensajes por ventana de tiempo
- La app detecta si el usuario tiene nombre y redirige a `/name` o `/chats`
