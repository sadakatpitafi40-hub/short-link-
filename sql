CREATE TABLE short_links (
    id INT AUTO_INCREMENT PRIMARY KEY,
    short_code VARCHAR(50) UNIQUE,
    title VARCHAR(255),
    description TEXT,
    image_url VARCHAR(255),
    redirect_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
