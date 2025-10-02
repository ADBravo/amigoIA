
# Proyecto AmigoIA - Versión Móvil (Android)

La aplicación **AmigoIA** es un desarrollo realizado en **Flutter**, cuyo propósito es permitir la interacción entre el usuario y una inteligencia artificial.  
Entre sus principales funcionalidades se encuentran la gestión de múltiples conversaciones, el almacenamiento local de datos y la personalización de la experiencia de uso.  
El sistema utiliza una arquitectura modular, con persistencia mediante **SQLite** y comunicación con **Gemini AI** a través de una clave API.

---

## 1. Características principales

- Interacción con inteligencia artificial mediante **Gemini API**.  
- Gestión de múltiples conversaciones con títulos editables.  
- Persistencia local a través de **SQLite**.  
- Personalización del nombre del usuario.  
- Implementación de middleware para limitar la frecuencia de envío de mensajes.  
- Scripts de desarrollo para la reinicialización de la base de datos.  

---

## 2. Requisitos previos

Para la instalación y ejecución de la aplicación en dispositivos móviles es necesario contar con:  

- **Flutter 3.10** o superior.  
- **Dart SDK**.  
- Cuenta en [Gemini](https://ai.google.dev/).  
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

Crear un archivo denominado `.env` en la raíz del proyecto, en el cual se defina la clave API de Gemini y parámetros de control:

```env
GEMINI_API_KEY=TU_API_KEY_AQUI
MESSAGE_LIMIT=10
MESSAGE_WINDOW_SECONDS=10
MESSAGE_COOLDOWN_SECONDS=5
```

> En caso de ser necesario, puede emplear el archivo `.env.example` como plantilla.

---

## 4. Compilación del APK

Para generar el archivo de instalación en formato **APK** (Android Package), ejecute el siguiente comando:

```bash
flutter build apk --release
```

El archivo resultante estará disponible en la siguiente ruta:

```
build/app/outputs/flutter-apk/app-release.apk
```

Este archivo puede instalarse directamente en un dispositivo móvil con sistema operativo Android.

---

## 5. Estructura del proyecto

La organización del código fuente se presenta de la siguiente manera:

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
3. Ejecutar `flutter pub get` para instalar las dependencias necesarias.
4. Compilar el proyecto con el comando `flutter build apk --release`.
5. Instalar el archivo APK generado en un dispositivo Android.
6. Personalizar la interfaz o la lógica de la aplicación según los requerimientos.

---

## 7. Notas técnicas

* La base de datos se inicializa automáticamente en el servicio `DBService`.
* El nombre de usuario se almacena en la tabla `user`, bajo el identificador `id = 1`.
* Las conversaciones se almacenan en la tabla `chat` y los mensajes en la tabla `message`.
* El middleware regula la cantidad de mensajes enviados en un intervalo de tiempo definido.
* La aplicación determina si el usuario ha registrado un nombre y redirige a la vista correspondiente (`/name` o `/chats`).
