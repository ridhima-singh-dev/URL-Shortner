<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>URL Shortener</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--    <h2>URL Shortener</h2>--%>
<%--    <form action="ShortenUrlServlet" method="post"> <!-- Form Action -->--%>
<%--        Enter URL: <input type="text" name="url"><br>--%>
<%--        <input type="submit" value="Shorten" name="shortenBtn"> <!-- Submit Button -->--%>
<%--    </form>--%>
<%--    <br>--%>
<%--    <h3>Shortened URL:</h3>--%>
<%--    <p>${shortenedUrl}</p> <!-- Display Shortened URL -->--%>

<%--    <h2>URL Expander</h2>--%>
<%--    <form action="ExpandUrlServlet" method="post">--%>
<%--        Enter Shortened URL: <input type="text" name="shortUrl"><br>--%>
<%--        <input type="submit" value="Expand" name="expandBtn">--%>
<%--    </form>--%>
<%--    <br>--%>
<%--    <h3>Original URL:</h3>--%>
<%--    <% if (request.getAttribute("originalUrl") != null) { %>--%>
<%--    <p><%= request.getAttribute("originalUrl") %></p>--%>
<%--    <% } else { %>--%>
<%--    <p>No URL expanded yet.</p>--%>
<%--    <% } %>--%>
<%--</body>--%>
<%--</html>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="style.css">
    <title>Day #53 - Url Shortner</title>
</head>
<body>
<div class="container">
    <i class="bx bx-link-alt"></i>
    <h1>Url Shortner</h1>

    <!-- Form for URL Shortening -->
    <form action="ShortenUrlServlet" method="post">
        <label for="url">Enter URL To Shorten :</label>
        <input type="text" id="url" name="url" placeholder="https://example.com">
        <div class="buttons">
            <button type="submit" id="short-btn">Short It</button>
        </div>
    </form>

    <!-- Display Shortened URL -->
    <% if (request.getAttribute("shortenedUrl") != null) { %>
    <label for="shortenedUrl">Shortened URL :</label>
    <textarea id="shortenedUrl" rows="3" readonly><%= request.getAttribute("shortenedUrl") %></textarea>
    <% } %>

    <!-- Form for URL Expanding -->
    <form action="ExpandUrlServlet" method="post">
        <label for="shortUrl">Enter Shortened URL:</label>
        <input type="text" id="shortUrl" name="shortUrl" placeholder="Short URL">
        <div class="buttons">
            <button type="submit" id="expandBtn">Expand</button>
        </div>
    </form>

    <!-- Display Original URL -->
    <% if (request.getAttribute("originalUrl") != null) { %>
    <label for="originalUrl">Original URL :</label>
    <textarea id="originalUrl" rows="3" readonly><%= request.getAttribute("originalUrl") %></textarea>
    <% } %>

    <button id="reload-btn" onclick="window.location.reload();">Reload</button>
</div>

<!-- Include your script.js if necessary -->
<script src="script.js"></script>
</body>
</html>
