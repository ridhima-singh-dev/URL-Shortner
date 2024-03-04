<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="style.css">
    <title>Url Shortner</title>
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
    <form action="ExpandUrlServlet" method="post" >
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

    <!-- <button id="reload-btn" onclick="window.location.reload();">Reload</button> -->
    <button type="button" id="clear-btn">Clear</button>
</div>

<!-- Include your script.js if necessary -->
<script src="script.js"></script>
<script>
function clearFields() {
    document.getElementById('url').value = '';
    document.getElementById('shortUrl').value = '';
    document.getElementById('originalUrl').value = '';
}

document.getElementById('clear-btn').addEventListener('click', function() {
    clearFields();
});
</script>
</body>
</html>
