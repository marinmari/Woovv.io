window.onload = function () {
  // The value for 'accessToken' begins with 'pk...'
  console.log(document.getElementById("map").attributes)
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
    const marker = new mapboxgl.Marker({
      color: "#92DACA",
      draggable: false,
    }).setLngLat([coordinates[i][0], coordinates[i][1]])
      .addTo(map);
    group.push(marker);
    marker._element.id = co_id[i]
    marker.getElement().addEventListener('click', (e) => {
  
      console.log(e.path[4].id);
      show_coworking(e.path[4].id)
    });
  }
  map.fitBounds([
    [box_upper_lat, box_right_lon], // southwestern corner of the bounds
    [box_bottom_lat, box_left_lon] // northeastern corner of the bounds
  ]);
 
  // Code from the next step will go here.

} 
function show_coworking(cw_id) {
  const child = document.getElementById(cw_id)
  child.parentNode.remove()
  const newChild = document.createElement(child);
  console.log(child)
  }