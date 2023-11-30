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
        
    </head>
    <body style="padding: 10px">

        <div id="layout">
            <!-- Toggle -->
            <%@include file="../include/toggle.jspf"  %>

            <!-- Menu -->
            <%@include file="../include/menu.jspf"  %>

            <div id="main">
                <div class="header">
                    <h1>Inventory</h1>
                    <h2>庫存</h2>
                </div>
                <table class="pure-table" style="border: none;">
                    <tr>
                        <td valign="top">
                            <!-- 列表 -->
                            <form class="pure-form">
                                <fieldset>
                                    <legend>庫存列表──進/銷貨數量&均價</legend>
                                    <table class="pure-table pure-table-bordered" width="100%">
                                        <thead>
                                            <tr>
                                                <th nowrap>序號</th>
                                                <th nowrap>商品名稱</th>
                                                <th nowrap>商品圖片</th>
                                                <th nowrap>進貨數量(組)</th>
                                                <th nowrap>進貨均價(元)</th>
                                                <th nowrap>銷貨數量(組)</th>
                                                <th nowrap>銷貨均價(元)</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <c:forEach var="i" items="${ inventories }">
                                                <tr>
                                                    <td>${ i.id }</td>
                                                    <td>${ i.name }</td>
                                                    <td><img style="cursor: zoom-in" id="blah" src="${ i.image==null?space:i.image }" width="${ i.image==null?'0':'100' }" /></td>
                                                    <td>
                                                        <fmt:formatNumber type="number" pattern="###,###" value="${ i.puQty }" />
                                                    </td>
                                                    <td>
                                                        <fmt:formatNumber type="number" pattern="###,###" value="${ i.puTotal }" />
                                                    </td>
                                                    <td>
                                                        <fmt:formatNumber type="number" pattern="###,###" value="${ i.saQty }" />
                                                    </td>
                                                    <td>
                                                        <fmt:formatNumber type="number" pattern="###,###" value="${ i.saTotal }" />
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table> 
                                </fieldset>
                            </form>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <!-- 列表 -->
                            <form class="pure-form">
                                <fieldset>
                                    <legend>庫存列表──庫存數量、進/銷貨均價、會員價格、一般價格</legend>
                                    <table class="pure-table pure-table-bordered" width="100%">
                                        <thead>
                                            <tr>
                                                <th nowrap>序號</th>
                                                <th nowrap>商品名稱</th>
                                                <th nowrap>商品圖片</th>
                                                <th nowrap>庫存數量(組)</th>
                                                <th nowrap>進貨均價(元)</th>
                                                <th nowrap>銷貨均價(元)</th>
                                                <th nowrap>會員價格(元)</th>
                                                <th nowrap>一般價格(元)</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <c:forEach var="i" items="${ inventories2 }">
                                                <tr>
                                                    <td>${ i.id }</td>
                                                    <td>${ i.name }</td>
                                                    <td><img style="cursor: zoom-in" id="blah" src="${ i.image==null?space:i.image }" width="${ i.image==null?'0':'100' }" /></td>
                                                    <td>
                                                        <fmt:formatNumber type="number" pattern="###,###" value="${ i.qty }" />
                                                    </td>
                                                    <td>
                                                        <fmt:formatNumber type="number" pattern="###,###" value="${ i.puCost }" />
                                                    </td>
                                                    <td>
                                                        <fmt:formatNumber type="number" pattern="###,###" value="${ i.saCost }" />
                                                    </td>
                                                    <td>
                                                        <fmt:formatNumber type="number" pattern="###,###" value="${ i.price1 }" />
                                                    </td>
                                                    <td>
                                                        <fmt:formatNumber type="number" pattern="###,###" value="${ i.price2 }" />
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table> 
                                </fieldset>
                            </form>
                        </td>
                    </tr>

                </table> 
            </div>
        </div>

        <!-- Foot -->
        <%@include file="../include/foot.jspf"  %>

    </body>
</html>