<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
      rel="stylesheet"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
      rel="stylesheet"
    />

    <link
      href="/assets/vendor/bootstrap-icons/bootstrap-icons.css"
      rel="stylesheet"
    />
    <link href="/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
    <link href="/assets/vendor/remixicon/remixicon.css" rel="stylesheet" />
    <link href="/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />

    <!-- Template Main CSS File -->
    <link href="/assets/css/style.css" rel="stylesheet" />
    
    <!-- Kakao Map API Key -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=11400a9267d93835389eb9255fcaad0b&libraries=services,clusterer"></script>
  
    <!-- alert -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <!-- alert -->
	<script type="text/javascript" language="javascript" 
		     src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script>
      Kakao.init('11400a9267d93835389eb9255fcaad0b');
      function signout(){
        if(Kakao.Auth.getAccessToken() != null){
          Kakao.Auth.logout(function(){
            setTimeout(function(){
              location.href="../member/logout.do";
            },500);
          });
        }else{
          location.href="../member/logout.do";
        }
      }
    </script>
			  
	<script type="text/javascript">
	function gatheringJoin(){
    	Swal.fire({
			  title: '????????? ?????? ???????????????????',
			  icon: 'question',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes'
			}).then((result) => {
				if(${gatheringMemberCount} >= ${gatheringInfo.ga_limit}){
					Swal.fire({
						title: '?????? ?????? ????????? ??? ????????????',
						icon: 'warning',
						showCancelButton: false,
						confirmButtonColor: '#3085d6',
						confirmButtonText: 'Yes'
					});
					return false;
				}else if (result.isConfirmed) {
				var mnum = ${m.mnum};
	  			var ga_seq = ${gatheringInfo.ga_seq};
	  			var result = {"mnum":mnum,"ga_seq":ga_seq};
		  		$(function(){
  				$.ajax({
	   					url: "memInGathering.json",
	   					type: "POST",
	   					data: result,
	   					success: function(data){
	   					}
  				});
  				location.reload(); 
		  		});
		  		
			  }  			  
			});
    	}
	
	function gatheringQuit(){
		Swal.fire({
			  title: '?????? ????????? ?????? ???????????????????',
			  icon: 'question',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes'
			}).then((result) => {
			  if (result.isConfirmed) {
				var mnum = ${m.mnum};
					var gseq = ${gatheringInfo.gseq};
		  			var ga_seq = ${gatheringInfo.ga_seq};
		  			var result = {"mnum":mnum,"ga_seq":ga_seq};
  		  		$(function(){
    				$.ajax({
	   					url: "gatheringQuit.json",
	   					type: "POST",
	   					data: result,
	   					success: function(data){
	   						if(data == 0){
	   location.href="../groupTab/groupInfo.do?gseq=${gatheringInfo.gseq}&mnum=${m.mnum}";
	   						}else{
	   							location.reload();
	   						}
	   					}
    				}); 
  		  		});
  		  		
			  }  			  
			});
	}
	function gatheringDeleteCheck(){ 
		var mnum = ${m.mnum};
		var ga_seq = ${gatheringInfo.ga_seq};
		var result = {"mnum":mnum,"ga_seq":ga_seq};
  			$(function(){
			$.ajax({
  					url: "gatheringDeleteCheck.json",
  					type: "POST",
  					data: result,
  					success: function(data){
                      if(data==0 || ${m.athur eq 0}){//?????????????????????
                        gatheringDelete();
                        console.log("check0: "+data);
                      }else if(data==1  || ${m.athur eq 1}){//???????????????
                        gatheringDelete();
                      }else{//????????? ?????????
                        console.log("check1: "+data);
                        Swal.fire({
                          title: "???????????? ?????? ???????????????",
                          icon: "error"
                        });
  						}
  					}
  				});  
  			});
	}
	
	function gatheringUpdateCheck(){ 
		var mnum = ${m.mnum};
		var ga_seq = ${gatheringInfo.ga_seq};
		var result = {"mnum":mnum,"ga_seq":ga_seq};
  			$(function(){
			$.ajax({
  					url: "gatheringUpdateCheck.json",
  					type: "POST",
  					data: result,
  					success: function(data){
                      if(data==0 || ${m.athur eq 0}){//?????????????????????
                        gatheringUpdate();
                        console.log("check0: "+data);
                      }else if(data==1 || ${m.athur eq 1}){//???????????????
                        gatheringUpdate();
                        console.log("check1: "+data);
                        //swal("?????????,???????????? ?????? ???????????????");
                      }else if(data==2){//????????????
                        console.log("check2: "+data);
                        Swal.fire({
                          title: "???????????? ?????? ???????????????",
                          icon: "error"
                        });
                      }else {//??????????????????
                        Swal.fire({
                          title: "???????????? ?????? ???????????????",
                          icon: "error"
                        });
  						}
  					}
  				});  
  			});
	}
	
	function gatheringUpdate(){
		location="gatheringUpdate.do?ga_seq=${gatheringInfo.ga_seq}&mnum=${m.mnum}";
	}
	function gatheringDelete(){
		location="gatheringDelete.do?ga_seq=${gatheringInfo.ga_seq}&gseq=${gatheringInfo.gseq}&mnum=${m.mnum}";
	}
	function memberInfo(index){
		var arr = new Array();
		<c:forEach var="memInGatheringName" items="${memInGatheringName}">	              
        	arr.push({mnum:"${memInGatheringName.MNUM}"});
    	</c:forEach>
    	baby_login = window.open(
    	  "../member/memberInfo?mnum="+arr[index].mnum+"&ga_seq=${gatheringInfo.ga_seq}", "memberInfo", 
    	   "width=1000, height=900, top=100, left=100");
    }
	
	
	</script>
	
	
	
  </head>

  <body>
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

        <!--?????????????????? ??????????????? ????????? ??????????????? ?????????????????? ????????? ????????? ???????????-->
        <c:choose>
          <c:when test="${m eq null}">
            <a href="../member/joinform.do" class="get-started-btn">????????????</a>
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
          <h1>${gatheringInfo.ga_name}</h1>
        </div>
      </div>
      <!-- End Breadcrumbs -->

      <!-- ======= Cource Details Section ======= -->

      <section id="course-details" class="course-details">
        <div class="container" data-aos="fade-up">
          </ul>
          <div class="row">
              <div class="col-lg-2">

              </div>
            <div class="col-lg-4">
          <div id="map" style="width:100%;height:500px;"></div>
          <script type="text/javascript">
				var inputData = ['${gatheringInfo.ga_place}']
				var mapContainer = document.getElementById('map'), // ????????? ????????? div
					mapOption = {
						center: new kakao.maps.LatLng(33.450701, 126.570667), // ????????? ????????????
						level: 3 // ????????? ?????? ??????
					};
				// ????????? ????????? div??? ?????? ???????????? ????????? ???????????????
				var map = new kakao.maps.Map(mapContainer, mapOption);
				var count = 0;
				var ps = new kakao.maps.services.Places();
				var bounds = new kakao.maps.LatLngBounds();
				var checkCoor;
				if (inputData != null) {
					kewwordSearch(inputData[count]);
				}
				function kewwordSearch(keword) {
					ps.keywordSearch(keword, placesSearchCB);
					count = count + 1;
				}
				function placesSearchCB(data, status, pagination) {
					if (status === kakao.maps.services.Status.OK) {
						displayMarker(data[0]);
						bounds.extend(new kakao.maps.LatLng(data[0].y, data[0].x));
							if (count < inputData.length) {
								kewwordSearch(inputData[count]);
							} else if (count == inputData.length) {
								setBounds();
							}
					}
				}
				var ma;
				var la;
				var wf3Am, wf3Pm, wf4Am, wf4Pm, wf5Am, wf5Pm, wf6Am, wf6Pm, wf7Am, wf7Pm;
				var geocoder = new kakao.maps.services.Geocoder();
				var callback = function(result, status) {
				    if (status === kakao.maps.services.Status.OK) {
				        $('#acodeId').val(result[0].code);
				        var applidate = $('#applidate').text();
				        $.ajax({
			  				url:"getWeather",
			  				type:"GET",
			  				dataType:"json",
			  				contentType: "application/json",
			  				data: {
			  					La:la,
			  					Ma:ma,
			  					Acode:result[0].code,
			  					appliDate:applidate
			  				},
			  				success: function(result){
			  					console.log("success: "+result);
			  					console.log("result wf5Pm: "+result.wf5Pm);
			  					$('#dateInfo').text("?????? ??? ???: "+result.diffDate +" (??? ??? ?????? ??????)");
			  					wf3Am=result.wf3Am;
			  					wf3Pm=result.wf3Pm;
			  					wf4Am=result.wf4Am;
			  					wf4Pm=result.wf4Pm;
			  					wf5Am=result.wf5Am;
			  					wf5Pm=result.wf5Pm;
			  					wf6Am=result.wf6Am;
			  					wf6Pm=result.wf6Pm;
			  					wf7Am=result.wf7Am;
			  					wf7Pm=result.wf7Pm;
			  				},
			  				error: function(error){
			  					console.log("fail: "+error);
			  				}
			  			});
				    }
				}; 
				var climateFlag=0;
				function getClimate(e){ 
					if(climateFlag==0){
						$('#clioption').remove();
						$('#climateInfo').after(
							"<div id=\"clioption\" class=\"text-center\"> "
							+" <p>3?????? ????????????: "+wf3Am+" ????????????: "+wf3Pm+"<br>"
							+" 4?????? ????????????: "+wf4Am+" ????????????: "+wf4Pm+"<br>"
							+" 5?????? ????????????: "+wf5Am+" ????????????: "+wf5Pm+"<br>"
							+" 6?????? ????????????: "+wf6Am+" ????????????: "+wf6Pm+"<br>"
							+" 7?????? ????????????: "+wf7Am+" ????????????: "+wf7Pm+"</p>"
							+"</div>"
						);
						climateFlag = 1;
					}else{
						$('#clioption').remove();
						climateFlag = 0;
					}
				}
				function displayMarker(place) {
					var marker = new kakao.maps.Marker({
						map: map,
						position: new kakao.maps.LatLng(place.y, place.x)
					});
					var acode1 = geocoder.coord2RegionCode(place.x, place.y, callback);
 					var acode = $('#acodeId').val();
 					console.log("acode??????: "+typeof(acode));
 					String(acode);
					console.log("acode: "+acode);
					console.log("acode??????: "+typeof(acode));
					console.log(marker.getPosition());
					var coord = new kakao.maps.LatLng(place.y, place.x);		
					la = place.y;
					ma = place.x;
					kakao.maps.event.addListener(marker, 'click', function () {
						var position = this.getPosition();
						var url = 'https://map.kakao.com/link/map/' + place.id;
						window.open(url, '_blank');
						console.log(checkCoor);
					});
				}
				function setBounds() {
					map.setBounds(bounds, 90, 30, 10, 30);
				}
	</script>
          
              </div>
              
            <div class="col-lg-4">
              <div
                class="course-info d-flex justify-content-between align-items-center"
              >
                <h5><i class="bi bi-hand-thumbs-up"></i></h5>
                <p>${gatheringCreateName.mname}</p>
              </div>

              <div
                class="course-info d-flex justify-content-between align-items-center"
              >
                <h5><i class="bi bi-calendar4"></i></h5>
                <p id="applidate">${gatheringInfo.ga_date}</p>
              </div>
              <div
                class="course-info d-flex justify-content-between align-items-center"
              >
                <h5><i class="bi bi-clock"></i></h5>
                <p>${gatheringInfo.time}</p>
              </div>

              <div
                class="course-info d-flex justify-content-between align-items-center"
              >
                <h5><i class="bi bi-geo-alt"></i></h5>
                <p>${gatheringInfo.ga_place}</p>
               
              </div>
               <div id="climateInfo" onclick="getClimate(this)" 
                class="course-info d-flex justify-content-between align-items-center"
              >
                <h5><i class="bi bi-geo-alt"></i></h5>
                <p id="dateInfo">????????? ??????</p>
              </div>
             
              <div
                class="course-info d-flex justify-content-between align-items-center"
              >
                <h5><i class="bi bi-cash-coin"></i></h5>
                <p>${gatheringInfo.price}</p>
              </div>
              
              <div
                class="course-info d-flex justify-content-between align-items-center"
              >
                <h5><i class="bi bi-people"></i></h5>
                <nav id="navbar" class="navbar order-last order-lg-0">
                <div class="dropdown">
                <a href="#">
	              ${gatheringMemberCount}/${gatheringInfo.ga_limit}???
	            </a>
	              <ul>
	              <c:forEach var="memInGatheringName" items="${memInGatheringName}" varStatus="index">
		              <c:choose>
			              <c:when test="${memInGatheringName.GRADE eq 0}">
			              	<c:set var="grade" value="?????????"/>
			              </c:when>
			              <c:when test="${memInGatheringName.GRADE eq 1}">
			              	<c:set var="grade" value="?????????"/>
			              </c:when>
			              <c:otherwise>
			              	<c:set var="grade" value=""/>
			              </c:otherwise>
		              </c:choose>
		               <c:choose>
			              <c:when test="${m.mnum eq memInGatheringName.MNUM}">
			                <li><a href="javascript:void(0)">${memInGatheringName.MNAME}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${grade}(???)</a></li>
			              </c:when>
			              <c:otherwise>  
			                <li><a href="javascript:void(0)" onclick="location.href='javascript:memberInfo(${index.index})'">${memInGatheringName.MNAME}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${grade}</a></li>
			              </c:otherwise>
		              </c:choose>
	              </c:forEach>
	              </ul>
	            </div>
	            </nav>
              </div>
              <div class="d-grid gap-2 mt-3 mb-3">
              <c:choose>
	              <c:when test="${memInGatheringCheck eq null}">
	                <button type="button" class="btn btn-outline-primary"
	                onclick="location.href='javascript:gatheringJoin()'">
	                    ????????????
	                  </button>
                  </c:when>
                  <c:otherwise>
	                   <button type="button" class="btn btn-outline-danger"
	                onclick="location.href='javascript:gatheringQuit()'">
	                    ?????? ??????
	                  </button>
                  </c:otherwise>
               </c:choose>
                <button type="button" class="btn btn-outline-secondary" 
                onclick="location.href='javascript:gatheringUpdateCheck()'">
                  ?????? ????????????
                </button>
                <button type="button" class="btn btn-outline-secondary"
                onclick="location.href='javascript:gatheringDeleteCheck()'">
                  ?????? ????????????
                </button>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- End Cource Details Section -->
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
    <script src="/assets/js/main.js"></script>
  </body>
</html>

