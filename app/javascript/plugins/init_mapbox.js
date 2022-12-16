// import mapboxgl from 'mapbox-gl/dist/mapbox-gl-csp';
// import 'mapbox-gl/dist/mapbox-gl.css';

// const initMapbox = () => {
//   const mapElement = document.getElementById('map');

//   const addMarkersToMap = (markers, map) => {
//     markers.forEach((marker) => {
//     const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
//     const element = document.createElement('div');
//     element.className = 'marker';
//     element.style.backgroundImage = `url('https://res.cloudinary.com/dihaz37dr/image/upload/v1624893700/ancre_k4j1qi.svg')`;
//     element.style.backgroundSize = 'contain';
//     element.style.width = '60px';
//     element.style.height = '60px';
//     new mapboxgl.Marker(element)
//       .setLngLat([ marker.lng, marker.lat])
//       .setPopup(popup)
//       .addTo(map)
//     })
//   };

//   const fitMapToMarkers = (map, markers) => {
//     const bounds = new mapboxgl.LngLatBounds();
//     markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
//     map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
//   };

//   if (mapElement) {
//     const markers = JSON.parse(mapElement.dataset.markers);
//     console.log(markers)
//     mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
//     const map = new mapboxgl.Map({
//       container: 'map',
//       style: 'mapbox://styles/mapbox/streets-v11'
//     });

//     addMarkersToMap(markers, map)
//     fitMapToMarkers(map, markers);
//   }
// };

// export { initMapbox };