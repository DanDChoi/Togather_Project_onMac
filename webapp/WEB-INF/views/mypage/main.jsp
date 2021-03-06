<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
	<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
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
	<!-- alert  -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<!-- alert -->
	<!-- my page  -->
	<link href="/assets/css/mypage.css" rel="stylesheet" />
	<!-- Template Main CSS File -->
	<link href="/assets/css/style.css" rel="stylesheet" />
	<!-- ???????????? ?????? -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$('.main i').on('click',function(){
				$('input').toggleClass('active');
				if($('input').hasClass('active')){
					$(this).attr('class',"fa fa-eye-slash fa-lg")
							.prev('input').attr('type',"text");
				}else{
					$(this).attr('class',"fa fa-eye fa-lg")
							.prev('input').attr('type','password');
				}
			});
		});

		$(function(){
			$("#updatebutton").on("click",function(){
				$.ajax({
					url: "../mypage/nowpassword.json",
					type: "POST",
					data: $('#updateform').serialize(),
					success: function(data){
						console.log(data);

						if(data==0){
							var pwcheck = $("#pwd1").val();
							var pwcheck2 = $("#pwd2").val();
							if(pwcheck!=pwcheck2){
								Swal.fire({
									title:"??????????????? ????????????",
									icon:"warning"
								})
								return false;
							}
							else{
								var pwcheck = $("#pwd1").val();
								Swal.fire({
									title: '?????? ??????!',
									icon: 'success',
									confirmButtonColor: '#3085d6',
									cancelButtonColor: '#d33',
									confirmButtonText: 'oK'
								}).then((result) => {
									console.log(result.isConfirmed);
									if (result.isConfirmed) {
										location.href="../mypage/updatepassword?mnum=${m.mnum}&pwd="+pwcheck;
									}
								});

							}
						}else if(data==1){
							Swal.fire({
								title:"??????",
								icon:"error"
							});
						}
					}
				});
			});
		});

		$(function(){
			$("#updatebutton2").on("click",function(){
				$.ajax({
					url: "../mypage/updatemaddrandpfr_loc.json",
					type: "POST",
					data: $('#updateform2').serialize(),
					success: function(data){

						if(data==0 ){
							var pfr_loc = $("#pfr_loc").val();
							var maddr = $("#maddr").val();
							Swal.fire({
								title: ' ?????? ????????? ????????????.',
								icon: 'warning',
								confirmButtonColor: '#3085d6',
								cancelButtonColor: '#d33',
								confirmButtonText: 'oK'
							});
							return false;
						}else{
							var pfr_loc = $("#pfr_loc").val();
							var maddr = $("#maddr").val();
							Swal.fire({
								title: '?????? ??????!',
								icon: 'success',
								confirmButtonColor: '#3085d6',
								cancelButtonColor: '#d33',
								confirmButtonText: 'oK'
							}).then((result) => {
								console.log(result.isConfirmed);
								if (result.isConfirmed) {
									location.href="../mypage/main";

								}
							});
						}
					}
				});
			});
		});
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


	<script type="text/javascript">
		function winPopup() {
			let email = $("#email").val();
			var popUrl = "updateemail?email="+email;
			var popOption = "width=430, height=500, left= 600,status=no,scrollbars=no";
			window.open(popUrl,"????????? ??????", popOption);
		}

		function winPopup2() {
			var popUrl = "categoryform.do";
			var popOption = "width=600, height=700, left= 600,status=no,scrollbars=no";
			window.open(popUrl,"????????? ??????", popOption);
		}
	</script>
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
<main id="main" data-aos="fade-in">
	<!-- ======= Breadcrumbs ======= -->
	<div class="breadcrumbs">
		<div class="container">
			<h2>???????????????</h2>
		</div>
	</div>

	<!-- ======= Breadcrumbs ======= -->

	<!-- End Breadcrumbs -->

	<!-- ======= Contact Section ======= -->
	<section id="contact" class="contact">
		<div data-aos="fade-up">
		</div>

		<div class="container" style="margin-top: 100px">
			<div class="row gutters">
				<div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
					<div class="card h-100">
						<div class="card-body mt-5">
							<div class="account-settings">
								<div class="user-profile">
									<!-- ??????
                                    <div class="user-avatar">
                                       <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Maxwell Admin">
                                    </div>

                                    -->
									<h5 class="user-name">${m.mname}</h5>
									<h6 class="user-email">${member.email}</h6>
								</div>
								<div class="about">
									<h5>?????????</h5>

									<p><c:choose>
										<c:when test="${m.category_first eq null}">

										</c:when>
										<c:otherwise>
											${m.category_first}
										</c:otherwise>
									</c:choose></p>
									<p>
										<!-- ????????? ??????????????? ?????? ????????? -->
									<p>
										<c:choose>
											<c:when test="${ not empty m.category_second }">
												${m.category_second}
											</c:when>
											<c:otherwise>

											</c:otherwise>
										</c:choose>
									</p>
									<p>
										<!-- ????????? ?????? ????????? ???????????????-->
									<p>
										<c:choose>
											<c:when test="${not empty m.category_third }">
												${m.category_third}
											</c:when>
											<c:otherwise>

											</c:otherwise>
										</c:choose>
									</p>
									<p>
										<button type="button" class="btn btn-secondary"  onclick="winPopup2();">??????</button>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
					<div class="card h-100">
						<div class="card-body">
							<form name="f" id="updateform" name="updateform">
								<div class="row gutters">
									<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
										<h6 class="mb-2 text-primary">????????????</h6>
									</div>

									<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
										<div class="form-group">
											<label for="mname">??????</label>
											<input type="text" name = "mname" value = "${m.mname}"class="form-control" id="mname" placeholder="Enter full name" disabled>
										</div>
									</div>
									<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
										<div class="form-group">
											<label for="password">??????????????????</label>
											<input type="password" name = "pwd" value = "" class="form-control" id="pwd" >
										</div>
									</div>

									<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">

										<div class="form-group">

											<label for="phone">????????????</label>
											<div class = "main" style="position:relative">
												<input type="password" name = "phone" value = "${m.phone}"  class="form-control" id="phone" style="display:inline-block" readonly  >
												<i class="fa fa-eye fa-lg" style="position:absolute; left:420px; bottom:10px"></i>
											</div>
										</div>
									</div>


									<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
										<div class="form-group">
											<label for="pwd1">????????????</label>
											<input type="password" id = "pwd1" name = "pwd1" value = "" class="form-control" >
										</div>
									</div>
									<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
										<div class="form-group">
											<label for="website">?????????</label>
											<div class = "input-group">
												<input type="url" name = "email" id = "email" value = "${member.email}" readonly class="form-control" id="email" >
												<span class="input-group-btn">
                        <button type="button" class="btn btn-secondary"  onclick="winPopup();">??????</button>
                     </span>
											</div>
										</div>
									</div>

									<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
										<div class="form-group" >
											<label for=pwd2>???????????? ??????</label>
											<div align = "right">
												<input type="password" id = "pwd2" name = "pwd2" value = "" class="form-control" >

												<button type="button" id="updatebutton" name="updatebutton" class="btn btn-secondary mt-2">??????</button>
											</div>
										</div>
									</div>
								</div>
								<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">

								</div>
							</form>

							<form name="f2" id="updateform2" name="updateform2" method = "POST">
								<div class="row gutters">
									<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
										<h6 class="mt-3 mb-2 text-primary">????????????</h6>
									</div>
									<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">

										<div class="form-group">
											<label for="website">?????????</label>

											<input type="text" name = "maddr" id = "maddr" onclick="sample6_execDaumPostcode()" value = "${member.maddr}"  class="form-control"  readonly>
											<input
													id="maddr2"
													type="text"
													name="maddr"
													class="form-control"
													value=""
													placeholder="????????????"


											/>
											<div align = "right">
												<button type="button" id="updatebutton2" name="updatebutton2" class="btn btn-primary mt-2 float-right " >??????</button>
											</div>
										</div>
									</div>
									<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
										<div class="form-group">
											<label for="ciTy">????????????</label>
											<select class="form-control"  name="pfr_loc" id = "pfr_loc">
												<option selected >${member.pfr_loc}</option>
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
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>
	<!-- End Contact Section -->
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