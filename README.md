
# Proyecto AmigoIA - Versión de Escritorio (Windows)

La aplicación **AmigoIA** es un desarrollo realizado en **Flutter**, cuyo propósito es permitir la interacción entre el usuario y una inteligencia artificial.  
Entre sus funcionalidades se incluyen la gestión de múltiples conversaciones, almacenamiento local de datos y personalización de la experiencia de uso.  
La arquitectura del sistema está basada en un modelo modular, con soporte de **SQLite** para persistencia local, y comunicación con **Gemini AI** mediante una clave API.

---

## 1. Características principales

- Interacción con inteligencia artificial mediante **Gemini API**.  
- Gestión de múltiples conversaciones con títulos editables.  
- Persistencia local a través de **SQLite**.  
- Personalización del nombre del usuario.  
- Implementación de middleware para limitar la frecuencia de envío de mensajes.  
- Scripts de desarrollo para reiniciar la base de datos en entorno local.  

---

## 2. Requisitos previos

Para la correcta instalación y ejecución del proyecto se requiere contar con:

- **Flutter 3.10** o superior.  
- **Dart SDK**.  
- Una cuenta en [Gemini](https://ai.google.dev/).  
- Clave API de Gemini (proporcionada previamente).  
- Editor de desarrollo (recomendado: Android Studio o Visual Studio Code).  

---

## 3. Proceso de instalación

1. **Clonar el repositorio**  

```bash
git clone https://github.com/tuusuario/amigoia.git
cd amigoia
```

2. **Instalar dependencias del proyecto**

```bash
flutter pub get
```

3. **Regenerar archivos de configuración básicos**

```bash
flutter create .
```

4. **Configurar variables de entorno**

Crear un archivo denominado `.env` en la raíz del proyecto con la clave API de Gemini y los parámetros de control:

```env
GEMINI_API_KEY=TU_API_KEY_AQUI
MESSAGE_LIMIT=10
MESSAGE_WINDOW_SECONDS=10
MESSAGE_COOLDOWN_SECONDS=5
```

> En caso de ser necesario, puede utilizar el archivo `.env.example` como plantilla.

5. **Ejecutar la aplicación**

```bash
flutter run
```

---

## 4. Scripts disponibles

* **Reinicializar la base de datos (solo versión escritorio):**

```bash
dart run scripts/reset_db.dart
```

Este script elimina todas las tablas de SQLite, por lo que debe emplearse únicamente en entornos de desarrollo.

---

## 5. Estructura del proyecto

La organización de carpetas es la siguiente:

```
lib/
├── controllers/       # Lógica de negocio
├── models/            # Modelos de datos
├── routes/            # Routers y navegación
├── services/          # Base de datos y conexión a API
├── views/             # Interfaces gráficas
├── scripts/           # Herramientas de desarrollo
```

---

## 6. Lineamientos para la ejecución del proyecto

1. Instalar Flutter y clonar el repositorio.
2. Configurar el archivo `.env` con la clave de Gemini.
3. Ejecutar `flutter pub get` para instalar dependencias.
4. Iniciar el proyecto con `flutter run`.
5. En caso de ser necesario, ejecutar los scripts de limpieza de base de datos.
6. Personalizar la interfaz o lógica según los requerimientos del proyecto.

---

## 7. Notas técnicas

* La base de datos se inicializa automáticamente en el servicio `DBService`.
* El nombre de usuario se almacena en la tabla `user`, bajo el identificador `id = 1`.
* Las conversaciones se almacenan en la tabla `chat` y los mensajes en la tabla `message`.
* El middleware limita la cantidad de mensajes enviados en un intervalo de tiempo definido.
* La aplicación verifica si el usuario ha registrado un nombre, y redirige a la vista correspondiente (`/name` o `/chats`).