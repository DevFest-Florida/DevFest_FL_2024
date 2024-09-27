// Register route for navigation requests
workbox.routing.registerRoute(
  ({ request }) => request.mode === 'navigate',
  new workbox.strategies.StaleWhileRevalidate({
    cacheName: 'devfest-page-cache',
  })
);

// Register route for image requests
workbox.routing.registerRoute(
  ({ request }) => request.destination === 'image',
  new workbox.strategies.StaleWhileRevalidate({
    cacheName: 'devfest-image-cache',
    plugins: [
      new workbox.expiration.ExpirationPlugin({
        maxEntries: 50,
        maxAgeSeconds: 30 * 24 * 60 * 60, // Cache for a month
      }),
    ],
  })
);
  // Register route for API requests
  workbox.routing.registerRoute(
    ({ url }) => url.origin === 'https://sessionize.com' && url.pathname.startsWith('/api/v2/1xy9p1oq/view/'),
    new workbox.strategies.StaleWhileRevalidate({
      cacheName: 'devfest-api-cache',
      plugins: [
        new workbox.expiration.ExpirationPlugin({
          maxEntries: 50,
          maxAgeSeconds: 24 * 60 * 60, // Cache for a day
        }),
      ],
    })
  );
// Pre-cache essential assets during installation
self.addEventListener('install', (event) => {
  event.waitUntil(
    caches.open('devfest-app-shell-cache').then((cache) => {
      return cache.addAll([
        '/',
        '/index.html',
        '/flutter.js',
        '/flutter_service_worker.js',
        '/flutter_bootstrap.js',
        '/manifest.json',
        '/icons/devfest-icon-192.png',
        '/icons/devfest-icon-512.png',
        '/icons/devfest-icon-maskable-192.png',
        '/icons/devfest-icon-maskable-512.png',
        '/screenshots/light_home.png',
        '/screenshots/dark_home.png',
        '/devfestfl_favicon.png',
      ]);
    })
  );
});