<!DOCTYPE html>
<html>
<body>
<div class="container">

<h2><p> <i class="marker icon"></i>9, Omirou Str. 177 78, Tavros</p></h2>
<h2><p> <i class="call icon"></i>+30 210 9549 400 / 402 </p></h2>
<h2><p> <i class="mail icon"></i>itsec@hua.gr</p></h2>
<div id="map" style="width:400px;height:400px;background:yellow"></div>
</div>
<script>
function myMap() {
  var myCenter = new google.maps.LatLng(37.962001, 23.701034);
  var mapCanvas = document.getElementById("map");
  var mapOptions = {center: myCenter, zoom: 15};
  var map = new google.maps.Map(mapCanvas, mapOptions);
  var marker = new google.maps.Marker({position:myCenter});
  marker.setMap(map);
}
</script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAXXMgTZz59lhq4njaoQUEbrEHzeNaBgrA&callback=myMap"></script>
<!--
To use this code on your website, get a free API key from Google.
Read more at: https://www.w3schools.com/graphics/google_maps_basic.asp
-->

</body>
</html>
