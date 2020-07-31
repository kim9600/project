<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="http://localhost:8080/Semi_Project/Home.jsp">WebSiteName</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="http://localhost:8080/Semi_Project/Home.jsp">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">회사소개 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">오시는길</a></li>
          <li><a href="#">연혁</a></li>         
        </ul>
      </li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">강아지 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">사료</a></li>
          <li><a href="#">간식</a></li>
          <li><a href="#">장난감</a></li>
        </ul>
      </li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">고양이 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">사료</a></li>
          <li><a href="#">모래</a></li>
          <li><a href="#">간식</a></li>
        </ul>
      </li>
      <li><a href="#">Page 2</a></li>
      <li><a href="http://localhost:8080/Semi_Project/BoardListAction.do">게시판</a></li>
    </ul>
      <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
</ul>
	<form class="navbar-form navbar-left" action="/action_page.php">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search" name="search">
        <div class="input-group-btn">
          <button class="btn btn-default" type="submit">
            <i class="glyphicon glyphicon-search"></i>
          </button>
        </div>
      </div>
    </form>

  </div>  
</nav>
  
</body>
</html>
