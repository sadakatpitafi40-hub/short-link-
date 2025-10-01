<?php
$conn = new mysqli("localhost", "root", "", "shortener");

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $title = $_POST['title'];
    $desc = $_POST['description'];
    $image = $_POST['image'];
    $url = $_POST['url'];
    $short = substr(md5(time()), 0, 6);

    $stmt = $conn->prepare("INSERT INTO short_links (short_code, title, description, image_url, redirect_url) VALUES (?, ?, ?, ?, ?)");
    $stmt->bind_param("sssss", $short, $title, $desc, $image, $url);
    $stmt->execute();

    echo "Short link created: https://mysite.com/".$short;
}
?>
