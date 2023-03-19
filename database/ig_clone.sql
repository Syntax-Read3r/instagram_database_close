USE       instagram_clone;

CREATE    TABLE users (
          id INT AUTO_INCREMENT PRIMARY KEY,
          username VARCHAR(20) UNIQUE NOT NULL,
          create_at TIMESTAMP DEFAULT NOW()
          );

CREATE    TABLE photos (
          id INT AUTO_INCREMENT PRIMARY KEY,
          image_url VARCHAR(255) NOT NULL,
          user_id INT NOT NULL,
          created_at TIMESTAMP DEFAULT NOW(),
          FOREIGN KEY (user_id) REFERENCES users (id)
          );

CREATE    TABLE IF NOT EXISTS comments (
          id INT AUTO_INCREMENT PRIMARY KEY,
          comment_text VARCHAR(255) NOT NULL,
          user_id INT NOT NULL,
          photo_id INT NOT NULL,
          create_at TIMESTAMP DEFAULT NOW(),
          FOREIGN KEY (user_id) REFERENCES users (id),
          FOREIGN KEY (photo_id) REFERENCES photos (id)
          );

CREATE    TABLE IF NOT EXISTS likes (
          user_id INT NOT NULL,
          photo_id INT NOT NULL,
          created_id TIMESTAMP DEFAULT NOW(),
          FOREIGN KEY (user_id) REFERENCES users (id),
          FOREIGN KEY (photo_id) REFERENCES photos (id),
          PRIMARY KEY (user_id, photo_id) --This insures that there can only be on instance of user liking a photo and the user or users cannot like the photo multiple times.
          );

CREATE    TABLE IF NOT EXISTS FOLLOWS (
          follower_id INT NOT NULL,
          followee_id INT NOT NULL,
          created_at TIMESTAMP DEFAULT NOW(),
          FOREIGN KEY (follower_id) REFERENCES users (id),
          FOREIGN KEY (followee_id) REFERENCES users (id),
          PRIMARY KEY (follower_id, followee_id) -- Thid insures that there is only a single instance where someone follows someone and it's recorded in the database.
          );
        
        CREATE TABLE IF NOT EXISTS hash_tags (
            
        )