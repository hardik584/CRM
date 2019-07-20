var email = 1;
var temp =  1;

	

function customer_email() {
	if(temp<3)
	{
	temp++;
    email++;
     
    var objTo = document.getElementById('customerEmail')
    var divtest = document.createElement("div");
    divtest.setAttribute("class", "form-group row removeclassemail" + email);
    var rdiv = 'removeclass' + email;
    divtest.innerHTML = '<div class="col-md-12"><div class=""><div class="input-group"> <input class="form-control" type="email" placeholder="Email" id="CustomerEmail" name="emailId"><div class="input-group-append"> <button class="btn btn-danger" type="button" onclick="remove_customer_email(' + email + ');"> <i class="fa fa-minus"></i> </button></div></div></div></div><div class="clear"></row>';

    objTo.appendChild(divtest)
    }
	else{}
}

function remove_customer_email(rid) {
	$('.removeclassemail' + rid).remove();
    temp--;
}
    function remove_customer_email1(rid) {
    	$('#emailbutton').remove();
    	$('#emailtext').remove();
    	
        
    
}


var contact = 1;
var tempcon = 1;


function customer_contact() {
	if(tempcon<3){
	tempcon++;
	contact++;
	
    var objTo1 = document.getElementById('customerContact')
    var divtest1 = document.createElement("div");
    divtest1.setAttribute("class", "form-group row removeclasscontact" + contact);
    var rdiv1 = 'removeclass' + contact;
    divtest1.innerHTML = '<div class="col-md-12"><div class=""><div class="input-group"> <input class="form-control" maxlength="10" pattern="[0-9]{10}" type="text" placeholder="Contact" id="CustomerContact" name="mobileNumber"><div class="input-group-append"> <button class="btn btn-danger" type="button" onclick="remove_customer_contact(' + contact + ');"> <i class="fa fa-minus"></i> </button></div></div></div></div><div class="clear"></row>';

    objTo1.appendChild(divtest1)
	}
	else{ }
}
 

function remove_customer_contact(id) {
    $('.removeclasscontact' + id).remove();
    tempcon--;
    
}
function remove_customer_contact1(id) {
    $('#contacttext').remove();
    $('#contactbutton').remove();
     }