<!-- login page test -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>小黑屋借书系统</title>
<!-- Bootstrap -->
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bcorner.css" rel="stylesheet">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
  <div class="container">
    <div class="row clearfix">
      <div class="col-md-12 column">
        <a id="modal-test" href="#login-modal" role="button"
          class="btn login-btn" data-toggle="modal">登录</a>
        <div class="modal fade" id="login-modal" tabindex="-1" role="dialog"
          aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header" align="center">
                <img class="img-circle" id="img_logo"
                  src="img/ECNC 2016.png" />
                <button type="button" class="close" data-dismiss="modal"
                  aria-label="Close">
                  <span class="glyphicon glyphicon-remove"
                    aria-hidden="true"></span>
                </button>
              </div>

              <div id="div-forms">
                <form id="login-form" method="post">
                  <div class="modal-body">
                    <div id="div-login-msg">
                      <div id="icon-login-msg"
                        class="glyphicon glyphicon-chevron-right"></div>
                      <span id="text-login-msg">Welcome to ECNC book corner!</span>
                    </div>
                    <input id="login_username" name="netid" class="form-control"
                      type="text" placeholder="NetID" required />
                    <input id="login_password" name="password" class="form-control"
                      type="password" placeholder="密码" required />
                  </div>
                  <div class="modal-footer">
                    <div>
                      <button type="submit"
                        class="btn btn-primary btn-lg btn-block">登录</button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.js"></script>
</body>
</html>