<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <style><%@include file="/custom.css"%></style>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@900&family=Source+Sans+Pro&display=swap" rel="stylesheet">

    <title>ESGInvest</title>
</head>
<body>

<!---->
<!--ESG HEADER-->
<!---->
<div class="row" style="position: relative">
    <div class="col-2">
        <p></p>
    </div>
    <div class="col-8">
        <h1 id="logo">ESGInvest</h1>
    </div>
    <div class="col-2">
        <a href="info.jsp"><button id="general-info-button">&nbsp;&nbsp;&nbsp;i&nbsp;&nbsp;&nbsp;</button></a>
    </div>
</div>

<!--=========================================================-->
<!--=========================================================-->
<!--MAIN CONTENT-->
<!--=========================================================-->
<!--=========================================================-->

<div class="container-lg">
    <!---->
    <!--SEARCH / ADD-->
    <!---->
    <form action="/ESGServlet" method="post">
        <div class="row no-gutters">
            <div class="col-10">
                <a id="add-button" href="#">+ </a><input id="stock-input" type="text" name="stock">
            </div>
            <div class="col-2" id="b">
                <button type="submit" id="btn_add">Add Stock!</button>
            </div>
        </div>
    </form>


    <!--error message if search box is blank-->
    <p>${error}</p>

    <!---->
    <!--PORTFOLIO PANEL-->
    <!---->
    <div class="row flex-column-reverse flex-lg-row">
        <div class="col-lg-7" id="portfolio">

            <form action="/ESGServlet" method="post">
                <select name="sort" size="1" id="sortOptions">
                    <option value="blank" selected>Select Sorting Option</option>
                    <option value="D">Default</option>
                    <option value="E">Environmental</option>
                    <option value="S">Social</option>
                    <option value="G">Governance</option>
                </select>
                <button type="submit" name="sortButton" id="sortButton" value="sorter">SORT</button>
            </form>

            <br>

            <!---->
            <!--STOCKS IN PORTFOLIO-->
            <!---->
            <c:set var="stocknum" value="0" scope="page"/>
            <c:forEach items="${allStocks}" var="s">
                <c:set var="grade" value="${s.getESGStats().get('total_grade')}"/>

                <c:if test="${grade=='BBB'}">
                    <a onclick="company('${s.getESGStats().get('company_name')}');
                    ticker('${s.getName()}');
                    removePrep('${s.getName()}');
                    totalesg('${s.getESGStats().get('total')}');
                    environment('${s.getESGStats().get("environment_score")}');
                    gradeE('${s.getESGStats().get("environment_grade")}');
                    social('${s.getESGStats().get("social_score")}');
                    gradeS('${s.getESGStats().get("social_grade")}');
                    gov('${s.getESGStats().get("governance_score")}');
                    gradeG('${s.getESGStats().get("environment_grade")}');
                    totalGrade('${s.getESGStats().get('total_grade')}');
                    price('${s.getStockPrice().get('regularMarketPrice')}');
                    priceChange('${s.getStockPrice().get('regularMarketChangePercent')}');
                    priceOpen('${s.getStockPrice().get('regularMarketOpen')}');
                    priceClose('${s.getStockPrice().get('regularMarketDayRange')}');
                    average('${average}')"
                       href="#" id="stock${stocknum}">
                    <div class="row gx-2 stock-in-portfolioBBB">
                        <div class="col-9 company-in-portfolio">
                            <h2>${s.getESGStats().get('company_name')}</h2>
                        </div>
                        <div class="col-3">
                            <h1 class="info-in-portfolio">${s.getESGStats().get("total_grade")}</h1>
                        </div>
                    </div>
                    </a>
                    <c:set var="stocknum" value="${stocknum + 1}" scope="page"/>
                </c:if>

                <c:if test="${grade=='BB'}">
                    <a onclick="company('${s.getESGStats().get('company_name')}');
                            ticker('${s.getName()}');
                            removePrep('${s.getName()}');
                            totalesg('${s.getESGStats().get('total')}');
                            environment('${s.getESGStats().get("environment_score")}');
                            gradeE('${s.getESGStats().get("environment_grade")}');
                            social('${s.getESGStats().get("social_score")}');
                            gradeS('${s.getESGStats().get("social_grade")}');
                            gov('${s.getESGStats().get("governance_score")}');
                            gradeG('${s.getESGStats().get("environment_grade")}');
                            totalGrade('${s.getESGStats().get('total_grade')}');
                            price('${s.getStockPrice().get('price')}');
                            priceChange('${s.getStockPrice().get('change_percentage')}');
                            priceChangePoints('${s.getStockPrice().get('change_point')}');
                            priceVolume('${s.getStockPrice().get('total_vol')}');
                            average('${average}')"
                       href="#" id="stock${stocknum}">
                    <div class="row gx-2 stock-in-portfolioBB">
                        <div class="col-9 company-in-portfolio">
                            <h2>${s.getESGStats().get('company_name')}</h2>
                        </div>
                        <div class="col-3">
                            <h1 class="info-in-portfolio">${s.getESGStats().get("total_grade")}</h1>
                        </div>
                    </div>
                    </a>
                    <c:set var="stocknum" value="${stocknum + 1}" scope="page"/>
                </c:if>

                <c:if test="${grade=='B'}">
                    <a onclick="company('${s.getESGStats().get('company_name')}');
                            ticker('${s.getName()}');
                            removePrep('${s.getName()}');
                            totalesg('${s.getESGStats().get('total')}');
                            environment('${s.getESGStats().get("environment_score")}');
                            gradeE('${s.getESGStats().get("environment_grade")}');
                            social('${s.getESGStats().get("social_score")}');
                            gradeS('${s.getESGStats().get("social_grade")}');
                            gov('${s.getESGStats().get("governance_score")}');
                            gradeG('${s.getESGStats().get("environment_grade")}');
                            totalGrade('${s.getESGStats().get('total_grade')}');
                            price('${s.getStockPrice().get('price')}');
                            priceChange('${s.getStockPrice().get('change_percentage')}');
                            priceChangePoints('${s.getStockPrice().get('change_point')}');
                            priceVolume('${s.getStockPrice().get('total_vol')}');
                            average('${average}')"
                       href="#" id="stock${stocknum}">
                    <div class="row gx-2 stock-in-portfolioB">

                        <div class="col-6 company-in-portfolio">
                            <h2>${s.getESGStats().get('company_name')}</h2>
                        </div>
                        <div class="col-6">
                            <h1 class="info-in-portfolio">${s.getESGStats().get("total_grade")}</h1>
                        </div>
                    </div>
                    </a>
                    <c:set var="stocknum" value="${stocknum + 1}" scope="page"/>
                </c:if>

                <c:if test="${grade=='CCC'}">
                    <a onclick="company('${s.getESGStats().get('company_name')}');
                            ticker('${s.getName()}');
                            removePrep('${s.getName()}');
                            totalesg('${s.getESGStats().get('total')}');
                            environment('${s.getESGStats().get("environment_score")}');
                            gradeE('${s.getESGStats().get("environment_grade")}');
                            social('${s.getESGStats().get("social_score")}');
                            gradeS('${s.getESGStats().get("social_grade")}');
                            gov('${s.getESGStats().get("governance_score")}');
                            gradeG('${s.getESGStats().get("environment_grade")}');
                            totalGrade('${s.getESGStats().get('total_grade')}');
                            price('${s.getStockPrice().get('price')}');
                            priceChange('${s.getStockPrice().get('change_percentage')}');
                            priceChangePoints('${s.getStockPrice().get('change_point')}');
                            priceVolume('${s.getStockPrice().get('total_vol')}');
                            average('${average}')"
                       href="#" id="stock${stocknum}">
                    <div class="row gx-2 stock-in-portfolioCCC">
                        <div class="col-9 company-in-portfolio">
                            <h2>${s.getESGStats().get('company_name')}</h2>
                        </div>
                        <div class="col-3">
                            <h1 class="info-in-portfolio">${s.getESGStats().get("total_grade")}</h1>
                        </div>
                    </div>
                    </a>
                    <c:set var="stocknum" value="${stocknum + 1}" scope="page"/>
                </c:if>

                <c:if test="${grade=='A'}">
                    <a onclick="company('${s.getESGStats().get('company_name')}');
                            ticker('${s.getName()}');
                            removePrep('${s.getName()}');
                            totalesg('${s.getESGStats().get('total')}');
                            environment('${s.getESGStats().get("environment_score")}');
                            gradeE('${s.getESGStats().get("environment_grade")}');
                            social('${s.getESGStats().get("social_score")}');
                            gradeS('${s.getESGStats().get("social_grade")}');
                            gov('${s.getESGStats().get("governance_score")}');
                            gradeG('${s.getESGStats().get("environment_grade")}');
                            totalGrade('${s.getESGStats().get('total_grade')}');
                            price('${s.getStockPrice().get('price')}');
                            priceChange('${s.getStockPrice().get('change_percentage')}');
                            priceChangePoints('${s.getStockPrice().get('change_point')}');
                            priceVolume('${s.getStockPrice().get('total_vol')}');
                            average('${average}')"
                       href="#" id="stock${stocknum}">
                    <div class="row gx-2 stock-in-portfolioA">
                        <div class="col-6 company-in-portfolio">
                            <h2>${s.getESGStats().get('company_name')}</h2>
                        </div>
                        <div class="col-6">
                            <h1 class="info-in-portfolio">${s.getESGStats().get("total_grade")}</h1>
                        </div>
                    </div>
                    </a>
                    <c:set var="stocknum" value="${stocknum + 1}" scope="page"/>
                </c:if>
            </c:forEach>

            <!--curate portfolio button-->
            <div id="curate-portfolio">
                <h2 id="curate">Request Curated Portfolio</h2>
            </div>

            <div id="curate-modal" class="modal">
                <div class="modal-content">
                    <span class="close" style="text-align: right">&times;</span>
                    <p>COMING SOON</p>
                </div>
            </div>

        <!--end of portfolio column-->
        </div>

        <!---->
        <!--WELCOME SIDE PANEL-->
        <!---->
        <div class="col-lg-5 gx-5" id="company-info-box">
            <p class="info-average">Average ESG Score = ${average}</p>
            <div id="welcome-container">
            <h2 id="welcome-message">Welcome to<br>ESGInvest</h2>

            <br>
            <hr>
            <br>

            <div id="welcome-sub">
                <p>Add a stock using the plus button at the top of the page</p>
                <p>Get more detailed company information, such as individual ESG scores and stock performance, by clicking on a company.</p>
                <p>Or <strong style="color: var(--navy)">Request a Curated Portfolio</strong> to get a recommended list of stocks that meet your environmental, social, and governance standards.</p>
            </div>

            </div>

            <div id="right-side">
                <!--<p class="info-average">Average ESG Score = ${average}</p>-->
            <div id="stock-info-container">

                <h2 id="info-company-name">Company Name</h2>
                <p id="info-ticker">Stock Ticker</p>
                <div class="row esginfo">
                    <div class="col-7">
                        <p id="info-total-esg">Total ESG Score</p>
                        <p><span id="info-environment">Environmental Score</span><span id="grade-e">grade</span></p>
                        <p><span id="info-social">Social Score</span><span id="grade-s">grade</span></p>
                        <p><span id="info-gov">Governance Score</span><span id="grade-g">grade</span></p>
                    </div>
                    <div class="col-5 totalgrade">
                        <p style="color: var(--navy)">Total Grade</p>
                        <br>
                        <h2 id="info-letter-grade">Total Letter Grade</h2>
                    </div>
                </div>

                <hr>

                <p id="info-price">Stock Price</p>
                <p id="info-price-change">Stock Price Change</p>
                <div>
                    <div col-6>
                        <p id="info-volume">Stock Price Volume</p>
                        <p id="info-price-change-points">Stock Price Change Points</p>
                    </div>
                </div>

                <br>



                <p></p>
                <p id="blocker"></p>


                <form action="/ESGServlet" method="post">
                    <input type="hidden" id="removeMe" value="stock" name="toRemove">
                    <button id="remove-stock" onclick="removeStock()" type="submit">Remove Stock</button>
                </form>

            </div>
            </div>

        </div>

    <!--end of row div-->
    </div>
