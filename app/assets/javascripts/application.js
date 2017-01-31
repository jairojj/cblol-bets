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