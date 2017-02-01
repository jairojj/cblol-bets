//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

$(function(){
  $('#bet_resultado_time1').on('change', function (e) {
    var valueSelected = this.value;
    if(valueSelected == 'vitoria'){
      $('#bet_resultado_time2').val('derrota');
    }
    else if(valueSelected == 'derrota'){
      $('#bet_resultado_time2').val('vitoria');
    }
    else if(valueSelected == 'empate'){
      $('#bet_resultado_time2').val('empate');
    }
    else{
      $('#bet_resultado_time2').val('null');
    }
  });
  
    $('#bet_resultado_time2').on('change', function (e) {
    var valueSelected = this.value;
    if(valueSelected == 'vitoria'){
      $('#bet_resultado_time1').val('derrota');
    }
    else if(valueSelected == 'derrota'){
      $('#bet_resultado_time1').val('vitoria');
    }
    else if(valueSelected == 'empate'){
      $('#bet_resultado_time1').val('empate');
    }
    else {
      $('#bet_resultado_time1').val('null');
    }
  });  

})

// Modal Image Gallery
function onClick(element) {
  document.getElementById("img01").src = element.src;
  document.getElementById("modal01").style.display = "block";
  var captionText = document.getElementById("caption");
  captionText.innerHTML = element.alt;
}


// Toggle between showing and hiding the sidenav when clicking the menu icon

function w3_open() {
  var mySidenav = document.getElementById("mySidenav");
  
    if (mySidenav.style.display === 'block') {
        mySidenav.style.display = 'none';
    } else {
        mySidenav.style.display = 'block';
    }
}

// Close the sidenav with the close button
function w3_close() {
    var mySidenav = document.getElementById("mySidenav");
    mySidenav.style.display = "none";
}