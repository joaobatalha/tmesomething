checked = []

function like(id){
	//Increment the likes count in the back end, (it will also increment the user score)
	$.get("/posts/" + id + "/like", function(data){
		set_likes_count(id, data);
	});

	$("#like_button_" + id).addClass("disabled");

	//Increment the likes count in the front end
	// likes_count = parseInt($("#likes_count_" + id)[0].innerText);
	// likes_count += 1;
	// $("#likes_count_" + id)[0].innerText = likes_count;
}

function set_likes_count(id, count){
	$("#likes_count_" + id)[0].innerText = count;

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



