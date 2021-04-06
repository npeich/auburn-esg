<%--
  Created by IntelliJ IDEA.
  User: natalieeichorn
  Date: 4/6/21
  Time: 4:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <style><%@include file="/custom.css"%></style>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@900&family=Source+Sans+Pro&display=swap" rel="stylesheet">

    <title>ESGInvest Information</title>
</head>
<body>
    <!--BACK BUTTON-->
    <a href="index.jsp"><button id="go-back">&nbsp;&nbsp;<- Return to Homepage&nbsp;&nbsp;</button></a>


    <!--CONTENT-->
    <p></p>
    <h2 style="text-align: center">Information on ESG Scoring</h2>
    <br>

    <div style="text-align: center">
    <p>A = highest score (dark green)</p>
    <p>BBB = (light green)</p>
    <p>BB = (yellow)</p>
    <p>B = (orange)</p>
    <p>CCC = lowest score (red)</p>
    </div>

    <br>

    <p></p>
    <h2 style="text-align: center">Using the App</h2>
    <br>
    <ul>
        <li>Add companies by typing their stock ticker into the add bar. The app will return the company in your portfolio (the left hand panel)</li>
        <li>The portfolio will display the company name and the overall ESG score as a letter grade.  The company's box will also indicate the rating based on color.</li>
        <li>Click on a company to learn more!  The information will populate in the right hand panel.</li>
        <li>The information panel will display detailed ESG scores (individual environmental, social, and governance scores) and current stock price information.</li>
        <li>The information panel also has a 'Remove Stock' button to remove the selected stock from the portfolio.</li>
        <li>Sort the portfolio based on highest to lowest environmental/social/governance scores. Default will sort the portfolio based on the order you added stocks.</li>
    </ul>

    <br>

    <p></p>

    <h2 style="text-align: center">Here is some information on ESGs, provided by <a id="esg-link" href="https://www.esgenterprise.com/" target="_blank">ESG Enterprise</a></h2>
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



</body>
</html>
