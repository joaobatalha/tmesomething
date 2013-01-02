function like(id){
	//Increment the likes count in the back end, (it will also increment the user score)
	var a = $.get("/posts/" + id + "/like", function(data){
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