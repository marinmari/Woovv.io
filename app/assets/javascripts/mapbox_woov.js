
window.onload = function () {
  const mapElement = document.getElementById('map');
  const geoElement = document.getElementById('geocoder');
  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  } else {
    mapboxgl.accessToken = geoElement.dataset.mapboxApiKey;
  }
  var coordinates = document.getElementById("map")
  if (!coordinates) {
    const geocoder = new MapboxGeocoder({
      // Initialize the geocoder
      accessToken: mapboxgl.accessToken, // Set the access token
      mapboxgl: mapboxgl, // Set the mapbox-gl instance
      placeholder: 'Rechercher un coworking', // Placeholder text for the search bar
      zoom: 12,
      types: 'country,region,place,postcode,locality,address',
      countries: "fr"
    });
    geocoder.addTo('#geocoder');
      
      // Get the geocoder results container.
      const results = document.getElementById('result');
      console.log(results)
      // Add geocoder result to container.
      geocoder.on('result', (e) => {
        // var tag = document.createElement('<form accept-charset="UTF-8" action="/" method="get"><input name="authenticity_token" type="hidden" value="J7CBxfHalt49OSHp27hblqK20c9PgwJ108nDHX/8Cts="/><input name="geocode_information" type="hidden"value="'+JSON.stringify(e.result, null, 2)+'"/></form>');
        let divFormu = document.createElement('div')
        let formuTest = document.createElement('form')
        let inputTest = document.createElement('input')
        let inputGeo = document.createElement('input')
        // let btnGeo = document.createElement('input')
        divFormu.appendChild(formuTest)
        formuTest.action = '/coworkings'
        formuTest.method ='GET'
        formuTest.id="jsform"
        inputTest.name="authenticity_token"
        inputTest.type="hidden"
        inputTest.value=""
        inputGeo.name ="geocode_information"
        inputGeo.type = "hidden"
        inputGeo.value= JSON.stringify(e.result, null, 2)
        // btnGeo.type = "submit"
        // btnGeo.value = "Valider"
        // btnGeo.name = "btnGeo"
        // btnGeo.className ="btn btn-primary search-btn"
        console.log(formuTest)
        formuTest.appendChild(inputTest)
        formuTest.appendChild(inputGeo)
        // formuTest.appendChild(btnGeo)
        console.log(results)
        results.innerHTML += divFormu.innerHTML
        document.getElementById('jsform').submit()
      });
      
      // Clear results container when search is cleared.
      geocoder.on('clear', () => {
      results.innerText = '';
      });
  } else {
    if (document.getElementById("map").attributes[4]){
    var research = document.getElementById("map").attributes[4].value.replace('[', '').replace(']', '').split(', ').map(Number)
    }
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
    const map = new mapboxgl.Map({
      container: 'map',
      // Replace YOUR_STYLE_URL with your style URL.
      style: 'mapbox://styles/amelieloulergue/ckt8hlgfo20tr19v18ez6bpe3',
      center: [coordinates[0][0], coordinates[0][1]],
      zoom: 1
    });
    // Set marker options.
    var group = []
    console.log(coordinates.length)
    if (coordinates.length > 1) {
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
    } else {
      for (i = 0; i < coordinates.length; i++) {
        const marker = new mapboxgl.Marker({
          color: "#92DACA",
          draggable: false,
        }).setLngLat([coordinates[i][0], coordinates[i][1]])
          .addTo(map);
        group.push(marker)
      }
    }
    
    map.fitBounds([
      [box_upper_lat, box_right_lon], // southwestern corner of the bounds
      [box_bottom_lat, box_left_lon] // northeastern corner of the bounds
    ]);
      
      const geocoder2 = new MapboxGeocoder({
        // Initialize the geocoder
        accessToken: mapboxgl.accessToken, // Set the access token
        mapboxgl: mapboxgl, // Set the mapbox-gl instance
        placeholder: 'Rechercher un coworking', // Placeholder text for the search bar
        marker:true,
        zoom: 8,
        types: 'country,region,place,postcode,locality,address',
        countries: "fr"
      });
      geocoder2.addTo('#geocoder');
        
        // Get the geocoder results container.
        const results = document.getElementById('result');
        console.log(results)
        // Add geocoder result to container.
        geocoder2.on('result', (e) => {
          // var tag = document.createElement('<form accept-charset="UTF-8" action="/" method="get"><input name="authenticity_token" type="hidden" value="J7CBxfHalt49OSHp27hblqK20c9PgwJ108nDHX/8Cts="/><input name="geocode_information" type="hidden"value="'+JSON.stringify(e.result, null, 2)+'"/></form>');
          let divFormu = document.createElement('div')
          let formuTest = document.createElement('form')
          let inputTest = document.createElement('input')
          let inputGeo = document.createElement('input')
          // let btnGeo = document.createElement('input')
          divFormu.appendChild(formuTest)
          formuTest.action = '/coworkings'
          formuTest.method ='GET'
          formuTest.id="jsform"
          inputTest.name="authenticity_token"
          inputTest.type="hidden"
          inputTest.value=""
          inputGeo.name ="geocode_information"
          inputGeo.type = "hidden"
          inputGeo.value= JSON.stringify(e.result, null, 2)
          // btnGeo.type = "submit"
          // btnGeo.value = "Valider"
          // btnGeo.name = "btnGeo"
          // btnGeo.className ="btn btn-primary search-btn"
          console.log(formuTest)
          formuTest.appendChild(inputTest)
          formuTest.appendChild(inputGeo)
          // formuTest.appendChild(btnGeo)
          console.log(results)
          results.innerHTML += divFormu.innerHTML
          document.getElementById('jsform').submit()
        });
        
        // Clear results container when search is cleared.
        geocoder2.on('clear', () => {
        results.innerText = '';
        });
        new mapboxgl.Marker({
          color: "#008080",
          draggable: false,
        }).setLngLat(research)
          .addTo(map)    
  }
}
