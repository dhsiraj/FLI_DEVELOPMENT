var successMsgClass = "fg ui-state-success ui-corner-all" 
var alertMsgClass = "fg ui-state-error ui-corner-all"
var infoMsgClass = "fg ui-state-highlight ui-corner-all"

var alertIconClass = "<span class='fg ui-icon fg-ui-icon-left ui-icon-alert'></span><strong>Alert:</strong>"
var successIconClass = "<span class='fg ui-icon fg-ui-icon-left ui-icon-check'></span><strong>Note:</strong>"
var infoIconClass = "<span class='fg ui-icon fg-ui-icon-left ui-icon-info'></span><strong>Note:</strong>"

$(document).ready(function() {
    var max = 95;
    $("label").each(function(){
        if ($(this).width() > max)
            max = $(this).width();    
    });
    $("label").width(max);
}); 

$(function() {
		/*$("#dialog-comment").dialog({
			autoOpen: false,
			height: 340,
			width:500,
			show: 'blind',
			modal: true,
			buttons: {
				Submit: function() {
					//alert("called ");
					postComment(1);

				},
			Cancel: function() {
					$(this).dialog('close');
				}
			},
			close: function() {
				//allFields.val('').removeClass('ui-state-error');
			}

		});*/
	
	$("#dialog-login").dialog({
			autoOpen: false,
			height: 250,
			width:400,
			show: 'blind',
			modal: true,
			buttons: {
				Signin: function() {
					//alert("called ");
					var bValid = true;
					//allFields.removeClass('ui-state-error');
					validateLogin();

				},
			Cancel: function() {
					$(this).dialog('close');
				}
			},
			close: function() {
			}
			
		});
	
	$("#dialog-register").dialog({
			autoOpen: false,
			height: 440,
			width:400,
			modal: true,
			buttons: {
				Register: function() {
					//alert("called ");
					var bValid = true;
					//allFields.removeClass('ui-state-error');
					validateRegistration();

				},
			Cancel: function() {
					$(this).dialog('close');
				}
			},
			close: function() {
				//allFields.val('').removeClass('ui-state-error');
			}
		});
	
$('#opener-comment')			
			.click(function() {
				$('#dialog-comment').dialog('open');
			});
			
$('#opener-login')			
			.click(function() {
				//alert("called");
				//alert($('#dialog-login'));
				$('#dialog-login').dialog('open');
				/*if(jsUserId != ""){
					logOut();
				}else{
					$('#login_message').html('');
					$('#login_message').removeClass(alertMsgClass);
					$('#login_message').slideUp();
					$('#dialog-login').dialog('open');
				}*/
			});
$('#opener-login-commentlink')			
			.click(function() {
				$('#dialog-login').dialog('open');
			});

$('#opener-prg_comment_login')			
			.click(function() {
				if(jsUserId != ""){
					logOut();
				}else{
					$('#login_message').html('');
					$('#login_message').removeClass(alertMsgClass);
					$('#login_message').slideUp();
					$('#dialog-login').dialog('open');
				}
			});

$('#opener-comment_new_login')			
			.click(function() {
				if(jsUserId != ""){
					logOut();
				}else{
					$('#login_message').html('');
					$('#login_message').removeClass(alertMsgClass);
					$('#login_message').slideUp();
					$('#dialog-login').dialog('open');
				}
			});


$('#opener-comment_login')			
			.click(function() {
				//alert(jsUserId);
				if(jsUserId != ""){
					$('#dialog-comment').dialog('open');
				}else{
					$('#dialog-login').dialog('open');
					showMsgDiv('#login_message',successMsgClass,alertMsgClass, alertIconClass+'Please login before posting comment.');
					$("#openedFrom").val('opener-comment_login')
				}
			});
$('#opener-register')			
			.click(function() {
				$('#dialog-register').dialog('open');
			});

// Dialog			
				$('#dialog1').dialog({
					autoOpen: false,
					width: 600,
					buttons: {
						"Ok": function() { 
							$(this).dialog("close"); 
						}, 
						"Cancel": function() { 
							$(this).dialog("close"); 
						} 
					}
				});
				
				// Dialog Link
				$('#dialog_link').click(function(){
					$('#dialog1').dialog('open');
					return false;
				});

});

