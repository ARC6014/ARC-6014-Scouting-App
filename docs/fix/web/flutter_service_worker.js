'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/index.html": "55b6f397f3ec2c9a550f2cf499ea77e1",
"/main.dart.js": "c3134ea20b4a6bcf0675a901d5814abd",
"/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"/icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"/icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"/manifest.json": "c1af2431f309719af6abcafdbda37aec",
"/assets/LICENSE": "0751047dbba0dccab9522505e9c586f0",
"/assets/AssetManifest.json": "f6721348a8d4e4c069fff0a68d522bc8",
"/assets/FontManifest.json": "98a34a821ce1b6dc297e6575b75c7b64",
"/assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"/assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"/assets/assets/fonts/Raleway-800i.ttf": "05c7000a5498523bbd184902d124c382",
"/assets/assets/fonts/Raleway-400i.ttf": "b43297391b7d5d5d7b135958668c1876",
"/assets/assets/fonts/Raleway-900.ttf": "46818ebd4f76c4e6fe9b030dbc74f5cf",
"/assets/assets/fonts/Raleway-600i.ttf": "b8ea2e82df9aeaf774c081dffb3b46e8",
"/assets/assets/fonts/Raleway-200i.ttf": "c8c27816a4b4b6fdfd4a8c944bd2c8ff",
"/assets/assets/fonts/Raleway-800.ttf": "be3bf63a30b4523ae221bd4358b13e8f",
"/assets/assets/fonts/Raleway-400.ttf": "9942588a6c84f959132556d99e83ded6",
"/assets/assets/fonts/Raleway-900i.ttf": "956d40aa9747deb39f8b93793803bc9d",
"/assets/assets/fonts/Raleway-500i.ttf": "d3aded9f5da961c952a9c6c41d77f681",
"/assets/assets/fonts/Raleway-600.ttf": "5a25c50b181b07279489ce5bb6a9545c",
"/assets/assets/fonts/Raleway-700i.ttf": "400d6e7c7df487961a0f1426a73fff68",
"/assets/assets/fonts/Raleway-200.ttf": "d2a8929f630cba5875d97a5f34da6162",
"/assets/assets/fonts/Raleway-700.ttf": "f49f3d2d9df5013c9bfaab7e3d39ee57",
"/assets/assets/fonts/Raleway-300i.ttf": "e2a70086178378a6165ad7b032ee1077",
"/assets/assets/fonts/Raleway-500.ttf": "bb5ae98e4ce1a64042093dc235c305ed",
"/assets/assets/fonts/Raleway-100.ttf": "5faedfece17998f456bf5b32b100b597",
"/assets/assets/fonts/Raleway-300.ttf": "466d154fedd98f85c9deb363ccf859a7",
"/assets/assets/fonts/Raleway-100i.ttf": "b4fdd9b19ccaa454c97e1ba2b1364815"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
