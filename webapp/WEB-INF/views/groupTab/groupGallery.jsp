<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html >
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

    <!-- alert -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

    <!-- JQuery -->
    <script type="text/javascript" language="javascript"
            src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<!-- ??????????????? -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/css/lightbox.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/js/lightbox.min.js"></script>
   	
   	
    <script type="text/javascript">
	    function galleryUpload() {
	        var mnum = ${m.mnum};
	        var gseq = ${groupGallery.gseq};
	        var popUrl = "galleryUpload.do?gseq=" + gseq + "&mnum=" + mnum;
	        var popOption = "width=430, height=380, left= 600,status=no,scrollbars=no";
	        window.open(popUrl,"???????????????", popOption);
	    }
   </script>
   <script type="text/javascript">
   		function authCheck(check){
   			Swal.fire({
  			  title: '????????? ?????????????????????????',
  			  icon: 'question',
  			  showCancelButton: true,
  			  confirmButtonColor: '#3085d6',
  			  cancelButtonColor: '#d33',
  			  confirmButtonText: 'Yes'
  			}).then((result) => {
  			if (result.isConfirmed) {
   			var mnum = ${m.mnum};
   			var gseq = ${groupGallery.gseq};
  			var galseq = check;
  			var result = {"mnum":mnum,"gseq":gseq};
    				$.ajax({
	   					url: "galleryDeleteCheck.json",
	   					type: "POST",
	   					data: result,
	   					success: function(data){
	   						if(data==0){//?????????????????????
	   							galleryDelete(galseq, gseq);
	   							console.log("check0: "+data);
	   						}else{//????????? ?????????
	   							var result2 = {"mnum":mnum, "galseq":galseq}
	   							$.ajax({
	   			   					url: "galleryDeleteCheck2.json",
	   			   					type: "POST",
	   			   					data: result2,
	   			   					success: function(data){
	   			   						if(data == 1){
	   			   							galleryDelete(galseq, gseq);
	   			   							
	   			   						}else{
		   			   						Swal.fire({
		  		  							  title: "???????????? ?????? ???????????????",
		  		  							  icon: "error"
	  	   									});
	   			   						}
	   			   					}
	   							});
	   						}
	   					}
	   				});
  				}
  			});
   		}
   		function galleryDelete(galseq, gseq){
   			location="galleryDelete.do?gseq="+gseq+"&mnum=${m.mnum}&galseq="+galseq+"&page=1&pageSize=${cri.pageSize}";
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
<!-- ????????? ??? ??????????????? css -->
<style>
	.del_link{
        display: none;
        background-color: rgba(0,0,0,0.5);
        position: absolute;
        top: 0;
        right: 0;
        padding: 2px 10px;
        color: #fff;
	    }
    .img_link {
        position: relative;
        display: inline-block;
    }
    .jisu:hover+.del_link {
        display: block;
    }
    .jisu:hover>.del_link {
        display: block;
    }
</style>
<!-- ????????? ??? ??????????????? css  -->
<body>
<!-- ======= Header ======= -->
<header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">
        <h1 class="logo me-auto"><a href="../">Togather</a></h1>

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

<main id="main">
    <!-- ======= Breadcrumbs ======= -->
    <div class="breadcrumbs" data-aos="fade-in">
        <div class="container">
            <h1>${groupGallery.gname}</h1>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- ======= Cource Details Section ======= -->
    <section id="course-details" class="course-details">
        <div class="container" data-aos="fade-up">
            <!-- ????????? nav ??? -->
            <ul class="nav nav-tabs mb-3">
                <li class="nav-item">
                    <a class="nav-link" href="groupInfo.do?gseq=${groupGallery.gseq}&mnum=${m.mnum}">??????</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">?????????</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../gboard/gblistPage?gseq=${groupGallery.gseq}&mnum=${m.mnum}">?????????</a>
                </li>
            </ul>
            <!-- ?????? ????????? ????????? -->
            <div align="right">
                <button type="button" class="btn btn-outline-dark mb-3" onclick="galleryUpload();">?????? ?????????</button>
            </div>
            <!-- Gallery -->
            <div class="row">
                <div class="col-lg-4 col-md-12 mb-4 mb-lg-0">
                    <c:if test="${gallery[0].pname ne null}">
                    	<div class="jisu"style="position:relative">
		                    <a href="/groupGallery/${gallery[0].pname}" data-title="upload by ${gallery[0].mname}" data-lightbox="example-set" class="img_link">
			                    <img
			                            src="/groupGallery/${gallery[0].pname}"
			                            class="w-100 shadow-1-strong rounded mb-4"
			                    />
		                    </a>
		                    <a href="javascript:authCheck(${gallery[0].galseq})" class="del_link"><h4>X</h4></a>
	                    </div>
                    </c:if>
                    <c:if test="${gallery[3].pname ne null}">
	                    <div class="jisu"style="position:relative">
		                    <a href="/groupGallery/${gallery[3].pname}" data-title="upload by ${gallery[3].mname}" data-lightbox="example-set" class="img_link">
		                    <img
		                            src="/groupGallery/${gallery[3].pname}"
		                            class="w-100 shadow-1-strong rounded mb-4"
		                    />
		                    </a>
		                    <a href="javascript:authCheck(${gallery[3].galseq})" class="del_link"><h4>X</h4></a>
	                    </div>
                    </c:if>
                </div>

                <div class="col-lg-4 mb-4 mb-lg-0">
                    <c:if test="${gallery[1].pname ne null}">
	                    <div class="jisu"style="position:relative">
		                    <a href="/groupGallery/${gallery[1].pname}" data-title="upload by ${gallery[1].mname}" data-lightbox="example-set" class="img_link">
		                    <img
		                            src="/groupGallery/${gallery[1].pname}"
		                            class="w-100 shadow-1-strong rounded mb-4"
		                    />
		                    </a>
		                    <a href="javascript:authCheck(${gallery[1].galseq})" class="del_link"><h4>X</h4></a>
	                    </div>
                    </c:if>
                    <c:if test="${gallery[4].pname ne null}">
	                    <div class="jisu"style="position:relative">
		                    <a href="/groupGallery/${gallery[4].pname}" data-title="upload by ${gallery[4].mname}" data-lightbox="example-set" class="img_link">
		                    <img
		                            src="/groupGallery/${gallery[4].pname}"
		                            class="w-100 shadow-1-strong rounded mb-4"
		                    />
		                    </a>
		                    <a href="javascript:authCheck(${gallery[4].galseq})" class="del_link"><h4>X</h4></a>
	                    </div>
                    </c:if>
                </div>

                <div class="col-lg-4 mb-4 mb-lg-0">
                    <c:if test="${gallery[2].pname ne null}">
	                    <div class="jisu"style="position:relative">
		                    <a href="/groupGallery/${gallery[2].pname}" data-title="upload by ${gallery[2].mname}" data-lightbox="example-set" class="img_link">
		                    <img
		                            src="/groupGallery/${gallery[2].pname}"
		                            class="w-100 shadow-1-strong rounded mb-4"
		                    />
		                    </a>
		                    <a href="javascript:authCheck(${gallery[2].galseq})" class="del_link"><h4>X</h4></a>
	                    </div>
                    </c:if>
                    <c:if test="${gallery[5].pname ne null}">
	                    <div class="jisu"style="position:relative">
		                    <a href="/groupGallery/${gallery[5].pname}" data-title="upload by ${gallery[5].mname}" data-lightbox="example-set" class="img_link">
		                    <img
		                            src="/groupGallery/${gallery[5].pname}"
		                            class="w-100 shadow-1-strong rounded mb-4"
		                    />
		                    </a>
		                    <a href="javascript:authCheck(${gallery[5].galseq})" class="del_link"><h4>X</h4></a>
	                    </div>
                    </c:if>
                </div>
            </div>
                <!-- Gallery ??? -->
            <!-- ????????? ????????? -->
            <div>
                <nav aria-label="Page navigation example">
                    <ul
                            id="paging"
                            class="pagination"
                            style="justify-content: center"
                    >
                        <c:if test="${pm.prev}">
                            <li class="page-item">
                                <a class="page-link" href="groupGallery.do?page=${pm.startPage-1}&pageSize=${cri.pageSize}&gseq=${groupGallery.gseq}&mnum=${m.mnum}">&lt;&lt;</a>
                            </li>
                        </c:if>
                        <c:if test="${pm.prev}">
                            <li class="page-item">
                                <a class="page-link" href="groupGallery.do?page=${cri.page-1}&pageSize=${cri.pageSize}&gseq=${groupGallery.gseq}&mnum=${m.mnum}">&lt;</a>
                            </li>
                        </c:if>
                        <c:forEach var="idx" begin="${pm.startPage }" end="${pm.endPage }">
                            <li class="page-item">
                                <a class="page-link" href="groupGallery.do?page=${idx }&pageSize=${cri.pageSize}&gseq=${groupGallery.gseq}&mnum=${m.mnum}">${idx}</a>
                            </li>
                        </c:forEach>
                        <c:if test="${pm.next && pm.endPage > 0}">
                            <li class="page-item">
                                <a class="page-link" href="groupGallery.do?page=${cri.page+1}&pageSize=${cri.pageSize}&gseq=${groupGallery.gseq}&mnum=${m.mnum}">&gt;</a>
                            </li>
                        </c:if>
                        <c:if test="${pm.next && pm.endPage > 0}">
                            <li class="page-item">
                                <a class="page-link" href="groupGallery.do?page=${pm.endPage}&pageSize=${cri.pageSize}&gseq=${groupGallery.gseq}&mnum=${m.mnum}">&gt;&gt;</a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div>
            <!-- ????????? ????????? ??? -->
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
