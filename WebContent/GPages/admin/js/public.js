$(document).ready(function(){
	
 //Tabel Interlaced background color 2015-04-20 DeathGhost
 $('.Interlaced tr:odd').addClass('trbgcolor');
 //left menu toggle style
 $('.menu-list-title').click(function(){
	   $(this).next('li').toggle('1500');
	  });
 //menu current background color
 $(".menu-children li").click(function(){
	 $(".menu-children li").css({background:'none'});
	 $(this).css({background:'#f35844'});
	});
 
});
$(document).ready(function(){
	$("span").each(function(){
		var cont=$("#colors").text();
		if(cont=="待发货")
			$("#colors").addClass("red");
		else if(cont=="待收货")
			$("#colors").addClass("blue");
		else
			$("#colors").addClass("green");
	});
	
});
