# Apprendre Dart

Dart est un langage optimisé pour le client permettant de développer des applications rapides sur n'importe quelle plate-forme. Son objectif est d'offrir le langage de programmation le plus productif pour le développement multiplateforme, associé à une plate-forme d'exécution d'exécution flexible pour les frameworks d'applications.

Les langages sont définis par leur enveloppe technique - les choix effectués au cours du développement qui façonnent les capacités et les points forts d'un langage. Dart est conçu pour une enveloppe technique particulièrement adaptée au développement client, en donnant la priorité à la fois au développement (rechargement à chaud avec état en moins d'une seconde) et aux expériences de production de haute qualité sur une grande variété de cibles de compilation (web, mobile et bureau).

Dart constitue également la base de Flutter . Dart fournit le langage et les runtimes qui alimentent les applications Flutter, mais Dart prend également en charge de nombreuses tâches de développement de base telles que le formatage, l'analyse et le test du code.

# Le langage dart

Le langage Dart est de type sécurisé ; il utilise la vérification de type statique pour s'assurer que la valeur d'une variable correspond toujours au type statique de la variable. Parfois, on parle de typage sonore. Bien que les types soient obligatoires, les annotations de type sont facultatives en raison de l'inférence de type. Le système de typage Dart est également flexible, permettant l'utilisation d'un dynamictype combiné à des contrôles d'exécution, ce qui peut être utile lors d'expérimentations ou pour un code qui doit être particulièrement dynamique.

Dart a une sécurité intégrée pour le son nul . Cela signifie que les valeurs ne peuvent pas être nulles, sauf si vous dites qu'elles peuvent l'être. Avec une sécurité nulle solide, Dart peut vous protéger des exceptions nulles lors de l'exécution grâce à l'analyse statique du code. Contrairement à de nombreux autres langages null-safe, lorsque Dart détermine qu'une variable n'accepte pas les valeurs nulles, cette variable ne peut jamais être nulle. Si vous inspectez votre code en cours d'exécution dans le débogueur, vous constatez que la non-nullabilité est conservée au moment de l'exécution ; d'où sa sécurité nulle.

L'exemple de code suivant présente plusieurs fonctionnalités du langage Dart, notamment les bibliothèques, les appels asynchrones, les types nullables et non nullables, la syntaxe des flèches, les générateurs, les flux et les getters. Pour en savoir plus sur la langue, faites le Dart language tour .

```
import 'dart:math' show Random;

void main() async {
  print('Compute π using the Monte Carlo method.');
  await for (final estimate in computePi().take(100)) {
    print('π ≅ $estimate');
  }
}

/// Generates a stream of increasingly accurate estimates of π.
Stream<double> computePi({int batch = 100000}) async* {
  var total = 0; // Inferred to be of type int
  var count = 0;
  while (true) {
    final points = generateRandom().take(batch);
    final inside = points.where((p) => p.isInsideUnitCircle);

    total += batch;
    count += inside.length;
    final ratio = count / total;

    // Area of a circle is A = π⋅r², therefore π = A/r².
    // So, when given random points with x ∈ <0,1>,
    // y ∈ <0,1>, the ratio of those inside a unit circle
    // should approach π / 4. Therefore, the value of π
    // should be:
    yield ratio * 4;
  }
}

Iterable<Point> generateRandom([int? seed]) sync* {
  final random = Random(seed);
  while (true) {
    yield Point(random.nextDouble(), random.nextDouble());
  }
}

class Point {
  final double x;
  final double y;

  const Point(this.x, this.y);

  bool get isInsideUnitCircle => x * x + y * y <= 1;
}
```

# Les bibliothèques dart
Dart dispose d'un riche ensemble de bibliothèques de base , fournissant les éléments essentiels pour de nombreuses tâches de programmation quotidiennes :

-  Types, collections et autres fonctionnalités de base intégrés pour chaque programme Dart ( dart:core)
-  Types de collection plus riches tels que les files d'attente, les listes liées, les hashmaps et les arbres binaires ( dart:collection)
-  Encodeurs et décodeurs pour la conversion entre différentes représentations de données, y compris JSON et UTF-8 ( dart:convert)
Constantes et fonctions mathématiques et génération de nombres aléatoires ( dart:math)
-  Prise en charge des fichiers, sockets, HTTP et autres E/S pour les applications non Web ( dart:io)
-  Prise en charge de la programmation asynchrone, avec des classes telles que Futureet Stream ( dart:async)
-  Listes qui gèrent efficacement les données de taille fixe (par exemple, les entiers non signés de 8 octets) et les types numériques SIMD ( dart:typed_data)
-  Interfaces de fonctions étrangères pour l'interopérabilité avec d'autres codes qui présentent une interface de style C ( dart:ffi)
-  Programmation simultanée à l'aide d'isolats - des travailleurs indépendants similaires aux threads mais ne partageant pas de mémoire, communiquant uniquement via des messages ( dart:isolate)
-  Éléments HTML et autres ressources pour les applications Web qui doivent interagir avec le navigateur et le modèle d'objet de document (DOM) ( dart:html)

Au-delà des bibliothèques principales, de nombreuses API sont fournies via un ensemble complet de packages. L'équipe Dart publie de nombreux packages supplémentaires utiles, tels que ceux-ci :

  -  personnages
  -  international
  -  http
  -  crypto
  -  réduction

De plus, les éditeurs tiers et la communauté au sens large publient des milliers de packages, avec prise en charge de fonctionnalités telles que celles-ci :

  -  XML
  -  Intégration Windows
  -  SQLiteName
  -  compression

