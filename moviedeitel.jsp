<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.Date, java.text.SimpleDateFormat, java.util.Calendar"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Movie Details</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    :root {
      --primary: #6a11cb;
      --secondary: #2575fc;
      --accent: #ff6b6b;
      --success: #1dd1a1;
      --warning: #feca57;
      --info: #48dbfb;
      --light: #f8f9fa;
      --dark: #212529;
      --gradient: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
      --card-shadow: 0 10px 30px rgba(0,0,0,0.1);
    }

    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      margin: 0;
      padding: 0;
      background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
      color: var(--dark);
      min-height: 100vh;
    }

    .container {
      max-width: 1200px;
      margin: 30px auto;
      padding: 0 20px;
    }

    .movie-header {
      display: flex;
      gap: 30px;
      align-items: flex-start;
      background: #fff;
      padding: 25px;
      border-radius: 16px;
      box-shadow: var(--card-shadow);
      position: relative;
      overflow: hidden;
    }
    
    .movie-header::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 5px;
      background: var(--gradient);
    }

    .movie-poster {
      position: relative;
      overflow: hidden;
      border-radius: 12px;
      box-shadow: 0 10px 20px rgba(0,0,0,0.2);
      transition: transform 0.3s ease;
    }
    
    .movie-poster:hover {
      transform: scale(1.03);
    }

    .movie-poster img {
      width: 220px;
      height: 320px;
      object-fit: cover;
      display: block;
    }

    .movie-info h1 {
      margin: 0 0 10px 0;
      font-size: 2.5rem;
      font-weight: 700;
      background: var(--gradient);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
    }
    
    .details {
      margin-top: 15px;
      color: #555;
      line-height: 1.6;
      font-size: 1.1rem;
    }

    .movie-meta {
      display: flex;
      gap: 15px;
      margin-top: 15px;
      flex-wrap: wrap;
    }
    
    .meta-tag {
      background: var(--gradient);
      color: white;
      padding: 5px 12px;
      border-radius: 20px;
      font-size: 0.9rem;
      font-weight: 600;
    }

    /* Trailer Button Styles */
    .trailer-btn {
      background: linear-gradient(135deg, #ff6b6b 0%, #ff8e8e 100%);
      color: white;
      border: none;
      padding: 10px 20px;
      border-radius: 8px;
      font-weight: 600;
      cursor: pointer;
      display: flex;
      align-items: center;
      gap: 8px;
      transition: all 0.3s ease;
      box-shadow: 0 4px 6px rgba(255, 107, 107, 0.3);
      margin-top: 15px;
    }
    
    .trailer-btn:hover {
      transform: translateY(-2px);
      box-shadow: 0 6px 10px rgba(255, 107, 107, 0.4);
    }

    /* Modal Styles */
    .modal-content {
      border-radius: 16px;
      overflow: hidden;
      border: none;
      box-shadow: 0 20px 40px rgba(0,0,0,0.2);
    }
    
    .modal-header {
      background: var(--gradient);
      color: white;
      border-bottom: none;
      padding: 15px 20px;
    }
    
    .modal-title {
      font-weight: 700;
    }
    
    .btn-close {
      filter: invert(1);
    }
    
    .modal-body {
      padding: 0;
      background: #000;
    }
    
    .video-container {
      position: relative;
      width: 100%;
      height: 0;
      padding-bottom: 56.25%; /* 16:9 aspect ratio */
    }
    
    .video-container iframe {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      border: none;
    }

    .cinema {
      background: #fff;
      padding: 25px;
      border-radius: 16px;
      margin-top: 25px;
      box-shadow: var(--card-shadow);
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      border-left: 5px solid var(--primary);
    }
    
    .cinema:hover {
      transform: translateY(-5px);
      box-shadow: 0 15px 35px rgba(0,0,0,0.15);
    }

    .cinema-top {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 15px;
    }
    
    .cinema-name {
      font-size: 1.4rem;
      font-weight: 700;
      color: var(--primary);
    }
    
    .cinema-distance {
      font-size: 1rem;
      color: #777;
      background: #f1f3f4;
      padding: 5px 10px;
      border-radius: 20px;
    }

    .p1{
      color: #6c757d;
      font-weight: 500;
    }
    
    .buttondiv {
      background: var(--gradient);
      display: flex;
      gap: 15px;
      padding: 15px 25px;
      align-items: center;
      flex-wrap: wrap;
      border-radius: 12px;
      margin: 25px 0;
      box-shadow: var(--card-shadow);
    }
    
    .buttondiv button {
      padding: 8px 16px;
      border: none;
      background-color: rgba(255,255,255,0.9);
      border-radius: 8px;
      cursor: pointer;
      font-weight: 600;
      transition: all 0.3s ease;
      box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    }
    
    .buttondiv button:hover {
      transform: translateY(-2px);
      box-shadow: 0 6px 10px rgba(0,0,0,0.15);
    }

    .btn-d {
      background-color: var(--primary);
      color: white;
    }

    /* Date selection styles */
    .date-container {
      display: flex;
      gap: 12px;
      margin: 20px 0;
      overflow-x: auto;
      padding: 10px 5px;
    }
    
    .date-item {
      min-width: 90px;
      text-align: center;
      padding: 12px 8px;
      border-radius: 12px;
      cursor: pointer;
      background-color: #fff;
      border: 2px solid #e9ecef;
      transition: all 0.3s ease;
      box-shadow: 0 4px 6px rgba(0,0,0,0.05);
    }
    
    .date-item:hover {
      border-color: var(--primary);
      transform: translateY(-3px);
    }
    
    .date-item.active {
      background: var(--gradient);
      color: white;
      border-color: var(--primary);
      box-shadow: 0 6px 12px rgba(106, 17, 203, 0.3);
    }
    
    .date-day {
      font-size: 16px;
      font-weight: bold;
    }
    
    .date-date {
      font-size: 14px;
    }

    /* Showtimes */
    .showtimes {
      display: flex;
      gap: 15px;
      flex-wrap: wrap;
      margin-top: 15px;
    }

    /* time box */
    .time {
      position: relative;
      display: inline-block;
      padding: 10px 18px;
      border: 2px solid var(--success);
      border-radius: 8px;
      cursor: pointer;
      background: #fff;
      text-align: center;
      font-weight: 600;
      transition: all 0.3s ease;
      box-shadow: 0 4px 6px rgba(0,0,0,0.05);
    }
    
    .time:hover {
      background: var(--success);
      color: white;
      transform: translateY(-3px);
      box-shadow: 0 6px 12px rgba(29, 209, 161, 0.3);
    }

    /* popup container hidden by default */
    .popup {
      display: none;
      position: absolute;
      top: -140px;
      left: 50%;
      transform: translateX(-50%);
      background-color: #fff;
      border-radius: 10px;
      padding: 15px;
      box-shadow: 0 10px 25px rgba(0,0,0,0.15);
      z-index: 10;
      width: auto;
      flex-direction: row;
      gap: 15px;
      border: 1px solid #e9ecef;
    }

    /* each price block */
    .popup .block {
      text-align: center;
      min-width: 110px;
      padding: 8px 0;
    }

    .popup .price {
      font-weight: bold;
      font-size: 16px;
      color: var(--primary);
    }

    .popup .label {
      font-size: 13px;
      color: #6c757d;
      margin: 5px 0;
    }

    .popup .status {
      font-size: 12px;
      color: var(--success);
      font-weight: 600;
    }

    /* small arrow under popup */
    .popup::after {
      content: "";
      position: absolute;
      bottom: -10px;
      left: 50%;
      transform: translateX(-50%);
      border-left: 10px solid transparent;
      border-right: 10px solid transparent;
      border-top: 10px solid #fff;
    }

    /* show popup on hover */
    .time:hover .popup {
      display: flex;
    }
    
    .a1{
      text-decoration: none;
      color: inherit;
      display: block;
    }
    
    .date-container a {
      text-decoration: none;
      color: inherit;
    }
    
    .date-container a:hover {
      opacity: 0.9;
    }
    
    .form-select {
      border-radius: 8px;
      border: 2px solid #e9ecef;
      padding: 8px 12px;
      font-weight: 500;
      transition: all 0.3s ease;
    }
    
    .form-select:focus {
      border-color: var(--primary);
      box-shadow: 0 0 0 0.2rem rgba(106, 17, 203, 0.25);
    }
    
    /* No theatres message */
    .no-theatres {
      text-align: center;
      padding: 40px 20px;
      background: white;
      border-radius: 16px;
      box-shadow: var(--card-shadow);
      margin: 20px 0;
    }
    
    .no-theatres i {
      font-size: 3rem;
      color: #6c757d;
      margin-bottom: 15px;
    }
    
    .no-theatres p {
      font-size: 1.2rem;
      color: #6c757d;
      margin: 0;
    }
    
    /* Responsive adjustments */
    @media (max-width: 768px) {
      .movie-header {
        flex-direction: column;
        text-align: center;
      }
      
      .movie-poster {
        align-self: center;
      }
      
      .buttondiv {
        justify-content: center;
      }
      
      .cinema {
        margin-left: 0;
        margin-right: 0;
      }
      
      .movie-info h1 {
        font-size: 2rem;
      }
    }
  </style>
</head>
<body>
  <div class="container">
<%
  String movieId = request.getParameter("movieId");
  String selectedCity = request.getParameter("city");
  String selectedDate = request.getParameter("date");
  
  // Generate dates for the next 7 days
  SimpleDateFormat sdfDay = new SimpleDateFormat("E");
  SimpleDateFormat sdfDate = new SimpleDateFormat("dd MMM");
  Calendar cal = Calendar.getInstance();
  
  if(movieId != null) {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","root");

    PreparedStatement pst = con.prepareStatement("SELECT * FROM movies WHERE movie_Id=?");
    pst.setInt(1, Integer.parseInt(movieId));
    ResultSet rs = pst.executeQuery();

    if(rs.next()) {
      String title = rs.getString("title");
      String desc = rs.getString("description");
      String poster = rs.getString("poster_url");
      String Lang=rs.getString("movie_langauge");
      String Time=rs.getString("time");
    
      
      String trailerUrl = rs.getString("trailer_url");
      if (trailerUrl == null || trailerUrl.isEmpty()) {
          trailerUrl = "https://www.youtube.com/embed/dQw4w9WgXcQ";
      } else if (trailerUrl.contains("watch?v=")) {
        
          trailerUrl = trailerUrl.replace("watch?v=", "embed/");
      }

      
      session.setAttribute("title", title);
      session.setAttribute("movie_langauge", Lang);
      session.setAttribute("time", Time);
      
%>

  
    <div class="movie-header">
      <div class="movie-poster">
        <img src="<%=poster%>" alt="<%=title%>">
      </div>
      <div class="movie-info">
        <h1><%=title%></h1>
        <div class="details"><%=desc%></div>
        <div class="movie-meta">
          <span class="meta-tag"><i class="fas fa-language me-1"></i><%=Lang %></span>
          <span class="meta-tag"><i class="fas fa-clock me-1"></i><%=Time %></span>
        </div>
        
       
        <button type="button" class="trailer-btn" data-bs-toggle="modal" data-bs-target="#trailerModal">
          <i class="fas fa-play-circle"></i> Watch Trailer
        </button>
      </div>
    </div>
    
   
    <div class="modal fade" id="trailerModal" tabindex="-1" aria-labelledby="trailerModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="trailerModalLabel"><%=title%> - Official Trailer</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <div class="video-container">
              <iframe 
  src="<%=trailerUrl%>?rel=0&modestbranding=1" 
  title="<%=title%> Trailer"
  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
  referrerpolicy="no-referrer-when-downgrade" 
  allowfullscreen>
</iframe>


            </div>
          </div>
        </div>
      </div>
    </div>
    
    <div class="buttondiv">
      <div><button><i class="fas fa-film me-2"></i><%=Lang %></button></div>

      <form method="get" style="margin:0;">
        <input type="hidden" name="movieId" value="<%=movieId%>">
        <select class="form-select" name="city" onchange="this.form.submit()">
          <option value="">-- Select City --</option>
          <option value="Amravati" <%=("Amravati".equals(selectedCity)?"selected":"")%>>Amravati</option>
          <option value="Akola" <%=("Akola".equals(selectedCity)?"selected":"")%>>Akola</option>
          <option value="Pune" <%=("Pune".equals(selectedCity)?"selected":"")%>>Pune</option>
          <option value="Nagpur" <%=("Nagpur".equals(selectedCity)?"selected":"")%>>Nagpur</option>
          <option value="Nashik" <%=("Nashik".equals(selectedCity)?"selected":"")%>>Nashik</option>
          <option value="Mumbai" <%=("Mumbai".equals(selectedCity)?"selected":"")%>>Mumbai</option>
        </select>
      </form>
      <div><button><i class="fas fa-vr-cardboard me-2"></i>2D</button></div>
      <div><button><i class="fas fa-cube me-2"></i>3D</button></div>
    </div>
    
    
<%
if (selectedCity != null && !selectedCity.isEmpty()) {
%>
<div class="date-container">
  <%
    // Reset calendar to today
    cal.setTime(new Date());
    
    for (int i = 0; i < 7; i++) {
      String day = sdfDay.format(cal.getTime());
      String dateStr = sdfDate.format(cal.getTime());
      String dateValue = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());

      boolean isActive = (selectedDate != null && selectedDate.equals(dateValue)) || 
                         (selectedDate == null && i == 0);
  %>
  <a 
    href="?movieId=<%=movieId%>&city=<%=selectedCity%>&date=<%=dateValue%>" 
    class="date-item <%=isActive ? "active" : ""%>"
    style="text-decoration:none; display:inline-block;">
    <div class="date-day"><%=day%></div>
    <div class="date-date"><%=dateStr%></div>
  </a>
  <%
      cal.add(Calendar.DATE, 1); 
    }
  %>
</div>                                 
<%
}
%>

<%
    PreparedStatement pst2;
    if (selectedCity != null && !selectedCity.isEmpty()) {
        pst2 = con.prepareStatement("SELECT * FROM showtimes WHERE movie_id=? AND city=?");
        pst2.setInt(1, Integer.parseInt(movieId));
        pst2.setString(2, selectedCity);
    } else {
        pst2 = con.prepareStatement("SELECT * FROM showtimes WHERE movie_id=?");
        pst2.setInt(1, Integer.parseInt(movieId));
    }
    ResultSet rs2 = pst2.executeQuery();
    if(!rs2.isBeforeFirst()) {
%>
      <div class="no-theatres">
        <i class="fas fa-film"></i>
        <p>No theatres found for this movie in the selected city.</p>
      </div>
<%
    }
    while(rs2.next()) {
      String cinemaName = rs2.getString("cinema_name");
      String distance = rs2.getString("distance");
      
      String[] times = {
              rs2.getString("time1"),
              rs2.getString("time2"),
              rs2.getString("time3"),
              rs2.getString("time4")
          };

      String Prime =rs2.getString("price_prime");
      String ClassicPlus =rs2.getString("price_classic_plus");
      String Classic =rs2.getString("price_classic");
      
      session.setAttribute("cinema_name",cinemaName);
      session.setAttribute("price_prime", Prime);
      session.setAttribute("price_classic_plus", ClassicPlus);
      session.setAttribute("price_classic", Classic);
     
%>

  
<div class="cinema">
  <div class="cinema-top">
    <div class="cinema-name"><i class="fas fa-building me-2"></i><%=cinemaName%></div>
    <div class="cinema-distance"><i class="fas fa-map-marker-alt me-1"></i><%=distance%> away</div>
  </div>

   <div class="showtimes">
    <%
      
      for (String t : times) {
        if (t != null && !t.trim().isEmpty()) {
     
          String dateParam = "";
          if (selectedDate != null) {
            dateParam = "&date=" + selectedDate;
          } else {
           
            String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
            dateParam = "&date=" + today;
          }
    %>
        <div class="time">
         <a href="movieSeat.jsp?prime=<%=Prime%>&classicplus=<%=ClassicPlus%>&classic=<%=Classic%>&time=<%=t%><%=dateParam%>" class="a1">
         <i class="far fa-clock me-1"></i><%=t%>
             </a>
          <div class="popup">
            <div class="block">
              <div class="price">₹<%=Prime!=null?Prime:"-"%></div>
              <div class="label">Prime</div>
              <div class="status"><i class="fas fa-check-circle me-1"></i>Available</div>
            </div>
            <div class="block">
              <div class="price">₹<%=ClassicPlus!=null?ClassicPlus:"-"%></div>
              <div class="label">Classic Plus</div>
              <div class="status"><i class="fas fa-check-circle me-1"></i>Available</div>
            </div>
            <div class="block">
              <div class="price">₹<%=Classic!=null?Classic:"-"%></div>
              <div class="label">Classic</div>
              <div class="status"><i class="fas fa-check-circle me-1"></i>Available</div>
            </div>
          </div>
        </div>
    <%
        }
      } 
    %>
  </div>
</div>

<%
    }
      con.close();
    }
  } 
%>
  

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>