'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "25073f2409aa3a56c680ee09341a7118",
"assets/AssetManifest.bin.json": "0941dc0aa60acedb2c77d463e97e5cb4",
"assets/AssetManifest.json": "42dbafd25ebad7b1fcd49e80766e9c8e",
"assets/assets/fonts/Pretendard-Black.ttf": "51c73880d5964b36e6373b3fe31f3058",
"assets/assets/fonts/Pretendard-Bold.ttf": "dfb614ebecd405875f50a918ca11c17c",
"assets/assets/fonts/Pretendard-ExtraBold.ttf": "332e9b673b0c1709e93fee01e4543f1d",
"assets/assets/fonts/Pretendard-ExtraLight.ttf": "2f39a307ce00aa5e734137d4cee3b5c1",
"assets/assets/fonts/Pretendard-Light.ttf": "77ecd2ca94928e38ff7c68bb255324f7",
"assets/assets/fonts/Pretendard-Medium.ttf": "7305f90c923d4409825ec2f4380b63d6",
"assets/assets/fonts/Pretendard-Regular.ttf": "d6e0de06bff8b7fda2db4682168e3ddf",
"assets/assets/fonts/Pretendard-SemiBold.ttf": "459eff7ba5380583ccd6eda49c846c85",
"assets/assets/fonts/Pretendard-Thin.ttf": "8b65a9299b173e635e6acac200e80257",
"assets/assets/guides/01.wav": "17cf6dd0eb28c22e88ab59fe57aacd8a",
"assets/assets/guides/02.wav": "7ae72cb754d2cd8a033397196584ed64",
"assets/assets/guides/03.wav": "799a15ddc1b9dc407512d0374bf31ee0",
"assets/assets/guides/04.wav": "b54d98783d4e79c2b1f3b16f9dc07546",
"assets/assets/guides/05.wav": "75241236577a90e97b2f556c53574371",
"assets/assets/guides/06.wav": "0677a608a588f9df7a5677810c202443",
"assets/assets/guides/07.wav": "6dc530d39f23ba857ca020f7f9dee1bd",
"assets/assets/guides/08.wav": "70a7166cdc9a705ee65ab5c638a210c2",
"assets/assets/guides/09.wav": "e9af11a0370520d6f9e19e3660f06aad",
"assets/assets/guides/10.wav": "bf67ef99bcb78a15a783d58d14c78c4e",
"assets/assets/guides/11.wav": "b9ad4200150713dedaa2989fa44eeac7",
"assets/assets/guides/12.wav": "c28458c476b363db6ab89d8d21b7846e",
"assets/assets/guides/13.wav": "39ddc98384d57200b072a1fde996a22b",
"assets/assets/guides/14.wav": "8857c3c2868f2dffa802a2bae7da8b0f",
"assets/assets/guides/15.wav": "06e9db929401e5f9828803f338a7bbed",
"assets/assets/guides/16.wav": "50b6ec4627dd7d6960fa7a2eab3e0f4f",
"assets/assets/guides/17-1.wav": "e6a66d85670e89bb5e76163c356516ff",
"assets/assets/guides/17.wav": "a427b5e66ac8fccd524f83e6d0d63596",
"assets/assets/guides/18.wav": "90d27aa6ad13496b921060ce5088b038",
"assets/assets/guides/19.wav": "8fc60562bd6003b9e6e482526c4e8466",
"assets/assets/guides/20.wav": "1ef1362037f41da3055fb0a5a9ae04b3",
"assets/assets/guides/21.wav": "411d755996ee2cf4119c23236a5a5b54",
"assets/assets/guides/22.wav": "363509511577d0645be461eea267535f",
"assets/assets/guides/23.wav": "7c84923ea5e1f153451edf3e928c65f5",
"assets/assets/guides/24.wav": "ae12dc322b645ae291259f8384e7ef59",
"assets/assets/guides/25.wav": "a13486f2da37d31d2c2677a7da431c31",
"assets/assets/guides/26.wav": "db8806e8e8a787bc4a0bf63766ded972",
"assets/assets/guides/27.wav": "4dc4ca2e2b657a7bb7a49c913689f855",
"assets/assets/guides/28.wav": "b6b543449d5d3a3b0777349fa61c3433",
"assets/assets/guides/29.wav": "0398d0e05103051816438c2ec1841d8e",
"assets/assets/guides/30.wav": "710b12005789845db4616c4ffc75919a",
"assets/assets/guides/31.wav": "ab0b2f269bdb55a640a1a5f922cf2693",
"assets/assets/guides/32.wav": "6cefe0f49d483949d2e116e460e8d27b",
"assets/assets/guides/new_1.mp3": "4595ef2b70087467f35f9c5dc147ac52",
"assets/assets/guides/new_10.wav": "4ca9c08d8ed686537d315b3195082236",
"assets/assets/guides/new_13.wav": "8415b5dc15256706968f1948119dd907",
"assets/assets/guides/new_16.wav": "e6388bae43e7ea83ed3bcbb087d7c116",
"assets/assets/guides/new_17.wav": "8feb3bb8264d95a47845ac7b44cae87a",
"assets/assets/guides/new_18.wav": "b389b88d12dce532fe6bc9156876c480",
"assets/assets/guides/new_19.wav": "93685303ccd7f12f1d3fc3f3bd89c1b9",
"assets/assets/guides/new_2.wav": "e59fc60a6ac2cf26c30bf14db4f439e9",
"assets/assets/guides/new_20.wav": "8f32223f094877dadf8486de4079c592",
"assets/assets/guides/new_3.wav": "b2700b4bdd2cc89cbaa932d75d50aa9b",
"assets/assets/guides/new_4.wav": "8380b9898ea795ae0b3c0d5f8e145c93",
"assets/assets/guides/new_5.wav": "bc749dbc859d0fd26e5f3258a6cfa86c",
"assets/assets/images/check.png": "638c413c07a8ccc4ef212678afb3c680",
"assets/assets/images/icons/%25EA%25B0%2595%25EB%25AC%25BC.png": "ada5d798b2bcba052fc79f6e664938da",
"assets/assets/images/icons/%25EA%25B4%2591%25EB%25B6%2580.png": "5f42878683480da4fc9464509d972d4e",
"assets/assets/images/icons/%25EA%25B5%25AC%25EB%25A6%2584.png": "b749e302a2a3c6734ec30b071a664c8e",
"assets/assets/images/icons/%25EA%25B8%25B0%25ED%2583%2580.png": "890d3b635f7e395c4087f1e03a8f07f6",
"assets/assets/images/icons/%25EA%25B8%25B8%25EB%25AA%25A9.png": "9e0cbf5ed3fdde32223434dd1240c1e4",
"assets/assets/images/icons/%25EA%25B8%25B8.png": "2936d617b0d0b568ae9b33b9adb2a3ab",
"assets/assets/images/icons/%25EA%25BD%2583.png": "ffb6dfa85930482108277d8b65c3add8",
"assets/assets/images/icons/%25EB%2582%2598%25EB%25AC%25B4.png": "7fccad1b159b99ca0399d3d636b05c66",
"assets/assets/images/icons/%25EB%2582%2598%25EB%25AD%2587%25EA%25B0%2580%25EC%25A7%2580.png": "649ac258352785ef8dc34139a5eef281",
"assets/assets/images/icons/%25EB%2585%25B8%25EB%259E%2598.png": "951f235de048f61cf802a97f6e54639a",
"assets/assets/images/icons/%25EB%2588%2588%25EA%25BD%2583.png": "325ed6ae118b6c03ed43178b3181a02d",
"assets/assets/images/icons/%25EB%2588%2588%25EB%25B9%259B.png": "2362cdc207bf54266c10886dc0a34b53",
"assets/assets/images/icons/%25EB%2588%2588.png": "573baa559d63d133440f9fc9bd5bc166",
"assets/assets/images/icons/%25EB%2588%2588eye.png": "baeecad1fa10bef5c2a86fd92a96e937",
"assets/assets/images/icons/%25EB%258B%25A4%25EB%25A6%25AC.png": "36be651ce87ff8ae57b9491b937d63cc",
"assets/assets/images/icons/%25EB%258B%25AC.png": "b2260672469c3642c7bd76368d4807bb",
"assets/assets/images/icons/%25EB%2593%25A4%25ED%258C%2590.png": "f6fb880e9398ae1394d0738211f4d990",
"assets/assets/images/icons/%25EB%2593%25B1%25EB%258C%2580.png": "b011f47fffc9e072b58fb74f76be669a",
"assets/assets/images/icons/%25EB%2595%2580%25EB%25B0%25A9%25EC%259A%25B8.png": "feb03cd52166e3fef8cfee7b92886ad8",
"assets/assets/images/icons/%25EB%2595%2580.png": "efeb916c50af9737277327e775902cf7",
"assets/assets/images/icons/%25EB%25A7%2588%25EC%259D%2584.png": "d3f29bf593b36e32f8c9b652e4ea7e71",
"assets/assets/images/icons/%25EB%25A7%2588%25EC%259D%258C.png": "21e52daeda9a2ca46aaa85461aa96eec",
"assets/assets/images/icons/%25EB%25A7%2590.png": "9b43f7f33f26ceb6076f2691fa72cced",
"assets/assets/images/icons/%25EB%25AA%25A8%25EB%258B%25A5%25EB%25B6%2588.png": "b286951cb0ae75c6fac768b063b5f12f",
"assets/assets/images/icons/%25EB%25AA%25A8%25EB%259E%2598.png": "c8082419444f9b4b58f7b61db3b29369",
"assets/assets/images/icons/%25EB%25AC%25B4%25EB%258C%2580.png": "2ae3638d89200f98e9da3b62ccf800a3",
"assets/assets/images/icons/%25EB%25AC%25B8.png": "5bda7cf5d22cc2c66a9e3709667b7274",
"assets/assets/images/icons/%25EB%25AC%25BC%25EA%25B2%25B0.png": "96008a7b90ef319fdfd53bd74173807c",
"assets/assets/images/icons/%25EB%25AF%25B8%25EC%2586%258C.png": "8977dfec2f3ccf4443166c3f488ee01e",
"assets/assets/images/icons/%25EB%25B0%2594%25EB%259E%258C.png": "bed93d02f65568c435fca287c4a79428",
"assets/assets/images/icons/%25EB%25B0%259C%25EA%25B5%25BD.png": "75ed99d7ffc562f36fe331eb369d2625",
"assets/assets/images/icons/%25EB%25B0%25B0.png": "42aaf34143910d86acc06f1c1384b569",
"assets/assets/images/icons/%25EB%25B3%2584%25EB%25B9%259B.png": "d55eedfdc3e3f10979ba756a8b93ccc1",
"assets/assets/images/icons/%25EB%25B3%2584.png": "bd5a9c36d8f3c8d40d3c5500fad5e77c",
"assets/assets/images/icons/%25EB%25B3%2591%25EC%2582%25AC.png": "30ed29dca09b51013250495b7242442b",
"assets/assets/images/icons/%25EB%25B3%25B4%25EC%2584%259D.png": "132af6715b2be16748a5e6f6b9cc6586",
"assets/assets/images/icons/%25EB%25B6%2580%25EB%2591%2590.png": "a9e8b4a472c7843a6a628e623ebc0398",
"assets/assets/images/icons/%25EC%2582%25AC%25EB%259E%258C.png": "474e996406653cb278b2c61f0d51edc4",
"assets/assets/images/icons/%25EC%2582%25AC%25EB%259E%2591.png": "21e52daeda9a2ca46aaa85461aa96eec",
"assets/assets/images/icons/%25EC%2582%25AC%25EC%25A7%2584.png": "59d0c41197e4bceac7c5ab3b5058f451",
"assets/assets/images/icons/%25EC%2582%25AC%25EC%25B0%25B0.png": "5d2dc1c0cce3b113cce01231f699a986",
"assets/assets/images/icons/%25EC%2582%25B0%25EA%25B3%25A8.png": "a9a2925a0eb239fb443e7730c6125f69",
"assets/assets/images/icons/%25EC%2582%25B0.png": "763e072f91e9f87405e17b0f9fda44b1",
"assets/assets/images/icons/%25EC%2583%2588.png": "c7e8dc1e76513403baa868f9a5b2d137",
"assets/assets/images/icons/%25EC%2584%25AC.png": "d1cbecea72804a63203c977003eca38b",
"assets/assets/images/icons/%25EC%2586%258C%25EB%25A6%25AC.png": "7c6335255300ec80518ca712a6147113",
"assets/assets/images/icons/%25EC%2586%258C%25EC%258B%259D.png": "f2e15ec644aed48647402d2866799ea9",
"assets/assets/images/icons/%25EC%2588%2598%25ED%258F%2589%25EC%2584%25A0.png": "76aa2ec788bfa25080c9189d542350c8",
"assets/assets/images/icons/%25EC%2594%25A8%25EC%2595%2597.png": "0edce6a5700d4bd576f95e8cecc33765",
"assets/assets/images/icons/%25EC%2597%2584%25EB%25A7%2588.png": "2f819878c438fe9952230ab4307f468a",
"assets/assets/images/icons/%25EC%259B%2583%25EC%259D%258C%25EC%2586%258C%25EB%25A6%25AC.png": "796f405d349c899c5dd7bf89f14ca17d",
"assets/assets/images/icons/%25EC%259D%258C%25ED%2591%259C.png": "951f235de048f61cf802a97f6e54639a",
"assets/assets/images/icons/%25EC%259E%258E%25EC%2583%2588.png": "872c41d479fd00665b362d519331fc49",
"assets/assets/images/icons/%25EC%25A0%2584%25EA%25B5%25AC.png": "027afbf8e7d2e926e60522402c6c108e",
"assets/assets/images/icons/%25EC%25A1%25B0%25EB%25AA%2585.png": "631306f544653568d288c50bf0ef138e",
"assets/assets/images/icons/%25EC%25B0%25BD%25EA%25B0%2580.png": "9a5c7f6f15b62091890f1de453ef816c",
"assets/assets/images/icons/%25EC%25B0%25BD.png": "58809a9fd255954b5685f9f0418c0fe5",
"assets/assets/images/icons/%25EC%25B2%25A8%25ED%2583%2591.png": "0dfcad299f45eeff62dfcc8c4134a551",
"assets/assets/images/icons/%25EC%25BB%25A4%25ED%2594%25BC.png": "efc5bcc4d65cdcf4d28674052c221e54",
"assets/assets/images/icons/%25ED%2586%25B5%25EA%25B8%25B0%25ED%2583%2580.png": "4400b46dc73e5eb24bd6fc59039063cb",
"assets/assets/images/icons/%25ED%258C%258C%25EB%258F%2584.png": "10bdc082140c129bc041f699611211c8",
"assets/assets/images/icons/%25ED%2595%2598%25EB%258A%2598.png": "77091508eb099630d4fb06cbbb322502",
"assets/assets/images/icons/%25ED%2595%25B4%25EB%25B3%2580%25EA%25B0%2580.png": "09d6d08c6010a5c0b72b0361fb453c84",
"assets/assets/images/icons/%25ED%2596%25A5%25EA%25B8%25B0.png": "4e3c1e54f3d3b47c13fe05c9ab83dcd1",
"assets/assets/images/icons/%25ED%2598%25B8%25EC%2588%2598.png": "ad715f3509d4202d625150d2b5b011b9",
"assets/assets/images/icons/%25ED%259E%2598.png": "a5d01e3798d94324d57de1064ef01ea6",
"assets/assets/images/logo_blue.png": "f58ec5644c216a0aeacd6288e5298f9f",
"assets/assets/images/logo_small.png": "dbb298939d9fb02ee8856975b9f9ee71",
"assets/assets/images/reward.png": "bf2f2a8c4bdd2b0c81384f46daf60ec4",
"assets/FontManifest.json": "4b2d051a2a3bbe83436307e51dd04e8f",
"assets/fonts/MaterialIcons-Regular.otf": "821002ce09ecf84c9ad6e60a771b7cd3",
"assets/NOTICES": "ed6ca6cdbee0964e2b854d555812a183",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/record_web/assets/js/record.fixwebmduration.js": "1f0108ea80c8951ba702ced40cf8cdce",
"assets/packages/record_web/assets/js/record.worklet.js": "8a5f575ecdf23f21bcae8204882d54bb",
"assets/packages/wakelock_plus/assets/no_sleep.js": "7748a45cd593f33280669b29c2c8919a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"flutter_bootstrap.js": "9e169f72f0f428e4a9b3aea2beac8a76",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "acf3da7552f7208d1279248e44b28e85",
"/": "acf3da7552f7208d1279248e44b28e85",
"main.dart.js": "65ee3eb8c046c51bed8a445b626de6ca",
"manifest.json": "b2b57b579f2fe71eccfd0da1d36474a1",
"version.json": "2e39b50a165bbab72e44e615896791a2"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
