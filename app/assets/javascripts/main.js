function langCBChange(langid){
  $.ajax({
    method: "POST",
    url: "/language/change",
    data: {
      authenticity_token: $('meta[name="csrf-token"]')[0].content,
      id: langid
    }
  }).done(function(html){
    location.reload();
  }).fail(function(html){
    console.log("Failed");
  });
};

