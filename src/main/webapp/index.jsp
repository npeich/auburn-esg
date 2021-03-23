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
<div class="row">
    <div class="col-xs">
        <p></p>
    </div>
    <div class="col-xs">
        <h1 id="logo">ESGInvest</h1>
    </div>
    <div class="col-xs">
        <p></p>
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
        <div class="col-lg-8" id="portfolio">
            <!---->
            <!--STOCKS IN PORTFOLIO-->
            <!---->
            <c:set var="stocknum" value="0" scope="page"/>
            <c:forEach items="${allStocks}" var="s">
                <c:set var="grade" value="${s.getESGStats().get('total_grade')}"/>

                <c:if test="${grade=='BBB'}">
                    <a onclick="company('${s.getESGStats().get('company_name')}');
                    ticker('${s.getName()}');
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
                    priceOpen('${s.getStockPrice().get('regularMarketOpen')}')"
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
                            totalesg('${s.getESGStats().get('total')}');
                            environment('${s.getESGStats().get("environment_score")}');
                            gradeE('${s.getESGStats().get("environment_grade")}');
                            social('${s.getESGStats().get("social_score")}');
                            gradeS('${s.getESGStats().get("social_grade")}');
                            gov('${s.getESGStats().get("governance_score")}');
                            gradeG('${s.getESGStats().get("environment_grade")}');
                            totalGrade('${s.getESGStats().get('total_grade')}')"
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
                            totalesg('${s.getESGStats().get('total')}');
                            environment('${s.getESGStats().get("environment_score")}');
                            gradeE('${s.getESGStats().get("environment_grade")}');
                            social('${s.getESGStats().get("social_score")}');
                            gradeS('${s.getESGStats().get("social_grade")}');
                            gov('${s.getESGStats().get("governance_score")}');
                            gradeG('${s.getESGStats().get("environment_grade")}');
                            totalGrade('${s.getESGStats().get('total_grade')}')"
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
                            priceOpen('${s.getStockPrice().get('regularMarketOpen')}')"
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
                            totalesg('${s.getESGStats().get('total')}');
                            environment('${s.getESGStats().get("environment_score")}');
                            gradeE('${s.getESGStats().get("environment_grade")}');
                            social('${s.getESGStats().get("social_score")}');
                            gradeS('${s.getESGStats().get("social_grade")}');
                            gov('${s.getESGStats().get("governance_score")}');
                            gradeG('${s.getESGStats().get("environment_grade")}');
                            totalGrade('${s.getESGStats().get('total_grade')}')"
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
                    <p>**curating portfolio stuff will go here**</p>
                </div>
            </div>

        <!--end of portfolio column-->
        </div>

        <!---->
        <!--WELCOME SIDE PANEL-->
        <!---->
        <div class="col-lg-4 gx-5" id="company-info-box">
            <div id="welcome-container">
            <h2 id="welcome-message">Welcome to<br>ESGInvest</h2>

            <br>
            <hr>
            <br>

            <div id="welcome-sub">
                <p>Add a stock using the plus button at the top of the page</p>
                <p>Or <strong style="color: var(--navy)">Request a Curated Portfolio</strong> to get a recommended list of stocks that meet your environmental, social, and governance standards.</p>
            </div>

            <button id="learn-more">Learn More About ESG</button>

                <!-- The Modal -->
            <div id="myModal" class="modal">
                <div class="modal-content">
                    <span class="close" style="text-align: right">&times;</span>
                    <h2 style="text-align: center">Here is some information on ESGs,<br>provided by ESG Enterprise</h2>
                    <br>
                    <p>ESG Materiality
                        <br>
                        The Environmental, Social, and Governance risks and opportunities, posed by long-term science-based
                        trends like climate change, global warming, energy transitions, consumer spending shifts, and world
                        economy and demographic shifts. Organizations more than ever face the major challenges as well as risks
                        and opportunities of adapting their business operations to the ESG trends.
                        The material risks to an industry exposes the same risks to individual organizations. The same materiality
                        applies to organizations able to capitalize on profit and opportunities.
                        ESG Enterprise Rating methodology focuses on multiple levels of materiality from global, country, industryspecific issues.
                        The research team seeks to answer critical questions of what are the most significant risks facing the
                        organizations and their industry. Subsequently, it also answers how well organizations manage those risks
                        and opportunities. Finally, the system ranks the organization's ESG standings against its industry peers for
                        each country.
                        <br><br>
                        Risks
                        <br>
                        Material ESG risks are identified by ESG Enterprise Research Committee on a quarterly basis based on
                        countries and industries. Once issues are selected, the Data Research team sets the weights and impacts
                        based on AI-driven algorithms that contribute to the overall ESG Rating. The process applies to all three
                        E, S, G criteria. The final risks are aggregated and reviewed by the data analysts who may curate the data
                        based on direct communication and questionnaire with the organizations’ investor relations department.
                        Typical risks are usually related to climate change impacts, emissions mitigation, and adaptation,
                        environmental management practices and duty of care, working and safety condition, respect for human
                        rights, anti-bribery and corruption practices, and compliance to relevant laws and regulations.
                        <br><br>
                        ESG Enterprise Solution
                        <br>
                        TheESG Enterprise SaaS solution provides a web-based ESG data portal and Big Data Analytics, which
                        allow investors and ESG professionals to search and view all 40,000 organizations' ESG data. The
                        SaaS platform is easy-to-use, displays dynamic trends and data visualization, and shows the
                        comparison with its peers and improvement scores.</p>
                </div>
            </div>
            </div>


            <div id="stock-info-container">
                <h2 id="info-company-name">Company Name</h2>
                <p id="info-ticker">Stock Ticker</p>
                <p id="info-total-esg">Total ESG Score</p>
                <h2 id="info-letter-grade">Total Letter Grade</h2>
                <p><span id="info-environment">Environmental Score</span><span id="grade-e">grade</span></p>
                <p><span id="info-social">Social Score</span><span id="grade-s">grade</span></p>
                <p><span id="info-gov">Governance Score</span><span id="grade-g">grade</span></p>
                <hr>
                <p id="info-price">Stock Price</p>
                <p id="info-price-change">Stock Price Change</p>
                <p id="info-open">Stock Price Open</p>
                <p id="info-close">Stock Price Close</p>
                <p id="info-high">Stock Price High</p>
                <p id="info-low">Stock Price Low</p>
                <p id="info-mktcap">Market Cap</p>
                <p id="info-pe">P/E ratio</p>
                <p id="info-div">Div Yield</p>
                <hr>
                <p id="info-top-stories">Top Stories</p>
                <br>
                <button id="remove-stock">Remove Stock</button>
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

    }
    function environment(clicked) {
        document.getElementById("info-environment").innerText = "Total Environmental Score: " + clicked.substring(0, 3);
    }
    function social(clicked) {
        document.getElementById("info-social").innerText = "Total Social Score: " + clicked.substring(0, 3);
    }
    function gov(clicked) {
        document.getElementById("info-gov").innerText = "Total Governance Score: " + clicked.substring(0, 3);
    }
    function gradeE(clicked) {
        document.getElementById("grade-e").innerText = " (" + clicked.substring(0, 3) + ")";
    }
    function gradeS(clicked) {
        document.getElementById("grade-s").innerText = " (" + clicked.substring(0, 3) + ")";
    }
    function gradeG(clicked) {
        document.getElementById("grade-g").innerText = " (" + clicked.substring(0, 3) + ")";
    }
    function totalGrade(clicked) {
        document.getElementById("info-letter-grade").innerText = clicked;
    }
    function price(clicked) {
        document.getElementById("info-price").innerText = "$" + clicked;
    }
    function priceChange(clicked) {
        document.getElementById("info-price-change").innerText = clicked + "%";
    }
    function priceOpen(clicked) {
        document.getElementById("info-open").innerText = "Open Price = $" + clicked;
    }

</script>

<!--pop up for info on ESGs-->
<script>
    // Get the modal
    var modal = document.getElementById("myModal");
    // Get the button that opens the modal
    var btn = document.getElementById("learn-more");
    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];
    // When the user clicks the button, open the modal
    btn.onclick = function() {
        modal.style.display = "block";
    }
    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
        modal.style.display = "none";
    }
    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
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
