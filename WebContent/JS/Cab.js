mapboxgl.accessToken = 'pk.eyJ1IjoiZGVic2VuODUiLCJhIjoiY2ttaXdyM3M5MGxqODJxcTRsOXhqanl4ZCJ9.aDBgs9MNVGhqUk98bxqGYQ';

navigator.geolocation.getCurrentPosition(successLocation, errorLocation, {
  enableHighAccuracy: true
})

function successLocation(position) {
  setupMap([position.coords.longitude, position.coords.latitude])
  function setupMap(center) {
    var map = new mapboxgl.Map({
      container: "map",
      style: "mapbox://styles/mapbox/streets-v11",
      center: center,
      zoom: 15
    })

    var marker1 = new mapboxgl.Marker().setLngLat(center).addTo(map);

    const nav = new mapboxgl.NavigationControl()
    map.addControl(nav)

    var directions = new MapboxDirections({
      accessToken: mapboxgl.accessToken,
      unit: 'metric'
    })
    directions.on('route', e => {
        let routes = e.route
        console.log(routes);
        for (var i=0; i<routes.map(r => r.legs[0].steps.length); i++) {
          if (routes.map(r => r.legs[0].steps[i].name)!="") {
            document.getElementById("inp2").value=routes.map(r => r.legs[0].steps[i].name)+".";
            break;
          }
        }
        for (var i=routes.map(r => r.legs[0].steps.length)-1; i>=0; i--) {
            if (routes.map(r => r.legs[0].steps[i].name)!="") {
            document.getElementById("inp3").value=routes.map(r => r.legs[0].steps[i].name)+".";
            break;
          }
        }
        var distance=routes.map(r => r.distance);
        distance=(distance/1000).toFixed(2);
        document.getElementById("inp5").value=distance+" Kilometers."
        var time=Math.round(routes.map(r => r.duration));        
        if (time<3600.0) {
          time=Math.round(time/60);
          document.getElementById("inp6").value=time+" minutes."
        }
        else {
          let hr=Math.floor(time/3600);
          let min=Math.round((time%3600)/60);
          document.getElementById("inp6").value=hr+" hours and "+min+" minutes."
        }
      });
    map.addControl(directions, "top-left")

    map.addControl(
      new mapboxgl.GeolocateControl({
        positionOptions: {
          enableHighAccuracy: true
        },
        trackUserLocation: true
      })
    );
  }
}  

function errorLocation() {
  setupMap([-2.24, 53.48])
}