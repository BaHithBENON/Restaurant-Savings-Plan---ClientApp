# Restaurant-Savings-Plan - Application Client
Application visuelle du système de plan d'économies dans les restaurants

## Description

Application Flutter pour consommer les microservices du réseau de fidélisation des restaurants. Le code source des microservices peut être trouvé sur le lien suivant.

## Fonctionnalités
- Créer, mettre à jour des restaurants, des récompenses, des comptes et leurs bénéficiaires.
- Calculer les avantages en fonction du coût d'un dîner.
- Distribuer les récompenses aux bénéficiaires.

## Prérequis 
- Environnement `Flutter` & `Dart`
- Environnement `Java` + `SpringBoot`
- Serveurs et microservices 
    - Git: [Répertoire Restaurant-Savings-Plan](https://github.com/BaHithBENON/Restaurant-Savings-Plan)

## Démarrage
- Exécutez `flutter clean`, puis `flutter run`
- Une version Windows est disponible dans le répertoire
    - `.exe` **build\windows\x64\runner\Release\restaurant_savings_plan.exe**
    - Le port par défaut utilisé dans le code est `8765`, qui est le port de la passerelle des microservices. Vérifiez le code source si vous souhaitez le changer selon vos préférences, puis recompilez l'application.

## Routes
- Vous pouvez trouver la documentation des routes dans les fichiers `routes_fr` pour le français et `routes_en` pour l'anglais.