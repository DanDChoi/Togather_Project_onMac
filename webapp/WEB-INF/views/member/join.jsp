<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>Togather</title>
    <meta content="" name="description" />
    <meta content="" name="keywords" />

    <!-- Favicons -->
    <link href="/assets/img/favicon.png" rel="icon" />
    <link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon" />

    <!-- Google Fonts -->
    <link
      href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
      rel="stylesheet"
    />

    <!-- Vendor CSS Files -->
    <link href="/assets/vendor/animate.css/animate.min.css" rel="stylesheet" />
    <link href="/assets/vendor/aos/aos.css" rel="stylesheet" />
    <link
      href="/assets/vendor/bootstrap/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="../assets/vendor/bootstrap-icons/bootstrap-icons.css"
      rel="stylesheet"
    />
    <link href="/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
    <link href="/assets/vendor/remixicon/remixicon.css" rel="stylesheet" />
    <link href="/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />

    <!-- Template Main CSS File -->
    <link href="/assets/css/style.css" rel="stylesheet" />
	<!-- alert -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
     <!-- alert -->
    <script type="text/javascript" 
		     src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script type="text/javascript">
	function checkedBox(box){
		if(box.checked==true){
			var checked = box.value;
			console.log("box.checked: "+box.checked);
			console.log("checked: "+checked);
			if(checked=="ck1"){
				$('#checkBox1').val(checked);
				$('#ck1').remove();
				$('#category_first').remove();
				$('#category_first1').val("");
				$('#category_firstCheck1').val("");
				$('#ck1').prop('checked',false);
				$('#checkBox1').val("");
			}else if(checked=="ck2"){
				$('#checkBox2').val(checked);
				$('#ck2').remove();
				$('#category_second').remove();
				$('#category_first2').val("");
				$('#category_firstCheck2').val("");
				$('#ck2').prop('checked',false);
				$('#checkBox2').val("");
			}else{
				$('#checkBox3').val(checked);
				$('#ck3').remove();
				$('#category_third').remove();
				$('#category_first3').val("");
				$('#category_firstCheck3').val("");
				$('#ck3').prop('checked',false);
				$('#checkBox3').val("");
			}
		}else{
			var checked = box.value;
			if(checked=="ck1"){
				$('#checkBox1').val("");
			}else if(checked=="ck2"){
				$('#checkBox2').val("");
			}else{
				$('#checkBox3').val("");
			}
			console.log("checked: "+checked);
			console.log("box.checked: "+box.checked);
		}
		
		/*<input id="checkBox1" type="hidden"  value="">	
		<input id="checkBox2" type="hidden"  value="">
		<input id="checkBox3" type="hidden"  value="">*/
	
	}
	
	
	function joinCancel(){
		$('#mname_id').val("");
		$('#email_id').val("");
		$('#birth_id').val("");
		$('#pwd_id').val("");
		$('#pwd2_id').val("");
		$('#phone_id').val("");
		$('#maddr').val("");
		$('#pfr_loc_id').val("");
		$('#mname_id').focus();
	}
	function reset(){

		$('#ul2').remove();
		$('#ul3').remove();
		$('#button2').remove();
		$('#button3').remove();
		$('#Selectbutton').remove();
		var div2="";
		div2+="<button id='button2' type='button' class='btn btn-outline-light dropdown-toggle' onclick='javascript:reset2()' data-bs-toggle='dropdown' aria-expanded='false' style='color: black; border-color: black'>";
		div2+="<span id='span2'>???????????????</span>";
		div2+="</button>";
		div2+="<ul id='ul2' class='dropdown-menu'>";
		div2+="</ul>";
		$('#div2').after(                     
			div2              		
		);
		var div3="";
		div3+="<button id='button3' type='button' class='btn btn-outline-light dropdown-toggle' data-bs-toggle='dropdown' aria-expanded='false' style='color: black; border-color: black'>";
		div3+="<span id='span3'>???????????????</span>";
		div3+="</button>";
		div3+="<ul id='ul3' class='dropdown-menu'>";
		div3+="</ul>";
		$('#div3').after(                     
			div3              		
		);
		$('#button2').hide();
		$('#button3').hide();
	}
	
	function reset2(){
	
		$('#ul3').remove();
		$('#button3').remove();
		$('#Selectbutton').remove();
		var div3="";
		div3+="<button id='button3' type='button' class='btn btn-outline-light dropdown-toggle' data-bs-toggle='dropdown' aria-expanded='false' style='color: black; border-color: black'>";
		div3+="<span id='span3'>???????????????</span>";
		div3+="</button>";
		div3+="<ul id='ul3' class='dropdown-menu'>";
		div3+="</ul>";
		$('#div3').after(                     
			div3              		
		);
		$('#button3').hide();
	}
	
	function reset3(){

	}
	//<button id='Cancelbutton' type='button' class='btn btn-secondary' onclick='categorys(6,0)' style='margin:7px 0px 0px 5px' >??????</button>
	function selectedCategory(){
		let categoryValue1 =$('#category_first1').val();
		let categoryValue2 =$('#category_first2').val();
		let categoryValue3 =$('#category_first3').val();
		let checkBoxValue1 =$('#checkBox1').val();
		let checkBoxValue2 =$('#checkBox2').val();
		let checkBoxValue3 =$('#checkBox3').val();
		let categoryCheckValue1 =$('#category_firstCheck1').val();
		let categoryCheckValue2 =$('#category_firstCheck2').val();
		let categoryCheckValue3 =$('#category_firstCheck3').val();
		if(categoryValue1==categoryValue2 || categoryValue1==categoryValue3){
			console.log("5");
			Swal.fire({
				title:"?????? ??????????????? ??????????????????.",
				icon:"error"
			});
			return false;
		}else{
			if(categoryValue2!=""){
				if(categoryValue3==categoryValue2){
					Swal.fire({
						title:"?????? ??????????????? ??????????????????.",
						icon:"error"
					});
					return false;
				}else{
					if($('#category_firstCheck1').val()==""){
						console.log("1: ");
						let selectedText1="";
						selectedText1+="<input id='ck1' value='ck1' type='checkbox' onclick='checkedBox(this)'></input>";
						selectedText1+="<input id='category_first' type='text' name='category_first' style='width:100px;height:50px;border:none;text-align: center' value='"+categoryValue1+"' readonly>";
						$('#firstappendDiv').append(                     
								selectedText1              		
						);
						$('#category_firstCheck1').val("1");
					}else if($('#category_firstCheck1').val()!="" && $('#category_firstCheck2').val()==""){
						console.log("2");
						let selectedText2="";
						selectedText2+="<input id='ck2' value='ck2' type='checkbox' onclick='checkedBox(this)'></input>";
						selectedText2+="<input id='category_second' type='text' name='category_second' style='width:100px;height:50px;border:none;text-align: center' value='"+categoryValue2+"' readonly>";
						$('#firstappendDiv').append(                     
							selectedText2              		
						);
						$('#category_firstCheck2').val("2");
					}else if($('#category_firstCheck1').val()!="" && $('#category_firstCheck2').val()!="" && $('#category_firstCheck3').val()==""){
						console.log("3");
						let selectedText3="";
						selectedText3+="<input id='ck3' value='ck3' type='checkbox' onclick='checkedBox(this)'></input>";
						selectedText3+="<input id='category_third' type='text' name='category_third' style='width:100px;height:50px;border:none;text-align: center' value='"+categoryValue3+"' readonly>";
						$('#firstappendDiv').append(                     
								selectedText3              		
						);
						$('#category_firstCheck3').val("3");
						$('#button1').remove();
						$('#button2').remove();
						$('#button3').remove();
						$('#ul1').remove();
						$('#ul2').remove();
						$('#ul3').remove();
						$('#span1').remove();
						$('#span2').remove();
						$('#span3').remove();
						categoryCheckValue1 =$('#category_firstCheck1').val();
						categoryCheckValue2 =$('#category_firstCheck2').val();
						categoryCheckValue3 =$('#category_firstCheck3').val();
						console.log("categoryCheckValue1: "+categoryCheckValue1);
						console.log("categoryCheckValue2: "+categoryCheckValue2);
						console.log("categoryCheckValue3: "+categoryCheckValue3);
					}else {
						console.log("4");
						Swal.fire({
							title:"??????????????? 3???????????? ?????????????????????.",
							icon:"error"
						});
					}
				}
			}else{
				if($('#category_firstCheck1').val()==""){
					console.log("1: ");
					let selectedText1="";
					selectedText1+="<input id='ck1' value='ck1' type='checkbox' onclick='checkedBox(this)'></input>";
					selectedText1+="<input id='category_first' type='text' name='category_first' style='width:100px;height:50px;border:none;text-align: center' value='"+categoryValue1+"' readonly>";
					$('#firstappendDiv').append(                     
							selectedText1              		
					);
					$('#category_firstCheck1').val("1");
				}else if($('#category_firstCheck1').val()!="" && $('#category_firstCheck2').val()==""){
					console.log("2");
					let selectedText2="";
					selectedText2+="<input id='ck2' value='ck2' type='checkbox' onclick='checkedBox(this)'></input>";
					selectedText2+="<input id='category_second' type='text' name='category_second' style='width:100px;height:50px;border:none;text-align: center' value='"+categoryValue2+"' readonly>";
					$('#firstappendDiv').append(                     
						selectedText2              		
					);
					$('#category_firstCheck2').val("2");
				}else if($('#category_firstCheck1').val()!="" && $('#category_firstCheck2').val()!="" && $('#category_firstCheck3').val()==""){
					console.log("3");
					let selectedText3="";
					selectedText3+="<input id='ck3' value='ck3' type='checkbox' onclick='checkedBox(this)'></input>";
					selectedText3+="<input id='category_third' type='text' name='category_third' style='width:100px;height:50px;border:none;text-align: center' value='"+categoryValue3+"' readonly>";
					$('#firstappendDiv').append(                     
							selectedText3              		
					);
					$('#category_firstCheck3').val("3");
					$('#button1').remove();
					$('#button2').remove();
					$('#button3').remove();
					$('#ul1').remove();
					$('#ul2').remove();
					$('#ul3').remove();
					$('#span1').remove();
					$('#span2').remove();
					$('#span3').remove();
					categoryCheckValue1 =$('#category_firstCheck1').val();
					categoryCheckValue2 =$('#category_firstCheck2').val();
					categoryCheckValue3 =$('#category_firstCheck3').val();
					console.log("categoryCheckValue1: "+categoryCheckValue1);
					console.log("categoryCheckValue2: "+categoryCheckValue2);
					console.log("categoryCheckValue3: "+categoryCheckValue3);
				}else {
					console.log("4");
					Swal.fire({
						title:"??????????????? 3???????????? ?????????????????????.",
						icon:"error"
					});
				}
			}	
		}
		
		$('#Selectbutton').remove();
		$('#button2').hide();
		$('#button3').hide();
		categorys(5,0);
		
	}
	
	<c:set var="firstCategory1" value="${firstCategory}"/>
	function categorys(sequence,i){
		if(sequence==1){
			$('#button2').hide();
			$('#button3').hide();
			let catagory="";	
			catagory+="<c:forEach items='${firstCategory1}' var='firstCategory' varStatus='index'>";
			catagory+="<li><a id='li${index.index}' class='dropdown-item' href='javascript:categorys(2,${index.index})' onclick='javascript:reset()' data-value='${firstCategory.int_out}'>${firstCategory.int_out}</a></li>";
			catagory+="</c:forEach>";
			$('#ul1').append(                     
					catagory              		
			);
		}else if(sequence==2){
			$('#button2').show();
			let index="li";
			index+=i;
			let categoryValue=document.getElementById(index).getAttribute('data-value');
			$('#span1').text(categoryValue);
			var result = {"int_out":categoryValue,"sequence":sequence};
			$.ajax({
				url: "category.json",
				type: "GET",
				data: result,
				success: function(data){
					var secondCategory=data;
					let catagory="";
					for(var i =0;i<data.length;i++){
						let idNum=i;
						catagory+="<li><a id='"+i+"' class='dropdown-item' href='javascript:categorys(3,"+i+")' onclick='javascript:reset2()' data-value='"+secondCategory[i].int_in+"'>"+secondCategory[i].int_in+"</a></li>";
					}	
					
					$('#ul2').append(                     
							catagory              		
					);
				}
			});
		}else if(sequence==3){
			console.log("3?????????");
			let index=i;
			let categoryValue=document.getElementById(index).getAttribute('data-value');
			$('#span2').text(categoryValue);
			var result = {"int_in":categoryValue,"sequence":sequence};
			$.ajax({
				url: "category.json",
				type: "GET",
				data: result,
				success: function(data){
					var thirdCategory=data;
					let catagory="";
					if(Object.keys(data).length!=1){
						$('#button3').show();
						for(var i =0;i<data.length;i++){
							catagory+="<li><a id='"+i+"li' class='dropdown-item' href='javascript:categorys(4,"+i+")' onclick='javascript:reset3()' data-value='"+thirdCategory[i].first_option+"'>"+thirdCategory[i].first_option+"</a></li>";
						}
						$('#ul3').append(                     
								catagory              		
						);
					}else{
						if($('#category_firstCheck1').val()==""){
							$('#category_first1').val(categoryValue);
						}else if($('#category_firstCheck1').val()!="" && $('#category_firstCheck2').val()==""){
								$('#category_first2').val(categoryValue);
						}else if($('#category_firstCheck1').val()!="" && $('#category_firstCheck2').val()!=""){
								$('#category_first3').val(categoryValue);
						}else if($('#category_firstCheck1').val()!="" && $('#category_firstCheck2').val()!="" && $('#category_firstCheck3').val()!=""){
							Swal.fire({
								title:"??????????????? 3???????????? ?????????????????????.",
								icon:"error"
							});
							categorys(5,0);
						}
						let catagoryButton="<button id='Selectbutton' type='button' class='btn btn-secondary' onclick='selectedCategory()' style='margin-top:7px' >??????</button>";
						console.log("????????? categoryValue: "+categoryValue);
						$('#Cancelbutton').before(                     
								catagoryButton              		
							);
					}
					
				}
			});
		}else if(sequence==4){
			$('#Selectbutton').remove();
			var index=i;
			index+="li";
			let categoryValue=document.getElementById(index).getAttribute('data-value');
			$('#span3').text(categoryValue);
			if($('#category_firstCheck1').val()==""){
				$('#category_first1').val(categoryValue);
			}else if($('#category_firstCheck1').val()!="" && $('#category_firstCheck2').val()==""){
					$('#category_first2').val(categoryValue);
			}else if($('#category_firstCheck1').val()!="" && $('#category_firstCheck2').val()!=""){
					$('#category_first3').val(categoryValue);
			}else if($('#category_firstCheck1').val()!="" && $('#category_firstCheck2').val()!="" && $('#category_firstCheck3').val()!=""){
				Swal.fire({
					title:"??????????????? 3???????????? ?????????????????????.",
					icon:"error"
				});
				categorys(5,0);
			}
			let catagoryButton="<button id='Selectbutton' type='button' class='btn btn-secondary' onclick='selectedCategory()' style='margin-top:7px' >??????</button>";
			$('#Cancelbutton').before(                     
				catagoryButton              		
			);
		}else if(sequence==5){
			$('#button1').remove();
			$('#button2').remove();
			$('#button3').remove();
			$('#ul1').remove();
			$('#ul2').remove();
			$('#ul3').remove();
			$('#span1').remove();
			$('#span2').remove();
			$('#span3').remove();
			var div1="";
			div1+="<button id='button1' type='button' class='btn btn-outline-light dropdown-toggle' data-bs-toggle='dropdown' aria-expanded='false' style='color: black; border-color: black'>";
			div1+="<span id='span1'>?????????</span>";
			div1+="</button>";
			div1+="<ul id='ul1' class='dropdown-menu'>";
			div1+="<c:forEach items='${firstCategory1}' var='firstCategory' varStatus='index'>";
			div1+="<li><a id='li${index.index}' class='dropdown-item' href='javascript:categorys(2,${index.index})' onclick='javascript:reset()' data-value='${firstCategory.int_out}'>${firstCategory.int_out}</a></li>";
			div1+="</c:forEach>";
			div1+="</ul>";		
			$('#div1').append(                     
				div1              		
			);
			var div2="";
			div2+="<button id='button2' type='button' class='btn btn-outline-light dropdown-toggle' data-bs-toggle='dropdown' aria-expanded='false' style='color: black; border-color: black'>";
			div2+="<span id='span2'>???????????????</span>";
			div2+="</button>";
			div2+="<ul id='ul2' class='dropdown-menu'>";
			div2+="</ul>";
			$('#div2').append(                     
				div2              		
			);
			var div3="";
			div3+="<button id='button3' type='button' class='btn btn-outline-light dropdown-toggle' data-bs-toggle='dropdown' aria-expanded='false' style='color: black; border-color: black'>";
			div3+="<span id='span3'>???????????????</span>";
			div3+="</button>";
			div3+="<ul id='ul3' class='dropdown-menu'>";
			div3+="</ul>";
			$('#div3').append(                     
				div3              		
			);				
			$('#button2').hide();
			$('#button3').hide();
		}else if(sequence==6){
			$('#category_first1').val("");
			$('#category_first2').val("");
			$('#category_first3').val("");
			$('#category_firstCheck1').val("");
			$('#category_firstCheck2').val("");
			$('#category_firstCheck3').val("");
			$('#category_first').remove();
			$('#category_second').remove();
			$('#category_third').remove();
			$('#button1').remove();
			$('#button2').remove();
			$('#button3').remove();
			$('#ul1').remove();
			$('#ul2').remove();
			$('#ul3').remove();
			$('#span1').remove();
			$('#span2').remove();
			$('#span3').remove();
			$('#Selectbutton').remove();
			$('#ck1').remove();
			$('#ck2').remove();
			$('#ck3').remove();
			var div1="";
			div1+="<button id='button1' type='button' class='btn btn-outline-light dropdown-toggle' data-bs-toggle='dropdown' aria-expanded='false' style='color: black; border-color: black'>";
			div1+="<span id='span1'>?????????</span>";
			div1+="</button>";
			div1+="<ul id='ul1' class='dropdown-menu'>";
			div1+="<c:forEach items='${firstCategory1}' var='firstCategory' varStatus='index'>";
			div1+="<li><a id='li${index.index}' class='dropdown-item' href='javascript:categorys(2,${index.index})' onclick='javascript:reset()' data-value='${firstCategory.int_out}'>${firstCategory.int_out}</a></li>";
			div1+="</c:forEach>";
			div1+="</ul>";		
			$('#div1').after(                     
				div1              		
			);
			var div2="";
			div2+="<button id='button2' type='button' class='btn btn-outline-light dropdown-toggle' data-bs-toggle='dropdown' aria-expanded='false' style='color: black; border-color: black'>";
			div2+="<span id='span2'>???????????????</span>";
			div2+="</button>";
			div2+="<ul id='ul2' class='dropdown-menu'>";
			div2+="</ul>";
			$('#div2').after(                     
				div2              		
			);
			var div3="";
			div3+="<button id='button3' type='button' class='btn btn-outline-light dropdown-toggle' data-bs-toggle='dropdown' aria-expanded='false' style='color: black; border-color: black'>";
			div3+="<span id='span3'>???????????????</span>";
			div3+="</button>";
			div3+="<ul id='ul3' class='dropdown-menu'>";
			div3+="</ul>";
			$('#div3').after(                     
				div3              		
			);
			$('#button2').hide();
			$('#button3').hide();
		}
	}
	
	$(function(){
		$("#joinbutton").on("click",function(){
			var checkbox=$('#checkbox').is(':checked');
			console.log("checkbox: "+checkbox);
			if(!checkbox){
					Swal.fire({
						title:"ToGater ??????????????? ??????????????????.",
						icon:"warning"
						});
					return false;
			}
			var emailcheck = $("#email_id").val();
			emailcheck.trim();
			let check = /\S+@\S+\.\S+/;
			if(emailcheck != null){
				if (!check.test(emailcheck)) {
					Swal.fire({
						title:"???????????? ???????????? ???????????? ??????????????????.",
						icon:"warning"
						});
					$("#email_id").val("");
					return false;
				}
			}
			var pwcheck = $("#pwd_id").val();
			var pwcheck2 = $("#pwd2_id").val();
			if(pwcheck!=pwcheck2){
				Swal.fire({
					title:"??????????????? ????????????",
					icon:"warning"
					})
				return false;
			}
		
			if($('#category_firstCheck1').val()==""){ //<-- ????????? ??????????????? 0??? ??????????????? 0?????? ???????????? 0?????? ???????????????
				Swal.fire({
					title:"??????????????? ??????????????????",
					icon:"warning"
					});
				return false;
			}
			
			$.ajax({
				url: "../member/join.json",
				type: "POST",
				data: $('#joinform').serialize(),
				success: function(data){
					console.log(data);
					if(data==0){
						Swal.fire({
							   title:"???????????????!",
							   icon:"success"
							}).then((result)=>{
								location="../";
							});
					}else if(data==1){
						Swal.fire({
							title:"?????? ????????? ???????????????",
							icon:"error"
							});
					}else if(data==2){
						Swal.fire({
							title:"?????? ????????? ??????????????????.",
							icon:"error"
							});
						}
					}
			});
		});
	});
