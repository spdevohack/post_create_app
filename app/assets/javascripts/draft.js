var draftBtn = document.querySelector("#draft-btn");
var title = document.querySelector("#post_title");
var desc = document.querySelector("#post_description");

var attachment = document.querySelector("#post_attachment");

draftBtn.addEventListener("click", saveDraft)
function saveDraft(e){
  console.log("draft click");
  // form.submit();
    $.ajax({
      type: "POST",
      url: "/draft",
      data: { post: { title: title.value, description: desc.value } }

    })

}