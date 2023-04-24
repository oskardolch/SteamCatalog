
function enginesEngineTypeCBChange(engine_type_id){
  $.ajax({
    method: "POST",
    url: "/engines/filter/type",
    data: {
      authenticity_token: $('meta[name="csrf-token"]')[0].content,
      id: engine_type_id
    }
  }).done(function(html){
    location.reload();
  }).fail(function(html){
    console.log("Failed");
  });
};

function enginesOperatorCBChange(operator_id){
  $.ajax({
    method: "POST",
    url: "/engines/filter/operator",
    data: {
      authenticity_token: $('meta[name="csrf-token"]')[0].content,
      id: operator_id
    }
  }).done(function(html){
    location.reload();
  }).fail(function(html){
    console.log("Failed");
  });
};

