# Movie Ticket Booking System

A web-based application that allows users to browse movies, select showtimes, choose seats, and book tickets online. Administrators can efficiently manage movies, shows, and bookings. The system automates ticket management, making it convenient for both users and theater staff.

---

## Features

### User Features
- **Browse movies and show timings**
- **Select seats and book tickets**
- **Cancel booked tickets**
- **View booking history**

### Admin Features
- **Manage movies and showtimes**
- **Monitor seat availability**
- **View all bookings and cancellations**
- **Generate ticket sales reports**

---

## Why the Project is Useful

- **Convenience:** Book tickets anytime, anywhere.
- **Time-Saving:** Avoid long queues and select seats easily.
- **Efficient Management:** Admins can manage shows and monitor bookings effectively.
- **Error Reduction:** Reduces mistakes compared to manual ticket booking.

---

## Technologies Used

- **Frontend:** HTML, CSS, JavaScript, JSP
- **Backend:** Java Servlets
- **Database:** MySQL
- **Server:** Apache Tomcat

---

## Database Design

Key tables in the MySQL database:

| Table      | Description                          |
|------------|--------------------------------------|
| `users`    | Stores user information              |
| `movies`   | Stores movie details                 |
| `showtimes`| Stores show timings                  |
| `tickets`  | Stores booked tickets and status     |
| `seats`    | Stores seat availability             |

---

## Getting Started

### 1. Clone the Repository

```sh
git clone https://github.com/arpitazagade1/MovieTicketBooking.git
```

### 2. Set Up MySQL Database

- Create a database (e.g., `movie_booking`)
- Import `movie_booking.sql` to create tables and sample data

### 3. Configure Database Connection

- Open `dbConfig.java` (or similar)
- Update database URL, username, and password

### 4. Deploy on Tomcat

- Copy the project folder to Tomcat’s `webapps` directory
- Start the Tomcat server

### 5. Access the Application

Open a browser and go to:  
`http://localhost:8080/Movieticketbooking`

Register/login as a user to book tickets, or log in as admin to manage movies and bookings.

---

## Screenshots

- **Home Page:**
  <img width="1920" height="917" alt="image" src="https://github.com/user-attachments/assets/5455c899-3666-4ffa-b18a-0730ffd6626d" />


- **Movie Selection:**
  <img width="1920" height="913" alt="image" src="https://github.com/user-attachments/assets/0a1f4733-0860-442a-80c9-9b1de6bc4eab" />

- **Seat Booking:**
  <img width="1920" height="1763" alt="image" src="https://github.com/user-attachments/assets/3ba8ece1-4f82-4ef2-98bd-55c6ced61e42" />

- **Admin Panel:**
  <img width="1920" height="920" alt="image" src="https://github.com/user-attachments/assets/f4925b71-4266-4149-8a3e-927b2547dd1f" />


*Replace these links with your actual screenshots stored in the `screenshots` folder.*

---

## Future Enhancements

- Online payment gateway integration
- Mobile-friendly responsive design
- Advanced seat selection and dynamic pricing

---

