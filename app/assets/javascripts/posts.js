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
	var checkboxes = $(".custom.checkbox");
	//Categories that the user will filter for, these are the actual categories
	//eg. ["Chemistry", "Biology", "Physics"] 
	var checked = []; 
	var id;
	for(var i = 0; i < checkboxes.length; i++){
		id = checkboxes[i].id;
		if($("#" + id).hasClass("checked")){
			checked.push(id.split("_")[2]);
		}
	}

	if($("#checkbox_span_" + category).hasClass("checked")){
		checked.pop(category);
	}
	else{
		checked.push(category);
	}


	console.log(checked);
	if ($("#checkbox_span_" + category).hasClass("checked") == false){
		$.get("/posts/filter", { 'categories[]' : checked }, function(data){
			$("#posts_row")[0].innerHTML = data;
		});
	}

}