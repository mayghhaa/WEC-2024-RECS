# Club Recruitment Platform

This platform streamlines the recruitment process for student clubs at NITK, allowing clubs to manage registrations, recruitment rounds, and announcements efficiently. Students can register for multiple clubs, view recruitment announcements, and track their progress throughout the process.

## Table of Contents
- [Features](#features)
- [Videos](#Videos)
- [Installation](#installation)



## Features

### 1. **Club Registration**
   - Club convenors can register their clubs on the platform.
   - Add necessary details like club name, description, and recruitment details.
     

### 2. **Student Announcements**
   - Students can view a list of registered clubs.
   - Announcements regarding recruitment schedules are displayed, including event dates and important updates.

### 3. **Recruitment Details**
   - Clubs can input detailed recruitment schedules.
   - Links to online tests, interview schedules, and tasks can be added.
   
### 4. **Student Registration**
   - Students can register for multiple clubs’ recruitment processes.
   - Each student can apply to Special Interest Groups (SIGs) within a club (if applicable).

### 5. **Recruitment Rounds**
   - Clubs can manage and track students across multiple recruitment rounds.
   - Clubs can specify the number of rounds and update the status of students (e.g., pending, rejected, accepted).
   - Bulk updates of student status for each round.

### 6. **Final Announcements**
   - Clubs can announce the final selected candidates after the recruitment process.
   - Results can be exported as an Excel or PDF file for convenience.

## Videos
### 1. Convener can add club, and details
https://www.youtube.com/embed/CljUcr56hys

### Students can view list of clubs
https://www.youtube.com/embed/SL8eUf1yjIg

### Announcements
https://www.youtube.com/embed/XwDpqAJTo14

### Conveners can add recruitment schedule
https://www.youtube.com/embed/Y-9dm0wdF0I

###  Students can apply to multiple clubs, sigs. Conveners can view, manage registrations and status.
https://www.youtube.com/embed/M3dce5rb46s

### Final results declared, in pdf form.
https://www.youtube.com/embed/9mvibTFd8pc


## Installation

### Prerequisites
- Ruby `2.7+`
- Rails `6+`
- PostgreSQL (or any other database supported by Rails)
- Node.js & Yarn (for managing frontend dependencies)

### Setup Instructions
```
git clone https://github.com/mayghhaa/WEC-2024-RECS.git
cd  WEC-2024-RECS

bundle install
rails db:migrate
rails db:seed

rails server
```
