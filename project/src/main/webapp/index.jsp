<%@ page import="com.DB.DBconnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.DAO.ProductDAOImpl" %>
<%@ page import="com.entity.ProductDtls" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Wilson E-commerce</title>
    <%@ include file="all_component/allCss.jsp"%>
    <style type="text/css">
        .back-img {
            background: url("img/banner.jpg");
            height: 50vh;
            width: 100%;
            background-repeat: no-repeat;
            background-size: cover;
        }
        .cdr-ho:hover {
            background: #FCF7F7;
        }
    </style>
</head>
<body style="background-color: #F9F9F9;">
<%@ include file="all_component/navbar.jsp"%>
<div class="container-fluid back-img">
    <h2 class="text-center text-danger"></h2>
</div>


<% /*Connection conn=DBconnect.getConn();
out.println(conn); */%>

<!-- Componentes Novedosos -->

<hr>

<div class="container">
    <h3 class="text-center">Componentes Novedosos</h3>
    <div class="row">
        <%
            ProductDAOImpl dao2=new ProductDAOImpl(DBconnect.getConn());
            List<ProductDtls> list2= dao2.getRecentProduct();
            for(ProductDtls b:list2)
            {%>
        <div class="col-md-3">
            <div class="card cdr-ho">
                <div class="card-body text-center">
                    <img alt=""src="img/<%=b.getPhotoName()%>" style="width: 150px; height: 200px;" class="img-thumblin">
                    <p><%=b.getProductname()%>></p>
                    <p><%=b.getAuthor()%>></p>
                    <p>
                        <%
                            if(b.getProductCategory().equals("Old")){
                        %>
                        Categoria:<%=b.getProductCategory() %></p>
                    <div class="row justify-content-center">
                        <a href="" class="text-center btn btn-primary btn-sm ml-1">S/.<%=b.getPrice()%></a>
                    </div>
                    <%}else {%>
                    Categoria:<%=b.getProductCategory() %></p>
                    <div class="row justify-content-center">
                        <a href="" class="btn btn-primary btn-sm ">S/.<%=b.getPrice()%></a>
                    </div>
                    <%}
                    %>

                </div>
            </div>
        </div>
        <%
            }
        %>

    </div>
    <div class="text-center mt-1">
    </div>

</div>



<! -- FIN COMPONENTES NOVEDOSOS -->

<hr>

<!-- Componentes Nuevos -->

<div class="container">
    <h3 class="text-center">Componentes Nuevos</h3>
    <div class="row">
        <%
            ProductDAOImpl dao=new ProductDAOImpl(DBconnect.getConn());
            List<ProductDtls> list= dao.getRecentProduct();
            for(ProductDtls b:list) {
        %>
        <div class="col-md-3">
            <div class="card cdr-ho">
                <div class="card-body text-center">
                    <img alt="" src="img/<%=b.getPhotoName()%>" style="width: 150px; height: 200px;" class="img-thumblin">
                    <p><%=b.getProductname()%></p>
                    <p><%=b.getAuthor()%></p>
                    <p>Categoria:<%=b.getProductCategory()%></p>
                    <div class="row justify-content-center">
                        <a href="" class="btn btn-primary btn-sm ml-1">S/.<%=b.getPrice()%></a>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </div>
    <div class="text-center mt-3">
    </div>
</div>

<! -- FIN COMPONENTES Nuevos -->

<hr>
<hr>

<%@include file="all_component/footer.jsp"%>

</body>
</html>