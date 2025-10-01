

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CineMagic - Movie Ticket Booking</title>
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
</head>
<body>
    <header>
    <div class="container nav-container">
        <div class="logo">
            <i class="fas fa-film"></i>
            <span>CineMagic</span>
        </div>

        <button class="hamburger" id="hamburger">
            <i class="fas fa-bars"></i>
        </button>

        <ul class="nav-links" id="navLinks">
            <li><a href="#"><i class="fas fa-home"></i> Home</a></li>
            <li><a href="comingmovie.jsp"><i class="fas fa-ticket-alt"></i> Movies</a></li>
            <li><a href="Theater.jsp"><i class="fas fa-theater-masks"></i> Theaters</a></li>
            <li><a href="#"><i class="fas fa-phone"></i> Contact</a></li>

            <li><a href="Adminlogin.jsp"><i class="fas fa-user-shield"></i> Admin</a></li>

          
            <li><a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
        </ul>

        <div class="auth-buttons">
            <a class="btn btn-login" href="Login.jsp"><i class="fas fa-sign-in-alt"></i> Login</a>
            <a class="btn btn-signup" href="Registation.jsp"><i class="fas fa-user-plus"></i> Sign Up</a>
        </div>
    </div>
</header>


    <!-- Search Bar -->
    <div class="container">
        <div class="search-container">
            <div >
            <form method="get" action="" class="search-box"> 
                <input type="text" name="q" class="search-input" placeholder="Search for movies, actors, or directors...">
                <button class="search-btn" type="submit"><i class="fas fa-search"></i> Search</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Movie Showcase -->
    <div class="container">
        <div class="movie-showcase">
            <div class="showcase-slide active" style="background-image: url('https://images.unsplash.com/photo-1635805737707-575885ab0820?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80')">
                <div class="showcase-content">
                    <h2 class="showcase-title">Spider-Man: No Way Home</h2>
                    <div class="showcase-info">
                        <span class="showcase-rating"><i class="fas fa-star"></i> 4.8/5</span>
                        <span>Action/Adventure</span>
                        <span>2h 28m</span>
                        <span>PG-13</span>
                    </div>
                    <p class="showcase-desc">With Spider-Man's identity now revealed, Peter asks Doctor Strange for help. When a spell goes wrong, dangerous foes from other worlds start to appear, forcing Peter to discover what it truly means to be Spider-Man.</p>
                    <div class="showcase-buttons">
                        <button class="showcase-btn btn-trailer"><i class="fas fa-play-circle"></i> Watch Trailer</button>
                        <button class="showcase-btn btn-book"><i class="fas fa-ticket-alt"></i> Book Tickets</button>
                    </div>
                </div>
            </div>
            
            <div class="showcase-slide" style="background-image: url('https://images.unsplash.com/photo-1594909122845-11baa439b7bf?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80')">
                <div class="showcase-content">
                    <h2 class="showcase-title">Dune: Part Two</h2>
                    <div class="showcase-info">
                        <span class="showcase-rating"><i class="fas fa-star"></i> 4.9/5</span>
                        <span>Sci-Fi/Adventure</span>
                        <span>2h 46m</span>
                        <span>PG-13</span>
                    </div>
                    <p class="showcase-desc">Paul Atreides unites with Chani and the Fremen while seeking revenge against the conspirators who destroyed his family. Facing a choice between the love of his life and the fate of the known universe, he must prevent a terrible future only he can foresee.</p>
                    <div class="showcase-buttons">
                        <button class="showcase-btn btn-trailer"><i class="fas fa-play-circle"></i> Watch Trailer</button>
                        <button class="showcase-btn btn-book"><i class="fas fa-ticket-alt"></i> Book Tickets</button>
                    </div>
                </div>
            </div>
            
            <div class="showcase-slide" style="background-image: url('https://images.unsplash.com/photo-1536440136628-849c177e76a1?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80')">
                <div class="showcase-content">
                    <h2 class="showcase-title">The Batman</h2>
                    <div class="showcase-info">
                        <span class="showcase-rating"><i class="fas fa-star"></i> 4.7/5</span>
                        <span>Action/Crime</span>
                        <span>2h 56m</span>
                        <span>PG-13</span>
                    </div>
                    <p class="showcase-desc">When a sadistic serial killer begins murdering key political figures in Gotham, Batman is forced to investigate the city's hidden corruption and question his family's involvement.</p>
                    <div class="showcase-buttons">
                        <button class="showcase-btn btn-trailer"><i class="fas fa-play-circle"></i> Watch Trailer</button>
                        <button class="showcase-btn btn-book"><i class="fas fa-ticket-alt"></i> Book Tickets</button>
                    </div>
                </div>
            </div>
            
            <div class="showcase-indicators">
                <div class="indicator active" data-slide="0"></div>
                <div class="indicator" data-slide="1"></div>
                <div class="indicator" data-slide="2"></div>
            </div>
        </div>
    </div>
    

