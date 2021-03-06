<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*, team1.togather.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <!-- End Header -->
    <main id="main" data-aos="fade-in">
      <!-- ======= Breadcrumbs ======= -->
      <div class="breadcrumbs">
        <div class="container">
          <h1>?????? ?????? ??????</h1>
          <p>?????? ????????? ?????? ???????????????. ?????? 8??? ?????? ?????? ???????????????.</p>
        </div>
      </div>
      <!-- End Breadcrumbs -->

      <!-- ======= Courses Section ======= -->
      <section id="courses" class="courses">
        <div class="container" data-aos="fade-up">
          <div class="row" data-aos="zoom-in" data-aos-delay="100">
            	 <c:forEach var="groupList" items="${groupList}" varStatus="status" >
          	
	            <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
	              <div class="course-item">
	                <img
	                  src="/assets/img/groupImages/${groupList.fname }"
	                  class="img-fluid"
	                  alt="..."
	                />
	                <div class="course-content">
	                  <div
	                    class="d-flex justify-content-between align-items-center mb-3"
	                  >
	                    <h4>${groupList.interest}</h4>
	                    <p class="price">${groupList.gloc}</p>
	                  </div>
	
	                  <h3><a href="../groupTab/groupInfo.do?gseq=${groupList.gseq}&mnum=${m.mnum}">${groupList.gname}</a></h3>
	                  <p>
				      		${groupList.gintro}
	                  </p>
	                   <div class="d-flex justify-content-between align-items-center">
	                  <div>
	                  <p><i class="fa fa-map-marker-alt text-primary me-2"></i>${groupList.gloc}</p>
	                  </div>
	                  <div>
                                <button onclick="cancelWishList(this)" type="button" class="btn btn-outline-danger mb-1" value="${groupList.gseq }">??? ??????</button>
                                
                      </div>
	                  </div>
	                  <div
	                    class="trainer d-flex justify-content-between align-items-center"
	                  >
	                    <div class="trainer-profile d-flex align-items-center">
	                      <img
	                        src="/assets/img/trainers/trainer-1.jpg"
	                        class="img-fluid"
	                        alt=""
	                      />                   
	                      <span>${namelist[status.index].mname}</span>        
	                    </div>
	                    <div class="trainer-rank d-flex align-items-center">
	                      <i class="bx bx-user"></i>&nbsp;&nbsp;${groupMemberCount[status.index]}
	                    </div>
	                  </div>
	                </div>
	              </div>
	            </div>
	         
            </c:forEach>
            <!-- End Course Item-->
          </div>
        </div>
      </section>
      <!-- End Courses Section -->
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
