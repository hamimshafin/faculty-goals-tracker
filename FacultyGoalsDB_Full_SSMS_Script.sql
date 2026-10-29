
USE master;
IF DB_ID('FacultyGoalsDB') IS NULL
    CREATE DATABASE FacultyGoalsDB;
GO

USE FacultyGoalsDB;
GO

IF OBJECT_ID('dbo.ProgressUpdates', 'U') IS NOT NULL DROP TABLE dbo.ProgressUpdates;
IF OBJECT_ID('dbo.Goals', 'U') IS NOT NULL DROP TABLE dbo.Goals;
IF OBJECT_ID('dbo.Faculty', 'U') IS NOT NULL DROP TABLE dbo.Faculty;
GO

CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(100),
    Email VARCHAR(100)
);
GO

CREATE TABLE Goals (
    GoalID INT PRIMARY KEY,
    FacultyID INT,
    GoalTitle VARCHAR(200),
    Description VARCHAR(500),
    StartDate DATE,
    EndDate DATE,
    Status VARCHAR(50),
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
);
GO

CREATE TABLE ProgressUpdates (
    ProgressID INT PRIMARY KEY,
    GoalID INT,
    UpdateDate DATE,
    PercentComplete INT,
    Notes VARCHAR(500),
    FOREIGN KEY (GoalID) REFERENCES Goals(GoalID)
);
GO

INSERT INTO Faculty (FacultyID, FirstName, LastName, Department, Email) VALUES
(1, 'Emily', 'Carter', 'Computer Science', 'ecarter@wsc.edu'),
(2, 'James', 'Miller', 'Business', 'jmiller@wsc.edu'),
(3, 'Laura', 'Nguyen', 'Mathematics', 'lnguyen@wsc.edu'),
(4, 'Robert', 'Johnson', 'Computer Science', 'rjohnson@wsc.edu'),
(5, 'Sophia', 'Davis', 'Information Systems', 'sdavis@wsc.edu'),
(6, 'Daniel', 'Brown', 'Business', 'dbrown@wsc.edu'),
(7, 'Megan', 'Wilson', 'Mathematics', 'mwilson@wsc.edu'),
(8, 'Kevin', 'Anderson', 'Computer Science', 'kanderson@wsc.edu');
GO

INSERT INTO Goals (GoalID, FacultyID, GoalTitle, Description, StartDate, EndDate, Status) VALUES
(1, 1, 'Publish Research Paper', 'Submit a research paper to an academic journal', '2026-01-10', '2026-06-01', 'In Progress'),
(2, 1, 'Revise Database Course', 'Update assignments and SQL lab activities', '2026-01-15', '2026-05-15', 'In Progress'),
(3, 2, 'Industry Partnership', 'Develop a local business partnership for student projects', '2026-02-01', '2026-07-01', 'Planning'),
(4, 2, 'Conference Presentation', 'Present at a business education conference', '2026-01-20', '2026-04-25', 'Near Completion'),
(5, 3, 'Workshop Series', 'Create problem-solving workshops for students', '2026-01-12', '2026-04-30', 'In Progress'),
(6, 3, 'Curriculum Review', 'Review and update course topics', '2026-02-05', '2026-06-20', 'Planning'),
(7, 4, 'Grant Proposal', 'Prepare and submit a grant proposal', '2026-01-18', '2026-05-30', 'In Progress'),
(8, 4, 'Research Collaboration', 'Work with another department on joint research', '2026-02-10', '2026-08-01', 'Planning'),
(9, 5, 'Student Internship Program', 'Expand internship opportunities for students', '2026-01-25', '2026-06-15', 'In Progress'),
(10, 5, 'Technology Training', 'Complete training on new data systems', '2026-02-03', '2026-04-20', 'Near Completion'),
(11, 6, 'Publication Submission', 'Submit article to practitioner journal', '2026-01-30', '2026-05-10', 'In Progress'),
(12, 6, 'Advising Improvement Plan', 'Create a better advising workflow', '2026-02-08', '2026-06-30', 'Planning'),
(13, 7, 'Math Outreach Program', 'Develop outreach activities for local schools', '2026-01-14', '2026-05-05', 'In Progress'),
(14, 7, 'Assessment Revision', 'Improve student learning assessment process', '2026-02-12', '2026-06-10', 'Planning'),
(15, 8, 'Security Lab Update', 'Add cybersecurity exercises to lab work', '2026-01-16', '2026-05-01', 'Near Completion'),
(16, 8, 'Faculty Seminar Series', 'Organize internal faculty seminar events', '2026-02-15', '2026-07-15', 'Planning');
GO

