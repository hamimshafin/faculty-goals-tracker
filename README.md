# Faculty Goals Tracker

A relational database system designed to manage, track, and analyze faculty academic goals and progress. Developed as an individual capstone project for CIS/CSC 480 at Wayne State College during Spring 2026.

## Project Overview

The Faculty Goals Tracker provides a structured approach to managing faculty goals, monitoring progress updates, and generating reports.

The project addresses the challenges of tracking academic goals without a centralized system by using a relational database built with Microsoft SQL Server.

SQL queries are used to retrieve faculty information, monitor goal progress, and identify trends. A Power BI report is also included for data visualization.

## Technologies Used

- **Microsoft SQL Server** — Database management
- **SQL Server Management Studio (SSMS)** — Database development and querying
- **SQL** — Data manipulation, joins, aggregation, and reporting
- **Power BI** — Data visualization and reporting

## Database Structure

The database, `FacultyGoalsDB`, consists of three interconnected tables.

### 1. Faculty

Stores faculty information, including:

- FacultyID (Primary Key)
- FirstName
- LastName
- Department
- Email

### 2. Goals

Stores academic goals assigned to faculty members.

- GoalID (Primary Key)
- FacultyID (Foreign Key)
- GoalTitle
- Description
- StartDate
- EndDate
- Status

### 3. ProgressUpdates

Tracks progress associated with individual goals.

- ProgressID (Primary Key)
- GoalID (Foreign Key)
- UpdateDate
- PercentComplete
- Notes

### Table Relationships

- One faculty member can have multiple goals.
- Each goal belongs to one faculty member.
- One goal can have multiple progress updates.

These relationships are maintained through primary and foreign keys.

## Key Features

- Centralized storage of faculty goals and progress records
- Tracking of goal status and completion percentages
- Retrieval of faculty goals using SQL joins
- Calculation of average progress by faculty member
- Identification of goals nearing completion
- Filtering of goals currently in the planning stage
- Structured reporting of faculty information and goals

## SQL Queries and Analysis

The project includes SQL queries designed to retrieve and analyze faculty goal information.

**Faculty Goals with Progress**

Combines faculty, goals, and progress updates using SQL joins to display goal information and completion percentages.

**Average Progress by Faculty**

Uses `AVG()`, `CAST()`, and `GROUP BY` to calculate average progress for individual faculty members.

**Goals Near Completion**

Filters progress records with completion percentages of 80% or higher.

**Goals in Planning**

Retrieves goals with a status of `Planning`.

**Faculty Information Report**

Combines faculty details, goal descriptions, status, and progress information into a structured report.

## Sample Data

The database includes demonstration records for:

- 8 faculty members
- 16 academic goals
- 27 progress updates

The sample data represents academic activities such as research publications, curriculum development, conference presentations, and student outreach programs.

## Power BI Dashboard

The project includes a Power BI report for visualizing faculty goal and progress data.

**Power BI file:** `Dashboard for project.pbix`

The report can be opened using Microsoft Power BI Desktop.

## How to Run the Project

### Prerequisites

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- Microsoft Power BI Desktop (for viewing the report)

### Database Setup

1. Open SQL Server Management Studio.
2. Connect to your SQL Server instance.
3. Open the provided SQL script.
4. Execute the script to create `FacultyGoalsDB`.
5. The script creates the database tables and inserts sample records.
6. Execute the included queries to explore the data.

**Note:** The SQL script drops and recreates the three project tables if they already exist. Running it against an existing populated database will remove the existing data in those tables.

### Power BI

1. Open Microsoft Power BI Desktop.
2. Open the provided `.pbix` file.
3. If necessary, update the data source connection to your local SQL Server instance.
4. Refresh the report after establishing the connection.

## What I Learned

Through this project, I gained practical experience in:

- Designing relational databases
- Establishing primary and foreign key relationships
- Writing SQL queries using joins and aggregate functions
- Organizing structured data for reporting
- Tracking progress through database records
- Applying database concepts to an academic management scenario

## Future Improvements

Potential enhancements include:

- Developing a user interface for faculty members
- Allowing users to create and update goals directly
- Implementing user authentication and access controls
- Adding automated reporting
- Expanding dashboard functionality

## Author

**Hamim Shafin**

B.S. Computer Science  
Wayne State College

*Individual Capstone Project — CIS/CSC 480, Spring 2026*
