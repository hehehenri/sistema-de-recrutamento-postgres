DELETE FROM admins
WHERE id >= 25;

DELETE FROM companies
WHERE id >= 25;

DELETE FROM recruiters
WHERE id >= 25;

DELETE FROM positions
WHERE id <= 5;

DELETE FROM candidates
WHERE id <= 10
AND id >= 20;

DELETE FROM interviews
WHERE id >= 25;