Pour voir une série d'exemples de travail mettant en vedette les bibliothèques principales de Dart, faites le tour de la bibliothèque . Pour trouver des API supplémentaires, consultez la page des packages couramment utilisés .

# Les plates-formes Dart
La technologie de compilateur de Dart vous permet d'exécuter du code de différentes manières :

-  Plate-forme native : pour les applications ciblant les appareils mobiles et de bureau, Dart inclut à la fois une machine virtuelle Dart avec une compilation juste-à-temps (JIT) et un compilateur anticipé (AOT) pour la production de code machine.

-  Plateforme Web : Pour les applications ciblant le Web, Dart peut compiler à des fins de développement ou de production. Son compilateur Web traduit Dart en JavaScript.

![Dart-platforms](https://github.com/Kabasele754/learn_dart/assets/67704765/7d0b1bff-19c5-4e73-a3c1-269b5316c0f3)

Le framework Flutter est une boîte à outils d'interface utilisateur multiplateforme populaire alimentée par la plate-forme Dart, et qui fournit des outils et des bibliothèques d'interface utilisateur pour créer des expériences d'interface utilisateur qui s'exécutent sur iOS, Android, macOS, Windows, Linux et le Web.

# Dart Native (code machine JIT et AOT)
Pendant le développement, un cycle de développement rapide est essentiel pour l'itération. La machine virtuelle Dart offre un compilateur juste-à-temps (JIT) avec une recompilation incrémentielle (permettant le rechargement à chaud), des collections de métriques en direct (alimentant DevTools ) et une prise en charge de débogage riche.

Lorsque les applications sont prêtes à être déployées en production, que vous les publiiez sur une boutique d'applications ou que vous les déployiez sur un backend de production, le compilateur Dart à l'avance (AOT) peut être compilé en code machine ARM ou x64 natif. Votre application compilée par AOT se lance avec un temps de démarrage court et cohérent.

Le code compilé par AOT s'exécute dans un environnement d'exécution Dart efficace qui applique le système de type Dart sonore et gère la mémoire à l'aide d'une allocation d'objet rapide et d'un ramasse-miettes générationnel .

# Dart Web (développement et production JavaScript)

Dart Web permet d'exécuter du code Dart sur des plates-formes Web alimentées par JavaScript. Avec Dart Web, vous compilez le code Dart en code JavaScript, qui s'exécute à son tour dans un navigateur, par exemple, V8 dans Chrome .

# Dart web contient deux modes de compilation :

  -  Un compilateur de développement incrémental permettant un cycle de développement rapide
  -  Un compilateur de production optimisant qui compile le code Dart en JavaScript rapide, compact et déployable. Ces efficacités proviennent de techniques telles que l'élimination des codes morts.

### L'environnement d'exécution Dart

Quelle que soit la plate-forme que vous utilisez ou la manière dont vous compilez votre code, l'exécution du code nécessite un environnement d'exécution Dart. Ce runtime est responsable des tâches critiques suivantes :

Gestion de la mémoire : Dart utilise un modèle de mémoire gérée, où la mémoire inutilisée est récupérée par un ramasse-miettes (GC).

Application du système de type Dart : bien que la plupart des vérifications de type dans Dart soient statiques (à la compilation), certaines vérifications de type sont dynamiques (à l'exécution). Par exemple, l'environnement d'exécution Dart applique des vérifications dynamiques par des opérateurs de type check et cast .

Gestion des isolats : le runtime Dart contrôle l'isolat principal (où le code s'exécute normalement) et tous les autres isolats créés par l'application.

Sur les plates-formes natives, le runtime Dart est automatiquement inclus dans des exécutables autonomes et fait partie de la machine virtuelle Dart fournie par la dart runcommande.


# Installation de Dart
Il existe plusieurs façons d'installer une fléchette sur votre système. Vous pouvez installer Dart sur Windows, Mac et Linux ou l'exécuter à partir du navigateur.

## Exigences
SDK de Dart ,
Code VS ou d'autres éditeurs comme Andoid studio, Intellij [Nous utiliserons VS Code ici].

## Installation de Dart sur Windows 

Suivez les instructions ci-dessous pour installer une fléchette sur le système d'exploitation Windows.

Etapes:

T-  éléchargez le SDK Dart à partir [d'ici](https://dart.dev/get-dart/archive/).
-  Copiez le dossier dart-sdk sur votre lecteur C.
-  Ajoutez C:\dart-sdk\bin à votre variable d'environnement. Regardez la vidéo ci-dessous pour être plus clair.
-  Ouvrez l'invite de commande et tapezdart --versionpour le vérifier.
-  InstallerCode VSet Ajouter une extension de fléchette.

Remarque : Dart SDK fournit les outils pour compiler et exécuter le programme Dart.

## Installation de Dart sur Mac

-  Installer Homebrew à partir [d'ici](https://brew.sh/).
-  Taper ```brew tap dart-lang/dart ``` dans le  terminal.
-  Taper ```brew install dart``` dans le terminal.

### Homebrew Install Command

Copiez et collez cette commande sur votre terminal pour installer Homebrew.

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Pour définir le chemin homebrew, copiez et collez cette commande sur votre terminal.


```
export PATH=/opt/homebrew/bin:$PATH
```

### Installation de Dart sur Linux

Pour installer une fléchette sur Linux, ouvrez votre terminal et copiez/collez les commandes ci-dessous.

```
sudo apt-get update
sudo apt-get install apt-transport-https
wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/dart.gpg
echo 'deb [signed-by=/usr/share/keyrings/dart.gpg arch=amd64] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main' | sudo tee /etc/apt/sources.list.d/dart_stable.list
```