</script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
    //?????????????????????
      window.Kakao.init("11400a9267d93835389eb9255fcaad0b");
      function kakaojoin(){
    	  Kakao.Auth.loginForm({
            scope:'profile_nickname, account_email, gender,	birthday',
            success:function(authObj){
                console.log(authObj);
                window.Kakao.API.request({
                    url:'/v2/user/me',
                    success:res => {
                        const kakao_account =res.kakao_account;
                        console.log(kakao_account);
                        var kakaoname = res.properties['nickname'];
                        var kakaoemail = res.kakao_account.email;
                        var kakaogender = res.kakao_account.gender;
                        var kakaobirth = res.kakao_account.birthday;
                        $("#mname_id").val(kakaoname);
                        $("#email_id").val(kakaoemail);
                        $("#birth_id").val(kakaobirth);
                        if(kakaogender=="male") $("#gender1_id").prop('checked', true);
                        if(kakaogender=="female") $("#gender2_id").prop('checked', true);
                  		//alert("??????: "+kakaoname+",?????????: "+kakaoemail+",?????? : "+kakaobirth+",?????? : "+kakaogender);
                      //alert(res.kakao_account.email + ' (' + res.properties['nickname'] + ') ??? ???????????????.');
                              
                    }
                })
            }
          });
      }
      </script>
      <script>
		window.history.forward();
	 	function noBack(){window.history.forward();}
	</script>
	<script>
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // ???????????? ???????????? ????????? ??????????????? ????????? ????????? ???????????? ??????.
	
	                // ??? ????????? ?????? ????????? ?????? ????????? ????????????.
	                // ???????????? ????????? ?????? ?????? ????????? ??????('')?????? ????????????, ?????? ???????????? ?????? ??????.
	                var addr = ''; // ?????? ??????
	                var extraAddr = ''; // ???????????? ??????
	
	                //???????????? ????????? ?????? ????????? ?????? ?????? ?????? ?????? ????????????.
	                if (data.userSelectedType === 'R') { // ???????????? ????????? ????????? ???????????? ??????
	                    addr = data.roadAddress;
	                } else { // ???????????? ?????? ????????? ???????????? ??????(J)
	                    addr = data.jibunAddress;
	                }
	
	                // ???????????? ????????? ????????? ????????? ???????????? ??????????????? ????????????.
	                if(data.userSelectedType === 'R'){
	                    // ??????????????? ?????? ?????? ????????????. (???????????? ??????)
	                    // ???????????? ?????? ????????? ????????? "???/???/???"??? ?????????.
	                    if(data.bname !== '' && /[???|???|???]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // ???????????? ??????, ??????????????? ?????? ????????????.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // ????????? ??????????????? ?????? ??????, ???????????? ????????? ?????? ???????????? ?????????.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // ????????? ??????????????? ?????? ????????? ?????????.
	                    //document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    //document.getElementById("sample6_extraAddress").value = '';
	                }
	
	                // ??????????????? ?????? ????????? ?????? ????????? ?????????.
	                //document.getElementById('sample6_postcode').value = data.zonecode;//????????????
	                document.getElementById("maddr").value = addr;
	                // ????????? ???????????? ????????? ????????????.
	                document.getElementById("maddr2").focus();
	            }
	        }).open();
	    }
	</script>
  </head>

  <body onload="noBack();categorys(1,0)" onpageshow="if(event.persisted) noBack();">
    <!-- ======= Header ======= -->
    <header id="header" class="fixed-top">
      <div class="container d-flex align-items-center">
        <h1 class="logo me-auto"><a href="../">Togather</a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

        <nav id="navbar" class="navbar order-last order-lg-0">
          <ul>
            <c:if test="${m.athur eq 0}">
              <li><a class="manage" href="../membermg/mmlistPage">????????????</a></li>
            </c:if>
            <li><a class="active" href="../">Home</a></li>
            <li><a href="../about">About</a></li>
            <li><a href="../board/listPage">?????????</a></li>
            <c:if test="${m ne null}">
              <li><a href="../groupTab/myGroup.do?mnum=${m.mnum }">?????? ??????</a></li><!--?????????????????? ????????? ??????-->
              <li><a href="../wishTab/wishList?mnum=${m.mnum }">?????????
                <span id="numberOfWish" class="badge bg-dark text-white ms-1 rounded-pill">${wishsize }</span>
              </a></li>
            </c:if>
            <li class="dropdown">
              <a href="#"
              ><span>????????????</span> <i class="bi bi-chevron-down"></i
              ></a>
              <ul>
                <li><a href="../notification/notice">????????????</a></li>
                <li><a href="../faq/faqList">???????????? ??????</a></li>
                <li><a href="../qa">Q&A</a></li>
                <li><a href="../contact">Contact</a></li>
              </ul>
            </li>

            <c:choose>
              <c:when test="${m eq null}">
                <li><a href="../member/login.do">????????? ${sessionScope.m} </a></li>
              </c:when>
              <c:otherwise>
                <li><a href="javascript:void(0);" onclick="signout();">????????????</a></li>
                <li><a href="../mypage/main">???????????????</a></li>
              </c:otherwise>
            </c:choose>
          </ul>
          <i class="bi bi-list mobile-nav-toggle"></i>

        </nav>
        <!-- .navbar -->

        <c:choose>
          <c:when test="${m eq null}">
            <a href="member/joinform.do" class="get-started-btn">????????????</a>
          </c:when>
          <c:otherwise>
            <a href="../groupTab/groupCreate.do" class="get-started-btn">???????????????</a>
          </c:otherwise>
        </c:choose>


      </div>
    </header>
    <!-- End Header -->

    <main id="main">
      <!-- ======= Breadcrumbs ======= -->
      <div class="breadcrumbs" data-aos="fade-in">
        <div class="container">
          <h1>????????????</h1>
        </div>
      </div>
      <!-- End Breadcrumbs -->

      <!-- ======= Pricing Section ======= -->
      <section
        class="h-100"
        style="background-color: #eee; box-sizing: content-box"
      >
        <div class="container h-100" data-aos="flip-down">
          <div
            class="row d-flex justify-content-center align-items-center h-100"
          >
            <div class="col-lg-12 col-xl-11">
              <div class="card text-black" style="border-radius: 25px">
                <div class="card-body p-md-5">
                  <div class="row justify-content-center">
                    <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
                      <p class="text-center h1 fw-bold mb-3 mx-1 mx-md-4 mt-2">
                        <button
                          type="button"
                          class="btn btn-warning btn-lg btn-block mt-0 mb-0"
                          onclick="location.href='javascript:kakaojoin()'"
                        >
                          <i class="bi bi-chat-fill"></i>
                          ???????????? ???????????? ????????????
                        </button>
                      </p>
                      <p class="divider-text mt-2 mb-2">
                        <span class="bg-light">OR</span>
                      </p>
                      <!--?????????/????????????/??????/????????????/??????/????????????/????????????/??????-->
                      <form class="mx-1 mx-md-4" id="joinform">
                        <div class="d-flex flex-row align-items-center mb-0">
                          <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                          <div class="form-outline flex-fill mb-2">
                            <label class="form-label mb-0" for="form3Example1c"
                              >??????</label
                            >
                            <input
                              type="text"
                              name="mname"
                              id="mname_id"
                              class="form-control"
                              value=""
                            />
                          </div>
                        </div>
                        <div class="d-flex flex-row align-items-center mb-0">
                          <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                          <div class="form-outline flex-fill mb-2">
                            <label class="form-label mb-0" for="form3Example1c"
                              >?????????</label
                            >
                            <input
                              type="email"
                              name="email"
                              id="email_id"
                              class="form-control"
                              placeholder="example@google.com"
                              value=""
                            />
                          </div>
                        </div>

                        <div class="d-flex flex-row align-items-center mb-0">
                          <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                          <div class="form-outline flex-fill mb-2">
                            <label class="form-label mb-0" for="form3Example3c"
                              >????????????</label
                            >
                            <input
                              type="date"
                              name="birth"
                              id="birth_id"
                              class="form-control"
                              value=""
                              min="1985-01-02"
                              max="2003-12-31"
                            />
                          </div>
                        </div>
                        <div class="d-flex flex-row align-items-center mb-0">
                          <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                          <div class="form-outline flex-fill mb-2">
                            <label class="form-label mb-0" for="form3Example4c"
                              >????????????</label
                            >
                            <input
                              type="password"
                              name="pwd"
                              id="pwd_id"
                              class="form-control"
                              value=""
                            />
                          </div>
                        </div>
                        <div class="d-flex flex-row align-items-center mb-0">
                          <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                          <div class="form-outline flex-fill mb-2">
                            <label class="form-label mb-0" for="form3Example4c"
                              >???????????? ??????</label
                            >
                            <input
                              type="password"
                              name="pwd2_id"
                              id="pwd2_id"
                              class="form-control"
                            />
                          </div>
                        </div>
                        <div class="d-flex flex-row align-items-center mb-0">
                          <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                          <div class="form-outline flex-fill mb-2">
                            <label class="form-label mb-0" for="form3Example4c"
                              >????????????</label
                            >
                            <input
                              type="text"
                              name="phone"
                              pattern="[0-9]+"
                              id="phone_id"
                              class="form-control"
                              maxlength="11"
                              value=""
                              oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
                            />
                          </div>
                        </div>
                        <div id='firstappendDiv' style='padding: 0px 15px 7px' class='d-flex flex-row align-items-center mb-0'>
                        </div>
                        <div  id="selectdiv1" class="d-flex flex-row align-items-center mb-0">
                          <i class="fas fa-key fa-lg me-3 fa-fw"></i>
                          <div id="selectdiv2" class="form-outline flex-fill mb-2">
                           <!-- ???????????? ????????? -->
                          	<div id="div1" class="btn-group">
									<button id="button1"
									  type="button"
									  class="btn btn-outline-light dropdown-toggle"
									  data-bs-toggle="dropdown"
									  aria-expanded="false"
									  style="color: black; border-color: black">
									<span id='span1'>?????????</span>
									</button>
									<ul id="ul1" class="dropdown-menu">
									</ul>
								  </div>
							
								  <div id="div2" class="btn-group" style="margin-left: 5px">
									<button
									  type="button" id="button2"
									  class="btn btn-outline-light dropdown-toggle"
									  data-bs-toggle="dropdown"
									  aria-expanded="false"
									  style="color: black; border-color: black">
									<span id='span2'>???????????????</span>
									</button>
									<ul id="ul2" class="dropdown-menu">
									</ul>
								  </div>
							
								  <div id="div3" class="btn-group" style="margin-left: 5px">
									<button
									  type="button" id="button3"
									  class="btn btn-outline-light dropdown-toggle"
									  data-bs-toggle="dropdown"
									  aria-expanded="false"
									  style="color: black; border-color: black">
										<span id='span3'>???????????????</span> 
									</button>
									<ul id="ul3" class="dropdown-menu">
									</ul>
								  </div>
 									<input id="category_first1" type="hidden"  value="">	
 									<input id="category_first2" type="hidden"  value="">
 									<input id="category_first3" type="hidden"  value="">
 									<input id="category_firstCheck1" type="hidden"  value="">	
 									<input id="category_firstCheck2" type="hidden"  value="">
 									<input id="category_firstCheck3" type="hidden"  value="">
 									<input id="checkBox1" type="hidden"  value="">	
 									<input id="checkBox2" type="hidden"  value="">
 									<input id="checkBox3" type="hidden"  value="">
 									<div align="right">
 									<button id='Cancelbutton' type='button' class='btn btn-secondary' onclick='categorys(6,0)' style='margin:7px 0px 0px 5px' >??????</button>
 									</div>				
					          <!-- ???????????? ????????? -->
                          </div>
                        </div>
                        
                         <div class="d-flex flex-row align-items-center mb-0">
                          <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                          <div class="form-outline flex-fill mb-2">
                            <label class="form-label mb-0" for="form3Example1c"
                              >?????????</label
                            >
                            <input
                              id="maddr"
                              type="text"
                              name="maddr"
                              class="form-control"
                              value=""
                              placeholder="???????????????????????????"
                              onclick="sample6_execDaumPostcode()"
                              readonly
                            /> 
                            <input
                              id="maddr2"
                              type="text"
                              name="maddr"
                              class="form-control"
                              value=""
                              placeholder="????????????"
                              onclick="sample6_execDaumPostcode()"
                              
                            />
                            <input type="button" onclick="sample6_execDaumPostcode()" value="?????? ??????">
                            
                          </div>
                        </div>

                        <div class="d-flex flex-row align-items-center mb-0">
                          <i class="fas fa-key fa-lg me-3 fa-fw"></i>
                          <div class="form-outline flex-fill mb-2">
                            <label class="form-label mb-0" for="form3Example4cd"
                              >????????????</label
                            >
                            <select id="pfr_loc_id" class="form-control" name="pfr_loc">
                              <option>??????</option>
                              <option value="??????">??????</option>
                              <option value="??????">??????</option>
                              <option value="??????">??????</option>
                              <option value="??????">??????</option>
                              <option value="??????">??????</option>
                              <option value="??????">??????</option>
                              <option value="??????">??????</option>
                              <option value="??????">??????</option>
                              <option value="??????">??????</option>
                              <option value="??????">??????</option>
                              <option value="??????">??????</option>
                            </select>
                          </div>
                        </div>

                        <div class="d-flex flex-row align-items-center mb-0">
                          <i class="fas fa-key fa-lg me-3 fa-fw"></i>
                          <div class="form-outline flex-fill mb-2">
                            <label class="form-label mb-0" for="form3Example4cd"
                              >??????</label
                            ><br />
                            <div
                              class="btn-group btn-group-toggle col-12"
                              data-toggle="buttons"
                            >
                              <label class="btn btn-light active">
                                <input
                                  type="radio"
                                  name="gender"
                                  id="gender1_id"
                                  value="male"
                                  autocomplete="off"
                                  checked
                                />
                                ???
                              </label>
                              <label class="btn btn-light">
                                <input
                                  type="radio"
                                  name="gender"
                                  value="female"
                                  id="gender2_id"
                                  autocomplete="off"
                                />
                                ???
                              </label>
                            </div>
                            <br />
                            <br />
                          </div>
                        </div>

                        <div
                          class="form-check d-flex justify-content-center mb-3"
                        >
                          <input
                            class="form-check-input me-2"
                            type="checkbox"
                            value=""
                            id="checkbox"
                          />
                          <label class="form-check-label" for="form2Example3">
                            <a href="#!">ToGather ????????????</a>???
                            ???????????????(??????)
                          </label>
                        </div>

                        <div
                          class="d-flex justify-content-center mx-4 mb-3 mb-lg-4"
                        >
                          <button
                            type="button"
                            class="btn btn-success"
                            style="margin-right: 30px" id="joinbutton"
                            
                          >
                            ????????????
                          </button>
                          <button type="button" class="btn btn-secondary" onclick="joinCancel()">
                            ??????
                          </button>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- End Pricing Section -->
    </main>
    <!-- End #main -->

    <!-- ======= Footer ======= -->
    <footer id="footer">
      <div class="footer-top">
        <div class="container">
          <div class="row">
            <div class="col-lg-3 col-md-6 footer-contact">
              <h3>Togather</h3>
              <p>
                ????????? ?????????<br/>
                ?????? ????????? 2??? 123<br/>
                ?????????????????? 2???<br/><br/>
                <strong>Phone:</strong>+82 2 1234 1234<br/>
                <strong>Email:</strong>service@togather.com<br/>
              </p>
            </div>

            <div class="col-lg-2 col-md-6 footer-links">
              <h4>Useful Links</h4>
              <ul>
                <li>
                  <i class="bx bx-chevron-right"></i> <a href="../">Home</a>
                </li>
                <li>
                  <i class="bx bx-chevron-right"></i> <a href="../about">About us</a>
                </li>
                <li>
                  <i class="bx bx-chevron-right"></i> <a href="#">Services</a>
                </li>
                <li>
                  <i class="bx bx-chevron-right"></i>
                  <a href="#">Terms of service</a>
                </li>
                <li>
                  <i class="bx bx-chevron-right"></i>
                  <a href="#">Privacy policy</a>
                </li>
              </ul>
            </div>

            <div  class="col-lg-3 col-md-6 footer-links">
              <h4>Our Services</h4>
              <ul>
                <li>
                  <i class="bx bx-chevron-right"></i> <a href="../notification/notice">????????????</a>
                </li>
                <li>
                  <i class="bx bx-chevron-right"></i>
                  <a href="../faq/faqList">?????? ?????? ??????</a>
                </li>
                <li>
                  <i class="bx bx-chevron-right"></i>
                  <a href="../qa">Q & A</a>
                </li>
                <li>
                  <i class="bx bx-chevron-right"></i> <a href="../contact">Contact</a>
                </li>
              </ul>
            </div>

            <div class="col-lg-4 col-md-6 footer-newsletter">
              <h4>???????????? ????????????</h4>
              <p>
                ???????????? ??? ???????????? ????????? ?????? ??????????????? ????????? ??? ????????????.
              </p>
              <form action="" method="post">
                <input type="email" name="email"/><input
                      type="submit"
                      value="Subscribe"
              />
              </form>
            </div>
          </div>
        </div>
      </div>

      <div class="container d-md-flex py-4">
        <div class="me-md-auto text-center text-md-start">
          <div class="copyright">
            &copy; Copyright<strong><span>Togather</span></strong
          >. All Rights Reserved
          </div>
        </div>
        <div class="social-links text-center text-md-right pt-3 pt-md-0">
          <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
          <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
          <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
          <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
          <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
        </div>
      </div>
    </footer>
    <!-- End Footer -->
  </body>
  <div id="preloader"></div>
  <a
    href="#"
    class="back-to-top d-flex align-items-center justify-content-center"
    ><i class="bi bi-arrow-up-short"></i
  ></a>

  <!-- Vendor JS Files -->
  <script src="/assets/vendor/purecounter/purecounter.js"></script>
  <script src="/assets/vendor/aos/aos.js"></script>
  <script src="/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="../assets/js/main.js"></script>
</html>
