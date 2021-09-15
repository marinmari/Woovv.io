
window.onload = function () {
  // The value for 'accessToken' begins with 'pk...'
  var co_id = document.getElementById("map").attributes[2].value
  co_id = co_id.replace('[', '').replace(']', '').split(', ').map(Number)
  var coordinates = document.getElementById("map").attributes[1].value
  var box_focus = document.getElementById("map").attributes[3].value
  coordinates = coordinates.replace('[[', '').replace(']]', '')
  coordinates = coordinates.split('], [').map(c => c.split(', ')).map(c => c.map(Number))
  var latitudes = coordinates.map(c => c[0]).filter(lat => lat !== 0)
  var longitudes = coordinates.map(c => c[1]).filter(lon => lon !== 0)

  if (box_focus === 'France') {
    var box_upper_lat = 6
    var box_bottom_lat = -1
    var box_right_lon = 52
    var box_left_lon = 42
  } else {
    var box_upper_lat = Math.max(...latitudes) + 0.05
    var box_bottom_lat = Math.min(...latitudes) - 0.05
    var box_right_lon = Math.max(...longitudes) + 0.05
    var box_left_lon = Math.min(...longitudes) - 0.05
  }

  mapboxgl.accessToken = 'pk.eyJ1IjoiYW1lbGllbG91bGVyZ3VlIiwiYSI6ImNrdDhoanZ3NjEyZGkyb3BlZ3oxMTBmeHEifQ.ir5tEud5r6CmrJUyTuG-yw';

  const map = new mapboxgl.Map({
    container: 'map',
    // Replace YOUR_STYLE_URL with your style URL.
    style: 'mapbox://styles/amelieloulergue/ckt8hlgfo20tr19v18ez6bpe3',
    center: [coordinates[0][0], coordinates[0][1]],
    zoom: 1
  });
  // Set marker options.
  var group = []
  for (i = 0; i < coordinates.length; i++) {
    const newChildforPopup = document.getElementById('cwtoshow-' + co_id[i])
    const popup = new mapboxgl.Popup({ closeOnClick: true })
      .setLngLat([coordinates[i][0], coordinates[i][1]])
      .setHTML(newChildforPopup.innerHTML)
    const marker = new mapboxgl.Marker({
      color: "#92DACA",
      draggable: false,
    }).setLngLat([coordinates[i][0], coordinates[i][1]])
      .setPopup(popup)
      .addTo(map);
    group.push(marker);
  }
  
  map.fitBounds([
    [box_upper_lat, box_right_lon], // southwestern corner of the bounds
    [box_bottom_lat, box_left_lon] // northeastern corner of the bounds
  ]);
  const geocoder = new MapboxGeocoder({
    // Initialize the geocoder
    accessToken: mapboxgl.accessToken, // Set the access token
    mapboxgl: mapboxgl, // Set the mapbox-gl instance
    placeholder: 'Rechercher une adresse', // Placeholder text for the search bar
    zoom: 12,
    types:'country,region,place,postcode,locality,address',
    countries: "fr"
  });
  // Add the geocoder to the map
  map.addControl(geocoder);
  // Code from the next step will go here.

}
