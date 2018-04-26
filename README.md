# Derailed :warning:

## First off, who we are:
**Title:** Derailed

**Team Members:** [Aivant Goyal](https://github.com/aivantg), [Emily Zhong](https://github.com/emilyzhong), [Franco Franco](https://github.com/Francotorium), [Jemma Kwak](https://github.com/jemmakwak)

**Demo Link:** [LINK HERE](https://www.google.com)

## This is our idea :bulb:
An application where administrators can post pertinent educational resources (lectures, readings, demos, assignments), grade homework, and keep track of attendance, while other users (being students) can view these resources, submit their homeworks, mark attendace, etc.

## These are our models
### Student :raising_hand:
* Has name, email, and many (homework) submissions and attendances.
* Belongs to a semester.

### Admin :older_woman:
* Has name, email, descriptions, active or not.

### Semester :calendar:
* Has a title
* Has many students and weeks

### Week :date:
* Has a date, title, description, and week number
* Belongs to a semester, has many resources, attendances, and assignments

### Attendance :white_check_mark:
* Has a status and comment (for excused absences)
* Belongs to a week and a student.

### Assignment :notebook_with_decorative_cover:
* Has a title, due date, description, link, and points
* Belongs to a week, and has many submissions

### Resource :books:
* Has a title, link, and description
* Belongs to a week

### Submission :link:
* Has a link. Pretty much is a link.
* Also has a score, comment (to be left by the grader), a "graded" boolean, and a submission time
* Has a student and an assigned admin grader

## These are our features
- Both student and admin can create accounts, log in, delete their own accounts, change their password, update their picture, etc
- Admin can create weeks, assignments, resources, semesters. They can also grade student assignment submissions, which are automatically assigned to administrators randomly.
- Students can view weeks, assignments, and resources for the semester they are in. They can submit submission links to the assignments, view their scores once graded, and submit attendance words to mark attendance.

## Here's how we divided the labor
- **Aivant** worked on getting us all started, creating the initial models and really thinking hard about the relationships between everything. He also set up devise, which is super cool, and worked with authentication.
- **Emily** worked on the curriculum view (weeks, resources) and the assignments view (assignments, submissions, grading).
- **Franco** worked on attendance and the all-controlling roster view.
- **Jemma** worked on creating a cohesive front end and styling.