function callLogin(){
	//alert("login called ");
}

$(function() {
	//alert("called");
	//find all form with class jqtransform and apply the plugin
     $("input:text, textarea, select, input:button,input:submit").uniform();
	 //alert("called1" + $("input:submit").uniform());
	// $("input:submit").uniform();
});




function validateLogin(){
	processingWait('#login_message');
	var username = $("#user_name").val();
	var password = $("#login_password").val();
	var token = document.getElementsByName("authenticity_token")[0].value;
	if(username != null && username != "" && password != null && password !=""){
		var dataString = "action=login&user_name="+username+"&authenticity_token="+token+"&password="+password;
		//alert(dataString);
		$.ajax({type: "GET", url: "/login", data: dataString, contentType: "text/html", charset: "UTF-8",
			success: function(data) {
				//alert(data);
				if(data){
					if(data == "error"){
						showMsgDiv('#login_message',successMsgClass,alertMsgClass, alertIconClass+'Invalid username/password, please try again.');
					}else{
						showMsgDiv('#login_message',alertMsgClass,successMsgClass, successIconClass+'Logged in successfully.');
						setTimeout(function() { 
							jsUserId = data;
							$("fieldset#signin_menu").slideUp('slow');
							$("#dialog-login").dialog('close');
							$("#opener-login").text('Sign out');
							//alert($("#openedFrom").val());
							if($("#openedFrom").val() != ''){
								$("#"+$("#openedFrom").val()).dialog('open');
								//alert("opened");
								$("#openedFrom").val('');
										//if($("#openedFrom").val() == 'opener-comment_login'){
										//	$("#openedFrom").val('');
										//	$('#dialog-comment').dialog('open');
							}else{
								document.location.reload();
							}
							document.location.reload();
							}, 1800	);

					}
					return false;
				}
			}
		});
		return false;

	}else{
		alert("went to else ");
		//document.getElementById("forgotPass").style.display="none";
		showMsgDiv('#login_message',successMsgClass,alertMsgClass, alertIconClass+'Please enter your username and password');
		return false;
	}
}

function logOut(){
	var dataString = "action=logout";
	$.ajax({type: "GET", url: "logout", data: dataString, contentType: "text/html", charset: "UTF-8",
	success: function(data) {
		//alert("logout ajax called "+ data);
		if(data){
			document.location.reload();
		}
	}
	});
}

