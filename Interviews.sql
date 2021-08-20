SELECT
*
FROM
(
SELECT 
contest_id, hacker_id, name,
IFNULL((SELECT SUM(total_submissions) FROM Contests s LEFT JOIN Colleges USING(contest_id) LEFT JOIN Challenges USING(college_id) LEFT JOIN Submission_Stats USING(challenge_id) WHERE t.contest_id = s.contest_id), 0) as total_submissions,
IFNULL((SELECT SUM(total_accepted_submissions) FROM Contests s LEFT JOIN Colleges USING(contest_id) LEFT JOIN Challenges USING(college_id) LEFT JOIN Submission_Stats USING(challenge_id) WHERE t.contest_id = s.contest_id), 0) as total_accept_submissions,
IFNULL((SELECT SUM(total_views) FROM Contests s LEFT JOIN Colleges USING(contest_id) LEFT JOIN Challenges USING(college_id) LEFT JOIN View_Stats USING(challenge_id) WHERE t.contest_id = s.contest_id), 0) as total_views,
IFNULL((SELECT SUM(total_unique_views) FROM Contests s LEFT JOIN Colleges USING(contest_id) LEFT JOIN Challenges USING(college_id) LEFT JOIN View_Stats USING(challenge_id) WHERE t.contest_id = s.contest_id), 0) as total_unique_views
FROM Contests t
ORDER BY contest_id
) t1
where t1.total_submissions + t1.total_accept_submissions + t1.total_views + t1.total_unique_views > 0
