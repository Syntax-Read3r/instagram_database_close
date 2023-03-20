-- Active: 1678142921105@@127.0.0.1@3306@ig_clone
-- The structure of the question are those that are used in a cooperate setting. 
-- =============================================================================
-- Q.1... We want to reward our users who have been around the longest. (Find the oldest users on the app?)
SELECT    *
FROM      users
ORDER BY  created_at DESC
LIMIT     5;

-- =============================================================================
-- Q.2...We need to figure out when to schedule aan ad campaign (What day of the week do most users register on?) 
SELECT    DAYOFWEEK(created_at) WEEKDAY,
          COUNT(*)              COUNT
FROM      users
GROUP BY  WEEKDAY
ORDER BY  WEEKDAY;

-- ============================================================================
-- Q.3... We want to target out inactive users with an email campaign. (Find the users who have never posted a photo)
SELECT    u.id,
          u.username
FROM      users u
LEFT JOIN photos p ON p.user_id = u.id
WHERE     p.created_at IS NULL;

-- ============================================================================
-- Q.4... We're running a new contest to see who can get the most likes on a single photo. (Who won?)
SELECT    u.username,
          p.id,
          p.image_url url,
          COUNT(*)    total
FROM      users u
JOIN      photos p ON p.user_id = u.id
JOIN      likes l ON l.photo_id = p.id
GROUP BY  p.id
ORDER BY  total DESC
LIMIT     3;

-- ===========================================================================
-- Q.5... Our investors want to know..(How many times does the average user post?)
SELECT    AVG(cnt_per_user)
FROM      (
          SELECT    COUNT(*) AS cnt_per_user
          FROM      photos p
          GROUP BY  p.user_id
          ) photo_counts_by_user;

-- answer in class did not take into account of users that do not post.. So the answer provided was wrong.
-- ===========================================================================
-- Q.6... A brand wants to know which hashtags to use in a post (What are the top 5 most commonly uesd hashtags?)
SELECT    t.tag_name,
          COUNT(*)
FROM      tags t
JOIN      photo_tags pt ON t.id = pt.tag_id
GROUP BY  pt.tag_id
ORDER BY  pt.tag_id DESC
LIMIT     5;

-- ============================================================================
-- We have a small problem with bot on our site>> (Find users who have liked every single photo on the site)
SELECT    *
FROM      users