function forgotPassword(val){
	$("#login_message").slideUp('slow');
	$("#login_message").html('');
	processingWait('#login_message');
	if(val == 0){ //enable the forgot pass input box
		$("#login_message").html('');
		document.getElementById("forgotPass").style.display="block";
	}else{
		fpusername =  $("#fpusername").val();
		if(fpusername==null || fpusername ==""){
			showMsgDiv("#login_message",successMsgClass,alertMsgClass, alertIconClass+'Please enter your username');
			return false;
		}else{
			var dataString = "action=forgotPassword&username="+fpusername;
			$.ajax({type: "GET", url: "loginRegisterAction.asp", data: dataString, contentType: "text/html", charset: "UTF-8",
				success: function(data) {
					if(data){
						if(data == "error"){
							showMsgDiv('#login_message',successMsgClass,alertMsgClass, alertIconClass+'User not available.');
						}else{
							showMsgDiv('#login_message',alertMsgClass,successMsgClass, successIconClass+'Password recovered, please check your mail.');
							setTimeout(function() { 
								$("#login_message").html('');
								$("#login_message").slideUp('slow');
								$("#forgotPass").slideUp('slow');
							}, 1800	);

						}
						return false;
					}
				}
			});
		
		}
		return false;
	}
 }
 
 function checkAvailability(){
	user = $("#register_name").val();
	alert(user);
	if(user == ""){
		showMsgDiv('#register_message',successMsgClass,alertMsgClass, alertIconClass+'Please enter your user name');
		return false;
	}
	processingWait('#register_message');
	var dataString = "username="+user;
	$.ajax({type: "GET", url: "checkuserexist", data: dataString, contentType: "text/html", charset: "UTF-8",
		success: function(data) {
			alert("logout ajax called "+ data);
			if(data){
				if(data == "error"){
					showMsgDiv('#register_message',successMsgClass,alertMsgClass, alertIconClass+'User id already in use');
				}else{
					showMsgDiv('#register_message',alertMsgClass,successMsgClass, successIconClass+'User id available');
				}
			}
		}
	});
 }

 
 function validateRegistration(){
	$("#register_message").slideUp('slow');
	$("#register_message").html('');
	var vararr = new Array("register_name","password","password_confirmation","email");
	for(i=0;i<vararr.length;i++){
		obj = $("#"+vararr[i]).val();
		if(obj == null || obj == ""){
			field = vararr[i];
			showMsgDiv('#register_message',successMsgClass,alertMsgClass, alertIconClass+'Please enter your '+field);
			return false;
		}
	}
	if(!ValidateEmail($("#email").val())){
		showMsgDiv('#register_message',successMsgClass,alertMsgClass, alertIconClass+'Please enter a valid email id');
		return false;
	}
	
	if($("#password").val() != $("#password_confirmation").val()){
		showMsgDiv('#register_message',successMsgClass,alertMsgClass, alertIconClass+'Password mismatch, enter correct password');
		return false;
	}
	
	var param = "user_name="+$("#register_name").val()+"&password="+$("#password_confirmation").val()+"&password_confirmation="+$("#password_confirmation").val()+"&email="+$("#email").val();
	register(param);
 	return true;	
}

function register(param){
	processingWait('#register_message');
	var dataString = param;
	//alert(param)
	$.ajax({type: "GET", url: "register", data: dataString, contentType: "text/html", charset: "UTF-8",
		success: function(data) {
			//alert(data);
			if(data){
				if(data == "error"){
					showMsgDiv('#register_message',successMsgClass,alertMsgClass, alertIconClass+'User name already exists, Please enter a different one');
				}else{
					showMsgDiv('#register_message',alertMsgClass,successMsgClass, successIconClass+'Registered successfully. Please check your mail to activated it.');
					setTimeout(function() { 
						jsUserId = data;
						$("#opener-login").text('Sign out');
						$("fieldset#register_menu").slideUp('slow');
						$("#dialog-register").dialog('close');
						}, 1800	);
					document.location.reload();
				}
				return false;
			}
		}
	});
	return false;
}

function ValidateEmail(vEmail) {
   if (vEmail.indexOf('@',0)==-1 ||
	   vEmail.indexOf('@',0)== 0 ||
	   vEmail.indexOf('.',0)==-1) 
		return false ;
   else
	return true
}



 function cancelLogin(objID, msgID){
	///alert(objID);
	//alert(msgID);
	$(msgID).removeClass(alertMsgClass);
	$(msgID).removeClass(successMsgClass);
	$(msgID).html('');
	$(msgID).slideUp('slow');
	$(objID).hide();
 }

 function processingWait(divobj){
	//$(divobj).removeClass(rmclass);
	$(divobj).html("<img src='/images/processwaitbig.gif'/>");
	$(divobj).slideDown('slow');
 }

 function showMsgDiv(divobj, rmclass,msgclass, msg){
	$(divobj).removeClass(rmclass);
	$(divobj).addClass(msgclass);
	$(divobj).html(msg);
	$(divobj).slideDown('slow');
 }





