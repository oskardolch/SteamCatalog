
function searchEngineTypeCBChange(engine_type_id){
  $.ajax({
    method: "POST",
    url: "/search/filter/type",
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

function searchOperatorCBChange(operator_id){
  $.ajax({
    method: "POST",
    url: "/search/filter/operator",
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

