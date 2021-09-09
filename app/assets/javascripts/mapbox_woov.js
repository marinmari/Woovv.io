window.onload = function() {
  // The value for 'accessToken' begins with 'pk...'
  var coordinates = document.getElementById("map").attributes[1].value
  console.log(typeof coordinates)
  coordinates = coordinates.replace('[', '').replace(']', '').replace(/,/g, '').split(' ').map(Number)
  // coordinates[0] typeof = number 
  console.log(typeof coordinates[0])
  for (i = 0; i < coordinates.length; i+=2) {
  console.log(typeof parseFloat(coordinates[i]/1000000), typeof parseFloat(coordinates[i+1]/1000000) )
  console.log([parseFloat(coordinates[i]/1000000), parseFloat(coordinates[i+1]/1000000)])
  }
  mapboxgl.accessToken = 'pk.eyJ1IjoiYW1lbGllbG91bGVyZ3VlIiwiYSI6ImNrdDhoanZ3NjEyZGkyb3BlZ3oxMTBmeHEifQ.ir5tEud5r6CmrJUyTuG-yw'; 
  const map = new mapboxgl.Map({
    container: 'map',
    // Replace YOUR_STYLE_URL with your style URL.
    style: 'mapbox://styles/amelieloulergue/ckt8hlgfo20tr19v18ez6bpe3', 
    center: [2.5, 47],
    zoom: 4.5
  });
  // Set marker options.
  for (i = 0; i < coordinates.length; i+=2) { 
    const marker = new mapboxgl.Marker({
      color: "#92DACA",
      draggable: true
  }).setLngLat([coordinates[i], coordinates[i+1]])
      .addTo(map);
  }
  
  // Code from the next step will go here.
  }