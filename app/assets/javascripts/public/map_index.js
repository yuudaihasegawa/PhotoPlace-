//マップオブジェクト
var gMap = '<%= @posts %>';
//マーカーオブジェクト
var gMarkerCenter = '<%= @posts %>';
 
function initMap() {
    //とりあえず、東京都庁を中心にする
    var lat = 35.6896342;
    var lng = 139.6921006999999;
 
    //座標を設定
    var myLatLng = new google.maps.LatLng(lat, lng)
    var mapOptions = {
        center: myLatLng,
        zoom: 15,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
 
    // マップオブジェクトの生成、マーカー生成
    gMap = new google.maps.Map(document.getElementById("map"), mapOptions);
    gMarkerCenter = drawMarkerCenterInit(myLatLng);
}
 
//マーカー生成関数
function drawMarkerCenterInit(pos) {
    var markerCenter = new google.maps.Marker({
        position: pos,
        map: gMap,
        draggable: true // ドラッグ可能にする
    });
    return markerCenter;
}