<!--end of container div-->
</div>

<!--populate stock info panel-->
<script>
    function company(clicked) {
        console.log("clicked = " + clicked);
        console.log("button working");
        var x = document.getElementById("welcome-container");
        x.style.display = "none";

        var y = document.getElementById("right-side");
        if (y.style.display === "none") {
            y.style.display = "block";
        } else {
            y.style.display = "block";
        }
        var y = document.getElementById("stock-info-container");
        if (y.style.display === "none") {
            y.style.display = "block";
        } else {
            y.style.display = "block";
        }
        document.getElementById("info-company-name").innerText = clicked;
    }
    function ticker(clicked) {
        document.getElementById("info-ticker").innerText = "(" + clicked.toUpperCase() + ")";
    }
    function totalesg(clicked) {
        if(clicked.length==10) {
            document.getElementById("info-total-esg").innerText = "Total ESG Score: " + clicked.substring(0,3);
        }
        else if (clicked.length==11) {
            document.getElementById("info-total-esg").innerText = "Total ESG Score: " + clicked.substring(0,4);
        }
        else {
            document.getElementById("info-total-esg").innerText = "Total ESG Score: " + clicked;
        }

    }
    function environment(clicked) {
        document.getElementById("info-environment").innerHTML = "Total Environmental Score: " + clicked.substring(0, 3);
    }
    function social(clicked) {
        document.getElementById("info-social").innerHTML = "Total Social Score: " + clicked.substring(0, 3);
    }
    function gov(clicked) {
        document.getElementById("info-gov").innerHTML = "Total Governance Score: " + clicked.substring(0, 3);
    }
    function gradeE(clicked) {
        document.getElementById("grade-e").innerHTML = " (" + clicked.substring(0, 3) + ")";
    }
    function gradeS(clicked) {
        document.getElementById("grade-s").innerHTML = " (" + clicked.substring(0, 3) + ")";
    }
    function gradeG(clicked) {
        document.getElementById("grade-g").innerHTML = " (" + clicked.substring(0, 3) + ")";
    }
    function totalGrade(clicked) {
        document.getElementById("info-letter-grade").innerHTML = clicked;
    }
    function price(clicked) {
        document.getElementById("info-price").innerHTML = "$" + clicked;
    }
    function priceChange(clicked) {
        document.getElementById("info-price-change").innerHTML = "Percent Change = " + clicked + "%";
    }
    function priceChangePoints(clicked) {
        document.getElementById("info-price-change-points").innerHTML = "Points Change = " + clicked;
    }
    function priceVolume(clicked) {
        document.getElementById("info-volume").innerHTML = "Volume = " + clicked;
    }
    function removePrep(clicked) {
        document.getElementById("removeMe").value = clicked;
    }


    /*function average(clicked) {
        if(clicked.length>6) {
            document.getElementById("info-average").innerHTML = "Average ESG Score = " + clicked.substring(0,6);
        }
        else {
            document.getElementById("info-average").innerHTML = "Average ESG Score = " + clicked;
        }

    }

     */



</script>

<!--pop up for curating portfolio-->
<script>
    // Get the modal
    var modal2 = document.getElementById("curate-modal");
    // Get the button that opens the modal
    var btn2 = document.getElementById("curate-portfolio");
    // Get the <span> element that closes the modal
    var span2 = document.getElementsByClassName("close")[0];
    // When the user clicks the button, open the modal
    btn2.onclick = function() {
        modal2.style.display = "block";
    }
    // When the user clicks on <span> (x), close the modal
    span2.onclick = function() {
        modal2.style.display = "none";
    }
    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal2) {
            modal2.style.display = "none";
        }
    }
</script>

<!--bootstrap-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
</body>
</html>
