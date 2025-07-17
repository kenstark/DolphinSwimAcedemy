@import gg.jte.Content

@param Content content
@param String title = "Dolphins Swim Academy"

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .navbar {
            background: linear-gradient(135deg, #7272FE 0%, #4682B4 100%);
        }
        .navbar-brand, .navbar-nav .nav-link {
            color: white !important;
        }
        .navbar-brand:hover, .navbar-nav .nav-link:hover {
            color: #f0f8ff !important;
        }
        .footer {
            background-color: #e9ecef;
            margin-top: 50px;
            padding: 20px 0;
            text-align: center;
            color: #6c757d;
        }
        .main-content {
            min-height: calc(100vh - 200px);
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="/">
            <img src="dolphin128x128.png" alt="Dolphin" class="me-2" style="width: 40px; height: 40px;">
            Dolphins Swim Academy
        </a>
        <div class="navbar-nav ms-auto">
            <a class="nav-link" href="/classes">Classes</a>
            <a class="nav-link" href="/students">Students</a>
            <a class="nav-link" href="/coaches">Coaches</a>
        </div>
    </div>
</nav>

<main class="main-content">
    ${content}
</main>

<footer class="footer">
    <div class="container">
        <p>Copyright &copy; Dolphins Swim Academy 2024<br>
            Dolphin icon is created by <a href="https://www.flaticon.com/authors/freepik">Freepik</a> from <a href="https://www.flaticon.com/">Flaticon</a></p>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>