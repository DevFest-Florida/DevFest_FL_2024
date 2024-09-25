self.addEventListener("install", (event) => {
  console.log("devfest service worker install event", event);
});

self.addEventListener("fetch", (event) => {
  event.respondWith(
    caches.match(event.request).then((response) => {
      return response || fetch(event.request);
    })
  );
});
