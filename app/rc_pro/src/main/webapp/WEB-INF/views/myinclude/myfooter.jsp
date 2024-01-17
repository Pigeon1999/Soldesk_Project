<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />

 <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">

    <div class="footer-content">
      <div class="container">
        <div class="row">

          <div class="col-lg-3 col-md-6">
            <div class="footer-info">
              <h3>HeroBiz</h3>
              <p>
                A108 Adam Street <br>
                NY 535022, USA<br><br>
                <strong>Phone:</strong> +1 5589 55488 55<br>
                <strong>Email:</strong> info@example.com<br>
              </p>
            </div>
          </div>

          <div class="col-lg-2 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
              <li><i class="bi bi-chevron-right"></i> <a href="#me">Home</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="#me">About us</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="#me">Services</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="#me">Terms of service</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="#me">Privacy policy</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Our Services</h4>
            <ul>
              <li><i class="bi bi-chevron-right"></i> <a href="#me">Web Design</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="#me">Web Development</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="#me">Product Management</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="#me">Marketing</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="#me">Graphic Design</a></li>
            </ul>
          </div>

          <div class="col-lg-4 col-md-6 footer-newsletter">
            <h4>Our Newsletter</h4>
            <p>Tamen quem nulla quae legam multos aute sint culpa legam noster magna</p>
            <form action="" method="post">
              <input type="email" name="email"><input type="submit" value="Subscribe">
            </form>

          </div>

        </div>
      </div>
    </div>

    <div class="footer-legal text-center">
      <div class="container d-flex flex-column flex-lg-row justify-content-center justify-content-lg-between align-items-center">

        <div class="d-flex flex-column align-items-center align-items-lg-start">
          <div class="copyright">
            &copy; Copyright <strong><span>HeroBiz</span></strong>. All Rights Reserved
          </div>
          <div class="credits">
            <!-- All the links in the footer should remain intact. -->
            <!-- You can delete the links only if you purchased the pro version. -->
            <!-- Licensing information: https://bootstrapmade.com/license/ -->
            <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/herobiz-bootstrap-business-template/ -->
            Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
          </div>
        </div>

        <div class="social-links order-first order-lg-last mb-3 mb-lg-0">
          <a href="#me" class="twitter"><i class="bi bi-twitter"></i></a>
          <a href="#me" class="facebook"><i class="bi bi-facebook"></i></a>
          <a href="#me" class="instagram"><i class="bi bi-instagram"></i></a>
          <a href="#me" class="google-plus"><i class="bi bi-skype"></i></a>
          <a href="#me" class="linkedin"><i class="bi bi-linkedin"></i></a>
        </div>

      </div>
    </div>

  </footer><!-- End Footer -->

  <a href="#me" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="${contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${contextPath}/assets/vendor/aos/aos.js"></script>
  <script src="${contextPath}/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="${contextPath}/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="${contextPath}/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="${contextPath}/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="${contextPath}/assets/js/main.js"></script>

</body>

</html>