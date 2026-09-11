# 🌱 GreenUp
**Transformando residuos en recompensas a través de una Economía Circular Digital.**

GreenUp es una plataforma móvil multiplataforma que gamifica el reciclaje conectando a usuarios, 
centros de acopio y empresas. Permite registrar residuos, acumular "Ecopuntos" mediante validación QR y 
canjearlos por recompensas reales, fomentando un futuro más sostenible.

---

## ✨ Características Principales

* **♻️ Ecosistema de 3 Roles:** Interfaces dedicadas para Usuarios (Recicladores), 
* Centros de Acopio (Validadores) y Empresas (Oferentes).
* **📍 Geolocalización:** Mapa interactivo con Google Maps para localizar centros de acopio cercanos.
* **📷 Escaneo y Generación QR:** Sistema seguro para validar entregas de material y canjes de recompensas.
* **💡 Sensor de Luz Ambiental:** Interfaz inteligente que reacciona a la luz del entorno para sugerir ahorro de energía.
* **📊 Gráficos Estadísticos:** Visualización del impacto ambiental personal (Kg reciclados).
* **🔔 Notificaciones Locales:** Recordatorios y alertas sobre el estado de las solicitudes.

---

## 🛠️ Stack Tecnológico

Este proyecto utiliza un conjunto robusto de librerías de Flutter y servicios en la nube:

### Core & UI
* **Flutter & Dart:** SDK ^3.9.0.
* **Google Maps Flutter:** Visualización de mapas.
* **FL Chart:** Gráficas estadísticas.
* **Cupertino Icons:** Iconografía estilo iOS.

### Backend (BaaS)
* **Firebase Core & Auth:** Autenticación.
* **Cloud Firestore:** Base de datos NoSQL en tiempo real.
* **Firebase Storage:** Almacenamiento de archivos.
* **Firebase Messaging:** Notificaciones push.

### Hardware & Sensores
* **Mobile Scanner & QR Flutter:** Lectura y generación de QR.
* **Light Sensor:** Lectura de lux para funciones ecológicas.
* **Geolocator:** Coordenadas GPS.

---

## 📋 Prerrequisitos

Antes de comenzar, asegúrate de tener instalado:

1.  [Flutter SDK](https://docs.flutter.dev/get-started/install) (Versión 3.9.0 o superior).
2.  Un editor de código (VS Code o Android Studio).
3.  Dispositivo físico Android o Emulador configurado.
4.  Clave de API de Google Maps válida.

---

## 🔧 Instalación y Configuración

1.  **Descargar archivos:**
    El archivo lib donde esta todo el codigo

2.  **Instalar dependencias:**
    Si estás configurando el entorno desde cero, ejecuta los siguientes comandos para añadir las librerías necesarias:

    **Servicios de Firebase (Backend):**
    ```bash
    flutter pub add firebase_core firebase_auth cloud_firestore firebase_storage firebase_messaging
    ```

    **Mapas, Sensores y Hardware:**
    ```bash
    flutter pub add google_maps_flutter geolocator mobile_scanner qr_flutter light_sensor
    ```

    **Utilidades del Sistema y Notificaciones:**
    ```bash
    flutter pub add url_launcher file_picker flutter_local_notifications shared_preferences timezone
    ```

    **Interfaz de Usuario (UI) y Gráficos:**
    ```bash
    flutter pub add fl_chart intl cupertino_icons
    ```

    **Dependencias de Desarrollo:**
    ```bash
    flutter pub add -d flutter_launcher_icons flutter_lints
    ```

    **Simplemente para instalar todo lo que ya está en el `pubspec.yaml`:**
    ```bash
    flutter pub get
    ```

3.  **Configuración de Google Maps:**
    * Asegúrate de que tu `API_KEY` en `android/app/src/main/AndroidManifest.xml` esté activa y 
    * tenga permisos para Maps SDK for Android.

4.  **Ejecutar la aplicación:**
    ```bash
    flutter run
    ```

---

## 🔐 Permisos del Dispositivo

La aplicación requiere los siguientes permisos (ya configurados en el Manifiesto):

* `CAMERA`: Para escanear códigos QR.
* `ACCESS_FINE_LOCATION`: Para mostrar la ubicación del usuario en el mapa.
* `INTERNET`: Conexión a Firebase y Google Maps.
* `READ_EXTERNAL_STORAGE`: Para subir archivos de verificación.
* `POST_NOTIFICATIONS` & `SCHEDULE_EXACT_ALARM`: Para el sistema de alertas.
* `SENSOR_LIGHT`: Para las características de conciencia energética.

## Para que solo copies y pegues:
* <!-- Permisos -->
  ```
    <uses-permission android:name="android.permission.CAMERA" />
    <uses-permission android:name="android.permission.INTERNET" />
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
    <uses-feature android:name="android.hardware.sensor.light" android:required="false" />

    <uses-permission android:name="android.permission.POST_NOTIFICATIONS" />
    <uses-permission android:name="android.permission.VIBRATE" />
    <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED" />

    <!-- Permisos de Localizacion -->
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />

    <!-- Permisos para alarmas exactas -->
    <uses-permission android:name="android.permission.SCHEDULE_EXACT_ALARM"/>
    <uses-permission android:name="android.permission.USE_EXACT_ALARM"/>
  ```

## La api key es personal, por seguridad no te la puedo otorgar
```
<meta-data android:name="com.google.android.geo.API_KEY"
        android:value="API-KEY" />
```

---

## ✒️ Autores

* **Ulises Alejandro Bautista Meza** - *Gestión de Proyecto / Desarrollo*
* **Alejandro Joya Barajas** - *Desarrollo*
* **Dominguez Herrera Denilson de Jesus** - *Desarrollo*
* **Ante Camacho Aroch Aaron** - *Desarrollo*

---

---
*Desarrollado con 💚 para la materia de Desarrollo Multiplataforma.*
