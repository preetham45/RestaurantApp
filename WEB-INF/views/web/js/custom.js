$(document).ready(function() {

var dishes = [{"type":"Appetizer","name":"Palak Pakoda","price":"5.00"},{"type":"Appetizer","name":"Veg. Pakoda","price":"5.00"},{"type":"Basmati Rice","name":"Mutton Biryani","price":"14.00"},{"type":"Basmati Rice","name":"Chicken Biryani","price":"13.00"},{"type":"Basmati Rice","name":"Bagara Rice w/ Dalcha","price":"7.00"},{"type":"Basmati Rice","name":"Vegetable Biryani","price":"10.00"},{"type":"Basmati Rice","name":"Special Fried Rice","price":"10.00"},{"type":"Basmati Rice","name":"Plain rice","price":"5.00"},{"type":"Rotis","name":"Roti","price":"1.00"},{"type":"Rotis","name":"Naan","price":"2.00"},{"type":"Rotis","name":"Pudina/Garlic Paratha","price":"2.50"},{"type":"Rotis","name":"Butter Naan","price":"2.50"},{"type":"Rotis","name":"Special Kulcha","price":"3.00"},{"type":"Tandoori Specialties","name":"Tandoori Chicken (full/half)","price":"24.00/12.00"},{"type":"Tandoori Specialties","name":"Chicken Tikka","price":"12.00"},{"type":"Tandoori Specialties","name":"Malai Tikka","price":"13.00"},{"type":"Tandoori Specialties","name":"Reshmi Kabab","price":"12.00"},{"type":"Tandoori Specialties","name":"Paneer Tikka","price":"10.00"},{"type":"Tandoori Specialties","name":"Hariyali Tikka","price":"13.00"},{"type":"Tandoori Specialties","name":"Mutton Sheek Kabab","price":"14.00"},{"type":"Fry Specialties","name":"Mutton Fry","price":"12.00"},{"type":"Fry Specialties","name":"Chicken 65","price":"10.00"},{"type":"Fry Specialties","name":"Garlic Chicken","price":"10.00"},{"type":"Fry Specialties","name":"Chiili Chicken","price":"10.00"},{"type":"Fry Specialties","name":"Bhendi Fry","price":"5.00"},{"type":"Fry Specialties","name":"Kofta Kabab","price":"5.00"},{"type":"Hyderabadi Specialties","name":"Aloo Methi Gosh","price":"6.00"},{"type":"Hyderabadi Specialties","name":"Gawar Phali Gosh","price":"6.00"},{"type":"Hyderabadi Specialties","name":"Chicken Kurma","price":"6.00"},{"type":"Hyderabadi Specialties","name":"Mutton Kurma","price":"6.00"},{"type":"Hyderabadi Specialties","name":"Bagare Baingan","price":"5.00"},{"type":"Hyderabadi Specialties","name":"Khati Dal","price":"3.00"},{"type":"Special Curries","name":"Butter Chicken","price":"10.00"},{"type":"Special Curries","name":"Shezhwan Chicken","price":"10.00"},{"type":"Special Curries","name":"Pepper Masala (Chicken/Mutton)","price":"10.00"},{"type":"Special Curries","name":"Dal Makhani","price":"7.00"},{"type":"Special Curries","name":"Aloo Mutter","price":"7.00"},{"type":"Special Curries","name":"Dabal Ka Mitha","price":"4.00"},{"type":"Desserts","name":"Gulab Jamun (2pcs)","price":"4.00"},{"type":"Accompaniments","name":"Green Salad","price":"2.00"},{"type":"Beverages","name":"Water Bottle (Big/Small)","price":"2.00/1.00"},{"type":"Beverages","name":"Soft Drinks","price":"1.50"},{"type":"Beverages","name":"Tea","price":"1.00"}]

var cat = [];
function getUniqueCat(data){
	$.each(data, function(){
		if ($.inArray(this.type,cat) === -1) {
			cat.push(this.type);
		}
	});
}

getUniqueCat(dishes);

for(var i=0; i<cat.length; i++){
	$('#hor-minimalist-b').append('<thead><tr><th scope="col">'+cat[i]+'</th><th scope="col">Price</th></tr></thead>')
	$.each(dishes, function(){
		if(this.type == cat[i]){
			$('#hor-minimalist-b').append(' <tbody><tr><td>'+this.name+'</td><td>'+this.price+'</td></tr></tbody>')
		}
	});
}

$("#main_wrap").children().hide();
$("#homepg").fadeIn();

$(".menubtn").click(function(){
	var container = $(this).attr('href');
	divID = container.substring(1)+"pg";
	
	if($("#main_wrap").is(":visible")){
		$("#main_wrap").children().hide();
		$(container+"pg").fadeIn();
	}
	else{	
		$("#main_wrap").fadeIn();
		$(container+"pg").fadeIn();
	}
});	

$('#navbar ul').css({display: "none"}); 
$('#navbar li').hover(
	function(){
		$(this).find('ul:first').css({visibility: "visible", display: "none"}).fadeIn('fast');
	},
	function(){
		$(this).find('ul:first').css({visibility: "hidden"});
	}
);
$('#navbar li ul li:last-child').css('border-bottom', 'none');	

$('#hide_menu a').css('display', 'block');	
$('#hide_menu a').hover(
	function(){
		$('.menu_tooltip').stop().fadeTo('fast', 1);            	
	},
	function() {
		$('.menu_tooltip').stop().fadeTo('fast', 0);  
	}
);
$('#hide_menu a.menu_visible').live('click',function(){
	$('#hide_menu a.menu_visible')
		.removeClass('menu_visible')
		.addClass('menu_hidden')
		.attr('title', 'Show the navigation');

	$('.menu_tooltip').css('opacity', '0');
	$('#menu_wrap').animate({top: "-=480px"}, "normal", function() {      	
		$('.menu_tooltip p').text('Show the navigation');
	});
	                       	
	return false;
});
$('#hide_menu a.menu_hidden').live('click', function(){	
	$('#hide_menu a.menu_hidden')
		.removeClass('menu_hidden')
		.addClass('menu_visible');

	$('.menu_tooltip').css('opacity', '0');    
	$('#menu_wrap').animate({ top: "+=480px"}, 'normal');  
	$('.menu_tooltip p').text('Hide the navigation');
		            
	return false;
});

}); //end