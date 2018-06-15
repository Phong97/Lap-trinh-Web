	// FORM LOGIN
	//Kiểm tra tất cả các thẻ đã được load
	$(document).ready(function(){
		//nút search trang chủ
		$("#btnsearch").click(function(){
			window.open('https://www.google.com/search?sitesearch=www.hcmute.edu.vn&q='+ $("#search").val());
		});
		//thông báo khi đăng ký khóa học
		$('#muakhoahoc').click(function(event) {
	        event.preventDefault();
	        var currentForm = $(this).closest('form');
	        
	        /** Create div element for delete confirmation dialog */
	        var dynamicDialog = $('<div id="conformBox">Are you sure to enroll this course?</div>');
	        
	        dynamicDialog.dialog({
	                title : "Enroll",
	                closeOnEscape: true,
	                modal : true,
	        
	               buttons : 
	                        [{
	                                text : "Yes",
	                                click : function() {
	                                	$(this).dialog("close");
	                                    currentForm.submit();
	                                }
	                        },
	                        {
	                                text : "No",
	                                click : function() {
	                                        $(this).dialog("close");
	                                }
	                        }]
	        });
	        return false;
	    });
		//thông báo xóa bình luận
		$('[id="deletecomment"]').click(function(event) {
	        event.preventDefault();
	        var currentComment = $(this);
	        
	        /** Create div element for delete confirmation dialog */
	        var dynamicDialog = $('<div id="conformBox">Are you sure to delete this comment?</div>');
	        
	        dynamicDialog.dialog({
	                title : "Delete Comment",
	                closeOnEscape: true,
	                modal : true,
	        
	               buttons : 
	                        [{
	                                text : "Yes",
	                                click : function() {
	                                	$(this).dialog("close");
	                                	window.location.href = currentComment.attr('href');
	                                }
	                        },
	                        {
	                                text : "No",
	                                click : function() {
	                                        $(this).dialog("close");
	                                }
	                        }]
	        });
	        return false;
	    });
		//thông báo xóa item
		$('[id="delete"]').click(function(event) {
	        event.preventDefault();
	        var currentForm = $(this).parent().parent().children('form');
	        
	        /** Create div element for delete confirmation dialog */
	        var dynamicDialog = $('<div id="conformBox">'+
	        '<span class="ui-icon ui-icon-trash" style="float:left; margin:0 7px 20px 0;">'+
	        '</span>Are you sure to delete this item?</div>');
	        
	        dynamicDialog.dialog({
	                title : "Delete",
	                closeOnEscape: true,
	                modal : true,
	        
	               buttons : 
	                        [{
	                                text : "Yes",
	                                click : function() {
	                                	$(this).dialog("close");
	                                    currentForm.submit();
	                                }
	                        },
	                        {
	                                text : "No",
	                                click : function() {
	                                        $(this).dialog("close");
	                                }
	                        }]
	        });
	        return false;
	    });
		// Bắt lỗi không nhập hoặc nhập sai điều kiện cho phép
		// Bắt lỗi cho textbox username(tên đăng nhập)
            $("#username_login").focusout(function(){
            	var username_length= $("#username_login").val().length;
            	if(username_length==0)
            	{
            		$("#announce").css("display","block");
            		$("#announce2").css("display","none");
            		$("#announce").html("Tên đăng nhập bị trống, mời nhập lại!");
            		$("#username_login").css("border","solid 1px red");
            	} 
            	else
            	if(username_length <5 || username_length >30) {
            	 	$("#announce").css("display","block");
            	 	$("#announce2").css("display","none");
            		$("#announce").html("Hãy nhập tên đăng nhập từ 5 đến 20 kí tự!");
            		$("#username_login").css("border","solid 1px red");
                }
                else {
            	 	$("#announce").css("display","none");
            	 	$("#announce2").css("display","none");
            	 	$("#username_login").css("border","solid 1px #ccc");
            	}
            });
         // Bắt lỗi cho textbox password(mật khẩu)   	
            $("#password_login").focusout(function(){
            	var password_length= $("#password_login").val().length;
            	if(password_length==0)
            	{
            		$("#announce").css("display","block");
            		$("#announce2").css("display","none");
            		$("#announce").html("Hãy nhập mật khẩu!");
            		$("#password_login").css("border","solid 1px red");
            	} 
            	else
            	if(password_length <8 || password_length >20) {
            	 	$("#announce").css("display","block");
            	 	$("#announce2").css("display","none");
            		$("#announce").html("Mật khẩu từ 8 đến 20 kí tự!");
            		$("#password_login").css("border","solid 1px red");
                }
                else {
            	 	$("#announce").css("display","none");
            	 	$("#announce2").css("display","none");
            	 	$("#password_login").css("border","solid 1px #ccc");
            	}
            });

    });
   //FORM REGISTER
  	$(document).ready(function(){
  		// Bắt lỗi cho textbox username(tên đăng nhập)
            $("#username_reg").focusout(function(){
            	var username_length= $("#username_reg").val().length;
            	if(username_length==0)
            	{
            		$("#announce1").css("display","block");
            		$("#announce2").css("display","none");
            		$("#announce1").html("Tên đăng nhập bị trống, mời nhập lại!");
            		$("#username_reg").css("border","solid 1px red");
            	} 
            	else
            	if(username_length <5 || username_length >30) {
            	 	$("#announce1").css("display","block");
            	 	$("#announce2").css("display","none");
            		$("#announce1").html("Hãy nhập tên đăng nhập từ 5 đến 30 kí tự!");
            		$("#username_reg").css("border","solid 1px red");
                }
                else {
            	 	$("#announce1").css("display","none");
            	 	$("#announce2").css("display","none");
            	 	$("#username_reg").css("border","solid 1px #ccc");
            	}
            });
         // Bắt lỗi cho textbox password(mật khẩu)   	
            $("#password_reg").focusout(function(){
            	var password_length= $("#password_reg").val().length;
            	if(password_length==0)
            	{
            		$("#announce1").css("display","block");
            		$("#announce2").css("display","none");
            		$("#announce1").html("Hãy nhập mật khẩu!");
            		$("#password_reg").css("border","solid 1px red");
            	} 
            	else
            	if(password_length <8 || password_length >20) {
            	 	$("#announce1").css("display","block");
            	 	$("#announce2").css("display","none");
            		$("#announce1").html("Mật khẩu từ 8 đến 20 kí tự!");
            		$("#password_reg").css("border","solid 1px red");
                }
                else {
            	 	$("#announce1").css("display","none");
            	 	$("#announce2").css("display","none");
            	 	$("#password_reg").css("border","solid 1px #ccc");
            	}
            });
            // Bắt lỗi cho cofirm password(mật khẩu)   	
            $("#password_cofirm").focusout(function(){
            	var password_reg= $("#password_reg").val();
            	var password_cofirm= $("#password_cofirm").val();
            	if(password_reg != password_cofirm)
            	{
            		$("#announce1").css("display","block");
            		$("#announce2").css("display","none");
            		$("#announce1").html("Mật khẩu không trùng khớp!");
            		$("#password_cofirm").css("border","solid 1px red");
            	}
                else {
            	 	$("#announce1").css("display","none");
            	 	$("#announce2").css("display","none");
            	 	$("#password_cofirm").css("border","solid 1px #ccc");
            	}
            });
    });
    //
     //FORM ĐỔI MẬT KHẨU
  	$(document).ready(function(){
         // Bắt lỗi cho textbox password(mật khẩu)   	
            $(".password_old").focusout(function(){
            	var password_length= $(".password_old").val().length;
            	if(password_length==0)
            	{
            		$("#announce1").css("display","block");
            		$("#announce2").css("display","none");
            		$("#announce1").html("Hãy nhập mật khẩu!");
            		$(".password_old").css("border","solid 1px red");
            	} 
            	else
            	if(password_length <8 || password_length >20) {
            	 	$("#announce1").css("display","block");
            	 	$("#announce2").css("display","none");
            		$("#announce1").html("Mật khẩu từ 8 đến 20 kí tự!");
            		$(".password_old").css("border","solid 1px red");
                }
                else {
            	 	$("#announce1").css("display","none");
            	 	$("#announce2").css("display","none");
            	 	$(".password_old").css("border","solid 1px #ccc");
            	}
            });
            $(".password_new").focusout(function(){
            	var password_length= $(".password_new").val().length;
            	if(password_length==0)
            	{
            		$("#announce1").css("display","block");
            		$("#announce2").css("display","none");
            		$("#announce1").html("Hãy nhập mật khẩu!");
            		$(".password_new").css("border","solid 1px red");
            	} 
            	else
            	if(password_length <8 || password_length >20) {
            	 	$("#announce1").css("display","block");
            	 	$("#announce2").css("display","none");
            		$("#announce1").html("Mật khẩu từ 8 đến 20 kí tự!");
            		$(".password_new").css("border","solid 1px red");
                }
                else {
            	 	$("#announce1").css("display","none");
            	 	$("#announce2").css("display","none");
            	 	$(".password_new").css("border","solid 1px #ccc");
            	}
            });
            // Bắt lỗi cho cofirm password(mật khẩu)   	
            $(".password_check").focusout(function(){
            	var password_reg= $(".password_new").val();
            	var password_cofirm= $(".password_check").val();
            	if(password_reg != password_cofirm)
            	{
            		$("#announce1").css("display","block");
            		$("#announce2").css("display","none");
            		$("#announce1").html("Mật khẩu không trùng khớp!");
            		$(".password_check").css("border","solid 1px red");
            	}
                else {
            	 	$("#announce1").css("display","none");
            	 	$("#announce2").css("display","none");
            	 	$(".password_check").css("border","solid 1px #ccc");
            	}
            });

    });
   //FORM TRANG CA NHAN
  	$(document).ready(function(){
  		// Bắt email hợp lệ
  		$(".validation_email").focusout(function(){
  			var pattern = new RegExp(/^([\w\.])+@([a-zA-Z0-9\-])+\.([a-zA-Z]{2,4})(\.[a-zA-Z]{2,4})?$/);
  			if(pattern.test($(".validation_email").val()))
  			{
  				$("#announce1").css("display","none");
  				$("#announce2").css("display","none");
            	$(".validation_email").css("border","solid 1px #ccc");
  			}
  		    else
  		    {
            	$("#announce1").css("display","block");
            	$("#announce2").css("display","none");
            	$("#announce1").html("Email chưa hợp lệ!");
            	$(".validation_email").css("border","solid 1px red");
            }
		  });
  		// Bắt tuổi là số
  		$(".validation_age").focusout(function(){
  			var pattern = new RegExp(/^[0-9]+$/);
  			if(pattern.test($(".validation_age").val()))
  			{
  				$("#announce1").css("display","none");
  				$("#announce2").css("display","none");
            	$(".validation_age").css("border","solid 1px #ccc");
  			}
  		    else 
  		    {
            	$("#announce1").css("display","block");
            	$("#announce2").css("display","none");
            	$("#announce1").html("Hãy nhập tuổi là số!");
            	$(".validation_age").css("border","solid 1px red");
            }
		  });
  		// Bắt số điện thoại là số
  		$(".validation_phone").focusout(function(){
  			var pattern = new RegExp(/^[0-9]+$/);
  			if(pattern.test($(".validation_phone").val()))
  			{
  				$("#announce1").css("display","none");
  				$("#announce2").css("display","none");
            	$(".validation_phone").css("border","solid 1px #ccc");
  			}
  		    else 
  		    {
            	$("#announce1").css("display","block");
            	$("#announce2").css("display","none");
            	$("#announce1").html("Hãy nhập số điện thoại là số!");
            	$(".validation_phone").css("border","solid 1px red");
            }
		  });
		 
    });
   //Đặt sự kiện cho các button trong Form LOGIN, LOGOUT
	$(document).ready(function(){
		
			  $(".btn").click(function(){
				  $(".carousel-indicators").css("display","none");
			 });
			  $(".close").click(function(){
				  $("#id01").css("display","none");
				  $("#id02").css("display","none");
				  $(".carousel-indicators").css("display","block");
			 });
			
			  $(".formreg").click(function(){
				  $("#id02").css("display","block");
				  $("#id01").css("display","none");
			 });
			  $(".formlogin").click(function(){
				   $("#id02").css("display","none");
				   $("#id01").css("display","block");
			 });
		
		var modal = document.getElementById('id01');
		var modal2 = document.getElementById('id02');
		
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
				$("#announce").css("display","none");
        	 	$("#announce2").css("display","none");
        	 	$("#username_login").css("border","solid 1px #ccc");
        		$("#password_login").css("border","solid 1px #ccc");
			}
			else
				if(event.target == modal2) {
				modal2.style.display = "none";
				$("#announce1").css("display","none");
        	 	$("#announce2").css("display","none");
        	 	$("#username_reg").css("border","solid 1px #ccc");
        	 	$("#password_reg").css("border","solid 1px #ccc");
			}
		}
		//END 
		 
	});

			
	$(document).ready(function(){
				//Jquey hiệu ứng slideanim khi trượt
			$(window).scroll(function(){
				$(".slideanim").each(function(){
					var pos= $(this).offset().top;
					var winTop= $(window).scrollTop();
					if(pos < winTop + 600) {
						$(this).addClass("slide");
					}
				});
			   });		
			// Bắt tiền trong tài khoản là số
	  		$("#validation_money").focusout(function(){
	  			var pattern = new RegExp(/^[0-9]+$/);
	  			if(pattern.test($("#validation_money").val()))
	  			{
	  				$("#announce1").css("display","none");
	  				$("#announce2").css("display","none");
	            	$("#validation_money").css("border","solid 1px #ccc");
	  			}
	  		    else 
	  		    {
	            	$("#announce1").css("display","block");
	            	$("#announce2").css("display","none");
	            	$("#announce1").html("Hãy nhập tiền trong tài khoản là số!");
	            	$("#validation_money").css("border","solid 1px red");
	            }
			  });
	  	// Bắt học phí trong khóa học là số
	  		$("#validation_fee").focusout(function(){
	  			var pattern = new RegExp(/^[0-9]+$/);
	  			if(pattern.test($("#validation_fee").val()))
	  			{
	  				$("#announce").css("display","none");
	  				$("#announce2").css("display","none");
	            	$("#validation_fee").css("border","solid 1px #ccc");
	  			}
	  		    else 
	  		    {
	            	$("#announce").css("display","block");
	            	$("#announce2").css("display","none");
	            	$("#announce").html("Hãy nhập học phí là số");
	            	$("#validation_fee").css("border","solid 1px red");
	            }
			  });
	  	// Bắt số lượng trong lớp học là số
	  		$("#soluong").focusout(function(){
	  			var pattern = new RegExp(/^[0-9]+$/);
	  			if(pattern.test($("#soluong").val()))
	  			{
	  				$("#announce1").css("display","none");
	  				$("#announce2").css("display","none");
	            	$("#soluong").css("border","solid 1px #ccc");
	  			}
	  		    else 
	  		    {
	            	$("#announce1").css("display","block");
	            	$("#announce2").css("display","none");
	            	$("#announce1").html("Hãy nhập số lượng là số");
	            	$("#soluong").css("border","solid 1px red");
	            }
			  });
	  		
	  		//Code chuyển md5	  			 	
	  		var md5 = function (string) {
	  	    	 
	  	        function RotateLeft(lValue, iShiftBits) {
	  	            return (lValue<<iShiftBits) | (lValue>>>(32-iShiftBits));
	  	        }
	  	 
	  	        function AddUnsigned(lX,lY) {
	  	            var lX4,lY4,lX8,lY8,lResult;
	  	            lX8 = (lX & 0x80000000);
	  	            lY8 = (lY & 0x80000000);
	  	            lX4 = (lX & 0x40000000);
	  	            lY4 = (lY & 0x40000000);
	  	            lResult = (lX & 0x3FFFFFFF)+(lY & 0x3FFFFFFF);
	  	            if (lX4 & lY4) {
	  	                return (lResult ^ 0x80000000 ^ lX8 ^ lY8);
	  	            }
	  	            if (lX4 | lY4) {
	  	                if (lResult & 0x40000000) {
	  	                    return (lResult ^ 0xC0000000 ^ lX8 ^ lY8);
	  	                } else {
	  	                    return (lResult ^ 0x40000000 ^ lX8 ^ lY8);
	  	                }
	  	            } else {
	  	                return (lResult ^ lX8 ^ lY8);
	  	            }
	  	        }
	  	 
	  	        function F(x,y,z) {
	  	            return (x & y) | ((~x) & z);
	  	        }
	  	        function G(x,y,z) {
	  	            return (x & z) | (y & (~z));
	  	        }
	  	        function H(x,y,z) {
	  	            return (x ^ y ^ z);
	  	        }
	  	        function I(x,y,z) {
	  	            return (y ^ (x | (~z)));
	  	        }
	  	 
	  	        function FF(a,b,c,d,x,s,ac) {
	  	            a = AddUnsigned(a, AddUnsigned(AddUnsigned(F(b, c, d), x), ac));
	  	            return AddUnsigned(RotateLeft(a, s), b);
	  	        };
	  	 
	  	        function GG(a,b,c,d,x,s,ac) {
	  	            a = AddUnsigned(a, AddUnsigned(AddUnsigned(G(b, c, d), x), ac));
	  	            return AddUnsigned(RotateLeft(a, s), b);
	  	        };
	  	 
	  	        function HH(a,b,c,d,x,s,ac) {
	  	            a = AddUnsigned(a, AddUnsigned(AddUnsigned(H(b, c, d), x), ac));
	  	            return AddUnsigned(RotateLeft(a, s), b);
	  	        };
	  	 
	  	        function II(a,b,c,d,x,s,ac) {
	  	            a = AddUnsigned(a, AddUnsigned(AddUnsigned(I(b, c, d), x), ac));
	  	            return AddUnsigned(RotateLeft(a, s), b);
	  	        };
	  	 
	  	        function ConvertToWordArray(string) {
	  	            var lWordCount;
	  	            var lMessageLength = string.length;
	  	            var lNumberOfWords_temp1=lMessageLength + 8;
	  	            var lNumberOfWords_temp2=(lNumberOfWords_temp1-(lNumberOfWords_temp1 % 64))/64;
	  	            var lNumberOfWords = (lNumberOfWords_temp2+1)*16;
	  	            var lWordArray=Array(lNumberOfWords-1);
	  	            var lBytePosition = 0;
	  	            var lByteCount = 0;
	  	            while ( lByteCount < lMessageLength ) {
	  	                lWordCount = (lByteCount-(lByteCount % 4))/4;
	  	                lBytePosition = (lByteCount % 4)*8;
	  	                lWordArray[lWordCount] = (lWordArray[lWordCount] | (string.charCodeAt(lByteCount)<<lBytePosition));
	  	                lByteCount++;
	  	            }
	  	            lWordCount = (lByteCount-(lByteCount % 4))/4;
	  	            lBytePosition = (lByteCount % 4)*8;
	  	            lWordArray[lWordCount] = lWordArray[lWordCount] | (0x80<<lBytePosition);
	  	            lWordArray[lNumberOfWords-2] = lMessageLength<<3;
	  	            lWordArray[lNumberOfWords-1] = lMessageLength>>>29;
	  	            return lWordArray;
	  	        };
	  	 
	  	        function WordToHex(lValue) {
	  	            var WordToHexValue="",WordToHexValue_temp="",lByte,lCount;
	  	            for (lCount = 0;lCount<=3;lCount++) {
	  	                lByte = (lValue>>>(lCount*8)) & 255;
	  	                WordToHexValue_temp = "0" + lByte.toString(16);
	  	                WordToHexValue = WordToHexValue + WordToHexValue_temp.substr(WordToHexValue_temp.length-2,2);
	  	            }
	  	            return WordToHexValue;
	  	        };
	  	 
	  	        function Utf8Encode(string) {
	  	            string = string.replace(/\r\n/g,"\n");
	  	            var utftext = "";
	  	 
	  	            for (var n = 0; n < string.length; n++) {
	  	 
	  	                var c = string.charCodeAt(n);
	  	 
	  	                if (c < 128) {
	  	                    utftext += String.fromCharCode(c);
	  	                }
	  	                else if((c > 127) && (c < 2048)) {
	  	                    utftext += String.fromCharCode((c >> 6) | 192);
	  	                    utftext += String.fromCharCode((c & 63) | 128);
	  	                }
	  	                else {
	  	                    utftext += String.fromCharCode((c >> 12) | 224);
	  	                    utftext += String.fromCharCode(((c >> 6) & 63) | 128);
	  	                    utftext += String.fromCharCode((c & 63) | 128);
	  	                }
	  	 
	  	            }
	  	 
	  	            return utftext;
	  	        };
	  	 
	  	        var x=Array();
	  	        var k,AA,BB,CC,DD,a,b,c,d;
	  	        var S11=7, S12=12, S13=17, S14=22;
	  	        var S21=5, S22=9 , S23=14, S24=20;
	  	        var S31=4, S32=11, S33=16, S34=23;
	  	        var S41=6, S42=10, S43=15, S44=21;
	  	 
	  	        string = Utf8Encode(string);
	  	 
	  	        x = ConvertToWordArray(string);
	  	 
	  	        a = 0x67452301;
	  	        b = 0xEFCDAB89;
	  	        c = 0x98BADCFE;
	  	        d = 0x10325476;
	  	 
	  	        for (k=0;k<x.length;k+=16) {
	  	            AA=a;
	  	            BB=b;
	  	            CC=c;
	  	            DD=d;
	  	            a=FF(a,b,c,d,x[k+0], S11,0xD76AA478);
	  	            d=FF(d,a,b,c,x[k+1], S12,0xE8C7B756);
	  	            c=FF(c,d,a,b,x[k+2], S13,0x242070DB);
	  	            b=FF(b,c,d,a,x[k+3], S14,0xC1BDCEEE);
	  	            a=FF(a,b,c,d,x[k+4], S11,0xF57C0FAF);
	  	            d=FF(d,a,b,c,x[k+5], S12,0x4787C62A);
	  	            c=FF(c,d,a,b,x[k+6], S13,0xA8304613);
	  	            b=FF(b,c,d,a,x[k+7], S14,0xFD469501);
	  	            a=FF(a,b,c,d,x[k+8], S11,0x698098D8);
	  	            d=FF(d,a,b,c,x[k+9], S12,0x8B44F7AF);
	  	            c=FF(c,d,a,b,x[k+10],S13,0xFFFF5BB1);
	  	            b=FF(b,c,d,a,x[k+11],S14,0x895CD7BE);
	  	            a=FF(a,b,c,d,x[k+12],S11,0x6B901122);
	  	            d=FF(d,a,b,c,x[k+13],S12,0xFD987193);
	  	            c=FF(c,d,a,b,x[k+14],S13,0xA679438E);
	  	            b=FF(b,c,d,a,x[k+15],S14,0x49B40821);
	  	            a=GG(a,b,c,d,x[k+1], S21,0xF61E2562);
	  	            d=GG(d,a,b,c,x[k+6], S22,0xC040B340);
	  	            c=GG(c,d,a,b,x[k+11],S23,0x265E5A51);
	  	            b=GG(b,c,d,a,x[k+0], S24,0xE9B6C7AA);
	  	            a=GG(a,b,c,d,x[k+5], S21,0xD62F105D);
	  	            d=GG(d,a,b,c,x[k+10],S22,0x2441453);
	  	            c=GG(c,d,a,b,x[k+15],S23,0xD8A1E681);
	  	            b=GG(b,c,d,a,x[k+4], S24,0xE7D3FBC8);
	  	            a=GG(a,b,c,d,x[k+9], S21,0x21E1CDE6);
	  	            d=GG(d,a,b,c,x[k+14],S22,0xC33707D6);
	  	            c=GG(c,d,a,b,x[k+3], S23,0xF4D50D87);
	  	            b=GG(b,c,d,a,x[k+8], S24,0x455A14ED);
	  	            a=GG(a,b,c,d,x[k+13],S21,0xA9E3E905);
	  	            d=GG(d,a,b,c,x[k+2], S22,0xFCEFA3F8);
	  	            c=GG(c,d,a,b,x[k+7], S23,0x676F02D9);
	  	            b=GG(b,c,d,a,x[k+12],S24,0x8D2A4C8A);
	  	            a=HH(a,b,c,d,x[k+5], S31,0xFFFA3942);
	  	            d=HH(d,a,b,c,x[k+8], S32,0x8771F681);
	  	            c=HH(c,d,a,b,x[k+11],S33,0x6D9D6122);
	  	            b=HH(b,c,d,a,x[k+14],S34,0xFDE5380C);
	  	            a=HH(a,b,c,d,x[k+1], S31,0xA4BEEA44);
	  	            d=HH(d,a,b,c,x[k+4], S32,0x4BDECFA9);
	  	            c=HH(c,d,a,b,x[k+7], S33,0xF6BB4B60);
	  	            b=HH(b,c,d,a,x[k+10],S34,0xBEBFBC70);
	  	            a=HH(a,b,c,d,x[k+13],S31,0x289B7EC6);
	  	            d=HH(d,a,b,c,x[k+0], S32,0xEAA127FA);
	  	            c=HH(c,d,a,b,x[k+3], S33,0xD4EF3085);
	  	            b=HH(b,c,d,a,x[k+6], S34,0x4881D05);
	  	            a=HH(a,b,c,d,x[k+9], S31,0xD9D4D039);
	  	            d=HH(d,a,b,c,x[k+12],S32,0xE6DB99E5);
	  	            c=HH(c,d,a,b,x[k+15],S33,0x1FA27CF8);
	  	            b=HH(b,c,d,a,x[k+2], S34,0xC4AC5665);
	  	            a=II(a,b,c,d,x[k+0], S41,0xF4292244);
	  	            d=II(d,a,b,c,x[k+7], S42,0x432AFF97);
	  	            c=II(c,d,a,b,x[k+14],S43,0xAB9423A7);
	  	            b=II(b,c,d,a,x[k+5], S44,0xFC93A039);
	  	            a=II(a,b,c,d,x[k+12],S41,0x655B59C3);
	  	            d=II(d,a,b,c,x[k+3], S42,0x8F0CCC92);
	  	            c=II(c,d,a,b,x[k+10],S43,0xFFEFF47D);
	  	            b=II(b,c,d,a,x[k+1], S44,0x85845DD1);
	  	            a=II(a,b,c,d,x[k+8], S41,0x6FA87E4F);
	  	            d=II(d,a,b,c,x[k+15],S42,0xFE2CE6E0);
	  	            c=II(c,d,a,b,x[k+6], S43,0xA3014314);
	  	            b=II(b,c,d,a,x[k+13],S44,0x4E0811A1);
	  	            a=II(a,b,c,d,x[k+4], S41,0xF7537E82);
	  	            d=II(d,a,b,c,x[k+11],S42,0xBD3AF235);
	  	            c=II(c,d,a,b,x[k+2], S43,0x2AD7D2BB);
	  	            b=II(b,c,d,a,x[k+9], S44,0xEB86D391);
	  	            a=AddUnsigned(a,AA);
	  	            b=AddUnsigned(b,BB);
	  	            c=AddUnsigned(c,CC);
	  	            d=AddUnsigned(d,DD);
	  	        }
	  	 
	  	        var temp = WordToHex(a)+WordToHex(b)+WordToHex(c)+WordToHex(d);
	  	 
	  	        return temp.toLowerCase();
	  	    }
	  		
	  		
	  		//event click: change password to md5
	  		$("#loginsubmit").click(function(){
	  			var matkhau = md5($("#password_login").val());
  		        $("#password_login").val(matkhau);  		        	    		        
	  		});
	  		
	  		//
	  		$("#registersubmit").click(function(){
	  			 var matkhau = md5($("#password_reg").val());
	  		        $("#password_reg").val(matkhau); 	 
	  		      var matkhau1 = md5($("#password_cofirm").val());
	  		        $("#password_cofirm").val(matkhau1); 	 	  		        	  		     
	  		});
	  		
	  		//
	  		$("#resetpasssubmit").click(function(){
	  			
	  			 var matkhau = md5($("#passwordold_reset").val());
	  		        $("#passwordold_reset").val(matkhau); 	 
	  		        
	  		      var matkhau1 = md5($("#passwordnewconf_reset").val());
	  		        $("#passwordnewconf_reset").val(matkhau1); 
	  		        
	  		      var matkhau2 = md5($("#passwordnew_reset").val());
	  		        $("#passwordnew_reset").val(matkhau2); 
	  		});
	  		//
	  		$("#Confirm_info").click(function(){
	  			
	  			 var matkhau = md5($("#password_manage").val());
	  		        $("#password_manage").val(matkhau); 	 	  		        	  		   
	  		});
	  		
	  		//
	  		$("#Confirm_Update").click(function(){
	  			
	  			 var matkhau = md5($("#password_update").val());
	  		        $("#password_update").val(matkhau); 	 	  		        	  		   
	  		});
	  			  		  		
	});