<section class="container">
    <h2 class="section-title">Now Showing</h2>
    <div class="movies-container">
        <%
        HttpSession ses = request.getSession(false);
        boolean loggedIn = (session != null && session.getAttribute("Email") != null);

       
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo", "root", "root");

        String q = request.getParameter("q");
        PreparedStatement ps;

        if (q != null && !q.trim().isEmpty()) {
            ps = con.prepareStatement("SELECT * FROM movies WHERE title LIKE ? OR description LIKE ?");
            ps.setString(1, "%" + q + "%");
            ps.setString(2, "%" + q + "%");
        } else {
            ps = con.prepareStatement("SELECT * FROM movies");
        }

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            int id = rs.getInt("movie_Id");
            String title = rs.getString("title");
            String desc = rs.getString("description");
            String poster = rs.getString("poster_url");
            String Lang = rs.getString("movie_langauge");
            String Time = rs.getString("time");

            String bookUrl;
            if(session != null && session.getAttribute("userId") != null){
                bookUrl = "moviedeitel.jsp?movieId=" + id;
            } else {
                bookUrl = "Login.jsp?redirectMovieId=" + id;
            }
        %>
            <div class="movie-card">
                <div class="movie-poster">
                    <img src="<%=poster%>" alt="<%=title%>">
                </div>
                <div class="movie-info">
                    <h3 class="movie-title"><%=title%></h3>
                    <div class="movie-details">
                        <span><%=desc%></span>
                        <span class="rating"><i class="fas fa-star"></i> 4.8</span>
                    </div>
                    <div class="movie-details">
                        <span><%=Time%></span>
                        <span><%=Lang%></span>
                    </div>
                    <a href="<%=bookUrl%>" class="book-btn">Book Now</a>
                </div>
            </div>
        <%
        } 
        con.close();
        %>

    </div>
</section>

    <footer>
        <div class="container">
            <div class="footer-content">
                <div class="footer-column">
                    <h3>About CineMagic</h3>
                    <p>Your ultimate destination for booking movie tickets online. Discover, book, and enjoy the latest movies in premium theaters.</p>
                    <div class="social-icons">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-youtube"></i></a>
                    </div>
                </div>

                <div class="footer-column">
                    <h3>Quick Links</h3>
                    <ul>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Contact Us</a></li>
                        <li><a href="#">My Account</a></li>
                        <li><a href="#">Movie News</a></li>
                        <li><a href="#">FAQs</a></li>
                    </ul>
                </div>

                <div class="footer-column">
                    <h3>Top Cities</h3>
                    <ul>
                        <li><a href="#">Pune</a></li>
                        <li><a href="#">Mumbai</a></li>
                        <li><a href="#">Amravati</a></li>
                        <li><a href="#">Nagpur</a></li>
                        <li><a href="#">Akola</a></li>
                        
                    </ul>
                </div>

                <div class="footer-column">
                    <h3>Newsletter</h3>
                    <p>Subscribe for updates on new movies and exclusive offers.</p>
                    <form>
                        <input type="email" placeholder="Your Email" style="padding:10px; width:100%; margin-bottom:10px; border-radius:50px; border:none;">
                        <button type="submit" class="btn btn-signup" style="width:100%">Subscribe</button>
                    </form>
                </div>
            </div>

            <div class="copyright">
                <p>&copy; 2023 CineMagic. All rights reserved.</p>
            </div>
        </div>
    </footer>

    <script>
      
        const hamburger = document.getElementById('hamburger');
        const navLinks = document.getElementById('navLinks');

        hamburger.addEventListener('click', () => {
            navLinks.classList.toggle('active');
            
            // Change icon based on menu state
            if (navLinks.classList.contains('active')) {
                hamburger.innerHTML = '<i class="fas fa-times"></i>';
            } else {
                hamburger.innerHTML = '<i class="fas fa-bars"></i>';
            }
        });
     
        document.addEventListener('click', (e) => {
            if (!hamburger.contains(e.target) && !navLinks.contains(e.target) && navLinks.classList.contains('active')) {
                navLinks.classList.remove('active');
                hamburger.innerHTML = '<i class="fas fa-bars"></i>';
            }
        });

       
        const slides = document.querySelectorAll('.showcase-slide');
        const indicators = document.querySelectorAll('.indicator');
        let currentSlide = 0;

        function showSlide(index) {
            // Hide all slides
            slides.forEach(slide => slide.classList.remove('active'));
            indicators.forEach(indicator => indicator.classList.remove('active'));
            
         
            slides[index].classList.add('active');
            indicators[index].classList.add('active');
            currentSlide = index;
        }

      
        indicators.forEach((indicator, index) => {
            indicator.addEventListener('click', () => {
                showSlide(index);
            });
        });

      
        setInterval(() => {
            currentSlide = (currentSlide + 1) % slides.length;
            showSlide(currentSlide);
        }, 5000);

     
        const movieCards = document.querySelectorAll('.movie-card');
        
        function checkScroll() {
            movieCards.forEach(card => {
                const cardPosition = card.getBoundingClientRect().top;
                const screenPosition = window.innerHeight / 1.3;
                
                if (cardPosition < screenPosition) {
                    card.style.animation = 'fadeIn 0.5s ease-in forwards';
                }
            });
        }
        
      
        checkScroll();
        
      
        window.addEventListener('scroll', checkScroll);
    </script>
</body>
</html>