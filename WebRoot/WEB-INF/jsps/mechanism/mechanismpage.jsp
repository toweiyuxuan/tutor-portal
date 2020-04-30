<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>昆明中小学家教服务中心</title>
  <meta content="" name="keywords">
  <meta content="" name="description">
  <link href="https://fonts.googleapis.com/css?family=Poppins:300,300i,400,400i,500,500i,600,600i,700,700i|Playfair+Display:400,400i,700,700i,900,900i" rel="stylesheet">
  <link href="${path}/mechanismpage/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${path}/mechanismpage/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="${path}/mechanismpage/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="${path}/mechanismpage/lib/magnific-popup/magnific-popup.css" rel="stylesheet">
  <link href="${path}/mechanismpage/lib/hover/hover.min.css" rel="stylesheet">
  <link href="${path}/mechanismpage/css/style.css" rel="stylesheet">
  <link href="${path}/mechanismpage/css/responsive.css" rel="stylesheet">
</head>
<body>
<div class="container">
	<div style="margin-top: 20px;" class="section-title text-center">
  		<font size="20" color="skyblue"><s:property value="#mechanism.MName"/></font>
  	</div>
  	
	<p align="center">
		<s:iterator value="#mechanismtypeList" var="mechanismtype">
			<s:if test="#mechanismtype.select=='yes'">
				<s:property value="#mechanismtype.MName"/>&nbsp;&nbsp;
			</s:if>
		</s:iterator>
	</p>
</div>
<!-- start section about us -->
    
<br> 

<p style="margin-left: 100px;font-size: 25px;" class="p-heading">我们的特点</p>
<p style="margin:10px 100px 10px 100px;" class="separator">
	<s:property value="mechanism.MTedian"/>
</p>

<p style="margin-left: 100px;font-size: 25px;" class="p-heading">关于我们</p>
<p style="margin:10px 100px 10px 100px;" class="separator">
	<s:property value="mechanism.MIntroduce"/>
</p>
       
<p style="margin-left: 100px;font-size: 25px;" class="p-heading">联系方式</p>
<p style="margin:10px 100px 10px 100px;" class="separator">
	<s:property value="mechanism.MContact"/>
</p>


<div id="portfolio" class="text-center paddsection">
  <div class="container">
    <div class="section-title text-center">
      <h2>我们的相册</h2>
    </div>
  </div>
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="portfolio-container">
        	<s:iterator value="#mphotosList.list" var="mechanismphoto">
           	<div class="col-lg-4 col-md-6 portfolio-thumbnail all branding uikits webdesign">
             <a class="popup-img" href="${path}/<s:property value="#mechanismphoto.mpAddress"/>">
               <img src="${path}/<s:property value="#mechanismphoto.mpAddress"/>" alt="img">
             </a>
           </div>
          </s:iterator>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
<script src="${path}/mechanismpage/lib/jquery/jquery.min.js"></script>
<script src="${path}/mechanismpage/lib/jquery/jquery-migrate.min.js"></script>
<script src="${path}/mechanismpage/lib/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${path}/mechanismpage/lib/typed/typed.js"></script>
<script src="${path}/mechanismpage/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="${path}/mechanismpage/lib/magnific-popup/magnific-popup.min.js"></script>
<script src="${path}/mechanismpage/lib/isotope/isotope.pkgd.min.js"></script>
<script src="${path}/mechanismpage/contactform/contactform.js"></script>
<script src="${path}/mechanismpage/js/main.js"></script>
</html>
