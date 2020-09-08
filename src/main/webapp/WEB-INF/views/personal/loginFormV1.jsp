<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>Login V1</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

<!--  	<link rel="stylesheet" type="text/css" href="resources/loginV1/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="resources/loginV1/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="resources/loginV1/vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="resources/loginV1/vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="resources/loginV1/vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="resources/loginV1/css/util.css"> -->
	<link rel="stylesheet" type="text/css" href="resources/loginV1/css/main.css">

	<style type="text/css">
	.limiter {
    width: 100%;
    margin: 0 auto;
    position: relative;
    top: 110px;
	}
	
	.container-login100 {
    width: 100%;
    min-height: 100vh;
    display: -webkit-box;
    display: -webkit-flex;
    display: -moz-box;
    display: -ms-flexbox;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    align-items: center;
    padding: 15px;
	}
	
	.wrap-login100 {
    width: 500px;
    background: #fff;
    border-radius: 10px;
    overflow: hidden;
    display: -webkit-box;
    display: -webkit-flex;
    display: -moz-box;
    display: -ms-flexbox;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    padding: 100px;
	}
	
	.login100-form {
    width: 290px;
	}
	
	.login100-form-title {
    font-family: Poppins-Bold;
    font-size: 24px;
    color: #333333;
    line-height: 1.2;
    text-align: center;
    width: 100%;
    display: block;
    padding-bottom: 54px;
	}
	
	.validate-input {
    position: relative;
	}
	
	.wrap-input100 {
    position: relative;
    width: 100%;
    z-index: 1;
    margin-bottom: 10px;
	}
	
	.container-login100-form-btn {
    width: 100%;
    display: -webkit-box;
    display: -webkit-flex;
    display: -moz-box;
    display: -ms-flexbox;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    padding-top: 20px;
	}
	
	.text-center {
    text-align: center!important;
	}
	
	.p-t-12 {
	    padding-top: 12px;
	}
	
	.p-t-136 {
    padding-top: 136px;
	}
	</style>
</head>
<body>
<%@ include file="../common/footer.jsp" %>	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">

				<form class="login100-form validate-form">
					<span class="login100-form-title">
						Member Login
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" name="email" placeholder="Email">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="password" name="pass" placeholder="Password">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					
					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							Login
						</button>
					</div>

					<div class="text-center p-t-12">
						<span class="txt1">
							Forgot
						</span>
						<a class="txt2" href="#">
							Username / Password?
						</a>
					</div>

					<div class="text-center p-t-136">
						<a class="txt2" href="#">
							Create your Account
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<script src="resources/loginV1/vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="resources/loginV1/vendor/bootstrap/js/popper.js"></script>
	<script src="resources/loginV1/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/loginV1/vendor/select2/select2.min.js"></script>
	<script src="resources/loginV1/vendor/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
	<script src="resources/loginV1/js/main.js"></script>
</body>
<%@ include file="../common/footer.jsp" %>
</html>