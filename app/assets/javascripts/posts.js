checked = []

function like(id){
	//Increment the likes count in the back end, (it will also increment the user score)
	$.get("/posts/" + id + "/like", function(data){
		console.log("here");
		console.log(data);
		var likes_count = $("[post_id='"+ id +"']" + " .likes_count")[0];
		likes_count.textContent = data;
	});

	$("#like_button_" + id).addClass("disabled");


}


function filter(category){
	//Categories that the user will filter for, these are the actual categories
	//eg. ["Chemistry", "Biology", "Physics"] 

	var obj = $("#checkbox_" + category)[0];
	if (obj.checked == false) {
		checked.push(category);
	}
	else{
		checked.pop(category);
	}

	var jqxhr = $.get("/posts/filter", { 'categories[]' : checked }, function(data){
		$("#posts_row")[0].innerHTML = data;
		rerender_latex();
	});

}

function rerender_latex(){
	MathJax.Hub.Queue(["Typeset",MathJax.Hub]);
}



