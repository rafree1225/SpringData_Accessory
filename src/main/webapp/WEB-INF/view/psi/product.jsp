<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<html>
    <head>
        <!-- Head -->
        <%@include file="../include/head.jspf"  %>
        
         <style>
            legend, 
            .pure-table thead th {
                font-weight: bold; /* 將字體設為粗體 */
            }

            .pure-form legend {
                color: 	#000000; /* 黑色 */
            }
            .pure-form input {
                color: #6C6C6C; /* 深灰色 */
            }
            .pure-table thead th {
                background-color: #0072E3; /* 深藍色 */
                color: 	#FFFFFF; /* 白色 */
            }
            .pure-table tbody td {
                background-color: #FFFFFF; /* 白色 */
                color:#000000; /* 黑色 */
            }

        </style>
        
        
        <script>
            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#image').val(e.target.result);
                        $('#previewImage').attr('src', e.target.result);
                        $('#previewImage').attr('width', 100);
                    }
                    reader.readAsDataURL(input.files[0]); // convert to base64 string
                }
            }
            $(document).ready(function () {
                $("#myfile").change(function () {
                    readURL(this);
                });
            });
        </script>
    </head>
    <body style="padding: 10px">

        <div id="layout">
            <!-- Toggle -->
            <%@include file="../include/toggle.jspf"  %>

            <!-- Menu -->
            <%@include file="../include/menu.jspf"  %>

            <div id="main">
                <div class="header">
                    <h1>Product</h1>
                    <h2>商品</h2>
                </div>
                <table class="pure-table" style="border: none;">
                    <td valign="top">
                        <!-- 商品表單-->
                        <form:form class="pure-form" 
                                   modelAttribute="product" 
                                   method="post" 
                                   action="${pageContext.request.contextPath}/mvc/psi/product" >
                            <fieldset>
                                <legend>商品表單──新增、修改、刪除</legend>
                                商品ID : <br/>
                                <form:input path = "id" readonly ="true"/><p/>
                                商品名稱 : <br/>
                                <form:input path = "name" placeholder="請輸入商品名稱" /><p/>
                                商品圖片 : <br/>
                                <input type="file"  name="myfile" id="myfile" /><p/>
                                <form:hidden path = "image" readonly = "true"/><p/>
                                <img id="previewImage" src="${product.image== null ? space : product.image}" width="${product.image== null ? 0 : 100}"><p/>
                                操作狀態 : <br/>
                                <input type="text" id="_method" name="_method" value="${_method}" readonly="true" /><p/>
                                <div style="color: red">${ deleteError }</div>
                                <button type="submit" class="pure-button pure-button-primary">Submit</button>
                            </fieldset>
                        </form:form>
                    </td>
                    <td valign="top">
                        <!-- 商品列表 -->
                        <form class="pure-form">
                            <fieldset>
                                <legend>商品列表</legend>
                                <table class="pure-table pure-table-bordered">
                                    <thead>
                                        <tr>
                                            <th>序號</th>
                                            <th>商品名稱</th>
                                            <th>商品圖片</th>
                                            <th>修改</th>
                                            <th>刪除</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="p" items="${ products }">
                                            <tr>
                                                <td>${ p.id }</td>
                                                <td>${ p.name }</td>
                                                <td><img src="${ p.image == null? space : p.image }" width="${ p.image == null?0:100 }"></td>
                                                <td><a href="${pageContext.request.contextPath}/mvc/psi/product/${p.id}">修改</a></td>
                                                <td><a href="${pageContext.request.contextPath}/mvc/psi/product/delete/${p.id}">刪除</a></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </fieldset>
                        </form>
                    </td>
                </table>   


            </div>
        </div>

        <!-- Foot -->
        <%@include file="../include/foot.jspf"  %>

    </body>
</html>