INSERT INTO ProgressUpdates (ProgressID, GoalID, UpdateDate, PercentComplete, Notes) VALUES
(1, 1, '2026-02-01', 20, 'Completed literature review'),
(2, 1, '2026-03-01', 45, 'Drafted major sections'),
(3, 1, '2026-03-20', 65, 'Revisions underway'),
(4, 2, '2026-02-10', 30, 'Reviewed existing assignments'),
(5, 2, '2026-03-10', 55, 'Reworked SQL lab examples'),
(6, 3, '2026-03-01', 15, 'Identified possible partner organizations'),
(7, 4, '2026-02-15', 50, 'Abstract drafted'),
(8, 4, '2026-03-18', 85, 'Slides prepared'),
(9, 5, '2026-02-20', 35, 'Workshop topics selected'),
(10, 5, '2026-03-22', 60, 'Materials in development'),
(11, 6, '2026-03-05', 10, 'Initial review started'),
(12, 7, '2026-02-25', 25, 'Grant requirements reviewed'),
(13, 7, '2026-03-25', 50, 'Budget drafted'),
(14, 8, '2026-03-12', 20, 'Met with collaborating faculty'),
(15, 9, '2026-02-28', 40, 'Contacted internship sites'),
(16, 9, '2026-03-28', 70, 'Responses received'),
(17, 10, '2026-02-22', 60, 'Training modules completed'),
(18, 10, '2026-03-30', 90, 'Final certification pending'),
(19, 11, '2026-02-18', 30, 'Article outline finished'),
(20, 11, '2026-03-27', 55, 'First draft completed'),
(21, 12, '2026-03-08', 15, 'Workflow problems identified'),
(22, 13, '2026-02-26', 35, 'School contacts made'),
(23, 13, '2026-03-29', 60, 'Program plan drafted'),
(24, 14, '2026-03-14', 20, 'Assessment criteria reviewed'),
(25, 15, '2026-02-12', 75, 'Lab revisions almost finished'),
(26, 15, '2026-03-21', 95, 'Testing completed'),
(27, 16, '2026-03-25', 25, 'Initial event schedule proposed');
GO

-- 1. Show all faculty
SELECT * FROM Faculty;
GO

-- 2. Show all goals
SELECT * FROM Goals;
GO

-- 3. Show all progress updates
SELECT * FROM ProgressUpdates;
GO

-- 4. Faculty goals with progress
SELECT 
    f.FirstName + ' ' + f.LastName AS FacultyName,
    f.Department,
    g.GoalTitle,
    g.Status,
    p.UpdateDate,
    p.PercentComplete
FROM Faculty f
JOIN Goals g ON f.FacultyID = g.FacultyID
JOIN ProgressUpdates p ON g.GoalID = p.GoalID
ORDER BY f.LastName, g.GoalTitle, p.UpdateDate;
GO

-- 5. Average progress by faculty
SELECT 
    f.FirstName + ' ' + f.LastName AS FacultyName,
    AVG(CAST(p.PercentComplete AS FLOAT)) AS AvgProgress
FROM Faculty f
JOIN Goals g ON f.FacultyID = g.FacultyID
JOIN ProgressUpdates p ON g.GoalID = p.GoalID
GROUP BY f.FirstName, f.LastName
ORDER BY AvgProgress DESC;
GO

-- 6. Goals near completion
SELECT 
    f.FirstName + ' ' + f.LastName AS FacultyName,
    g.GoalTitle,
    p.PercentComplete
FROM Faculty f
JOIN Goals g ON f.FacultyID = g.FacultyID
JOIN ProgressUpdates p ON g.GoalID = p.GoalID
WHERE p.PercentComplete >= 80
ORDER BY p.PercentComplete DESC;
GO

-- 7. Goals still in planning
SELECT 
    f.FirstName + ' ' + f.LastName AS FacultyName,
    g.GoalTitle,
    g.Status
FROM Faculty f
JOIN Goals g ON f.FacultyID = g.FacultyID
WHERE g.Status = 'Planning';
GO

-- 8. Faculty information form style output
SELECT 
    f.FirstName + ' ' + f.LastName AS FacultyName,
    f.Department,
    f.Email,
    g.GoalTitle,
    g.Description,
    g.Status,
    MAX(p.PercentComplete) AS LatestProgress
FROM Faculty f
JOIN Goals g ON f.FacultyID = g.FacultyID
LEFT JOIN ProgressUpdates p ON g.GoalID = p.GoalID
GROUP BY 
    f.FirstName, f.LastName, f.Department, f.Email,
    g.GoalTitle, g.Description, g.Status
ORDER BY FacultyName;
GO
