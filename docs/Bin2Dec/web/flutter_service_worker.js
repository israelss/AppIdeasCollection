'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/assets/LICENSE": "9f69edcc25795745c09624396a67241f",
"/assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"/assets/AssetManifest.json": "99914b932bd37a50b983c5e7c90ae93b",
"/assets/FontManifest.json": "580ff1a5d08679ded8fcf5c6848cece7",
"/main.dart.js": "8f77dd9a3980bbe9d457be71827cd016",
"/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"/index.html": "ebe16a17132295884dd346100e792cb1",
"/manifest.json": "ca3a945afacb28a4ae959edd9b969ccc",
"/icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"/icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1"
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
