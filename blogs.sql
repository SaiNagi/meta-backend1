-- CREATING BLOGS  DATA BASE SCHEMA 
CREATE TABLE user (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  user_name VARCHAR(200) NOT NULL,
  email VARCHAR(200) NOT NULL UNIQUE,
  PASSWORD VARCHAR(200) NOT NULL,
  created_at TIMESTAMP DEFAULT 0,
  profile_picture VARCHAR(200)
);
CREATE TABLE posts (
  post_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  title VARCHAR(255) NOT NULL,
  content TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT '2023-01-01 00:00:00',
  updated_at TIMESTAMP DEFAULT '2023-01-01 00:00:00',
  likes INT DEFAULT 0,
  FOREIGN KEY (user_id) REFERENCES user(user_id)
);
CREATE TABLE COMMENT (
  comment_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  post_id INT,
  content TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT '2023-01-01 00:00:00',
  likes INT DEFAULT 0,
  FOREIGN KEY (user_id) REFERENCES user(user_id),
  FOREIGN KEY (post_id) REFERENCES posts(post_id)
);
 --  INSERTING THE DATA INTO THE TABLES 
INSERT INTO
  user (
    user_id,
    user_name,
    email,
    PASSWORD,
    created_at,
    profile_picture
  )
VALUES
  (
    1,
    'Aarav Verma',
    'aarav.verma@example.com',
    'password1',
    '2023-01-01 00:00:00',
    'aarav_profile_pic.jpg'
  ),
  (
    2,
    'Aditi Gupta',
    'aditi.gupta@example.com',
    'password2',
    '2023-01-01 00:00:00',
    'aditi_profile_pic.jpg'
  ),
  (
    3,
    'Arjun Patel',
    'arjun.patel@example.com',
    'password3',
    '2023-01-01 00:00:00',
    'arjun_profile_pic.jpg'
  ),
  (
    4,
    'Ananya Singh',
    'ananya.singh@example.com',
    'password4',
    '2023-01-01 00:00:00',
    'ananya_profile_pic.jpg'
  ),
  (
    5,
    'Ved Sharma',
    'ved.sharma@example.com',
    'password5',
    '2023-01-01 00:00:00',
    'ved_profile_pic.jpg'
  );
INSERT INTO
  posts (
    post_id,
    user_id,
    title,
    content,
    created_at,
    updated_at,
    likes
  )
VALUES
  (
    1,
    3,
    'First Post',
    'This is the content of the first post.',
    '2023-01-01 00:00:00',
    '2023-01-01 00:00:00',
    0
  ),
  (
    2,
    2,
    'Second Post',
    'Content of the second post goes here.',
    '2023-01-01 00:00:00',
    '2023-01-01 00:00:00',
    0
  ),
  (
    3,
    1,
    'Third Post',
    'Content of the third post.',
    '2023-01-01 00:00:00',
    '2023-01-01 00:00:00',
    0
  );

INSERT INTO
  COMMENT (user_id, post_id, content, created_at, likes)
VALUES
  (1, 1, 'Great post!', '2023-01-01 00:00:00', 0),
  (
    2,
    1,
    'I enjoyed reading this.',
    '2023-01-01 00:00:00',
    0
  ),
  (
    3,
    2,
    'Interesting topic!',
    '2023-01-01 00:00:00',
    0
  ),
  (1, 3, 'Nice content.', '2023-01-01 00:00:00', 0);


-- Write a MongoDB query to find all posts created by a specific user,including the user details.
SELECT
  posts.post_id,
  posts.title,
  posts.content,
  user.user_id,
  user.user_name,
  user.email
FROM
  posts
  JOIN user ON posts.user_id = user.user_id
WHERE
  user.user_id = 1;