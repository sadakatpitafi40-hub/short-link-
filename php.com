<?php
$conn = new mysqli("localhost", "root", "", "shortener");
$code = $_GET['code'];

$result = $conn->query("SELECT * FROM short_links WHERE short_code='$code'");
if ($row = $result->fetch_assoc()) {
    echo "<!DOCTYPE html>
    <html>
    <head>
        <title>{$row['title']}</title>
        <meta property='og:title' content='{$row['title']}' />
        <meta property='og:description' content='{$row['description']}' />
        <meta property='og:image' content='{$row['image_url']}' />
        <meta property='og:url' content='{$row['redirect_url']}' />
        <meta http-equiv='refresh' content='3;url={$row['redirect_url']}' />
    </head>
    <body>
        <h1>{$row['title']}</h1>
        <p>{$row['description']}</p>
        <img src='{$row['image_url']}' width='300' />
        <p>Redirecting to main page...</p>
    </body>
    </html>";
} else {
    echo "Invalid short link!";
}
?>

