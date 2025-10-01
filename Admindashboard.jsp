<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Ticket Booking Admin Dashboard</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
    :root {
        --primary-color: #4361ee;
        --primary-light: #eef2ff;
        --secondary-color: #3a0ca3;
        --accent-color: #4cc9f0;
        --success-color: #4ade80;
        --warning-color: #f59e0b;
        --danger-color: #ef4444;
        --text-dark: #1f2937;
        --text-light: #6b7280;
        --bg-light: #f8fafc;
        --card-bg: #ffffff;
        --border-color: #e5e7eb;
        --sidebar-bg: #1e293b;
        --sidebar-text: #f1f5f9;
        --sidebar-hover: #334155;
        --shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
        --shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
        --shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
        --radius: 8px;
        --radius-lg: 12px;
    }
    
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    
    body {
        font-family: 'Inter', sans-serif;
        background-color: var(--bg-light);
        color: var(--text-dark);
        display: flex;
        min-height: 100vh;
        line-height: 1.5;
    }
    
    /* Sidebar Styles */
    .sidebar {
        width: 260px;
        background-color: var(--sidebar-bg);
        color: var(--sidebar-text);
        padding: 24px 0;
        display: flex;
        flex-direction: column;
        transition: all 0.3s ease;
        box-shadow: var(--shadow-lg);
        z-index: 100;
    }
    
    .sidebar-header {
        padding: 0 24px 24px;
        border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        margin-bottom: 16px;
    }
    
    .sidebar-header h2 {
        font-size: 1.5rem;
        font-weight: 700;
        color: white;
        display: flex;
        align-items: center;
        gap: 12px;
    }
    
    .sidebar-header h2 i {
        color: var(--accent-color);
    }
    
    .sidebar nav {
        flex: 1;
        display: flex;
        flex-direction: column;
        gap: 4px;
        padding: 0 16px;
    }
    
    .sidebar nav a {
        display: flex;
        align-items: center;
        padding: 12px 16px;
        color: var(--sidebar-text);
        text-decoration: none;
        border-radius: var(--radius);
        transition: all 0.2s ease;
        font-weight: 500;
    }
    
    .sidebar nav a i {
        margin-right: 12px;
        font-size: 1.1rem;
        width: 20px;
        text-align: center;
    }
    
    .sidebar nav a:hover {
        background-color: var(--sidebar-hover);
        color: white;
    }
    
    .sidebar nav a.active {
        background-color: var(--primary-color);
        color: white;
        box-shadow: var(--shadow);
    }
    
    /* Main Content Styles */
    .main-content {
        flex: 1;
        padding: 24px;
        overflow-y: auto;
    }
    
    .header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 32px;
    }
    
    .header h1 {
        font-size: 1.875rem;
        font-weight: 700;
        color: var(--text-dark);
    }
    
    .user-info {
        display: flex;
        align-items: center;
        gap: 12px;
    }
    
    .user-avatar {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        background-color: var(--primary-color);
        color: white;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: 600;
    }
    
    /* Stats Grid */
    .stats-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
        gap: 24px;
        margin-bottom: 32px;
    }
    
    .stat-card {
        background-color: var(--card-bg);
        padding: 24px;
        border-radius: var(--radius-lg);
        box-shadow: var(--shadow);
        display: flex;
        align-items: center;
        gap: 16px;
        transition: transform 0.2s ease, box-shadow 0.2s ease;
    }
    
    .stat-card:hover {
        transform: translateY(-2px);
        box-shadow: var(--shadow-lg);
    }
    
    .stat-icon {
        width: 60px;
        height: 60px;
        border-radius: var(--radius);
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.5rem;
        color: white;
    }
    
    .stat-icon.revenue { background: linear-gradient(135deg, var(--primary-color), var(--secondary-color)); }
    .stat-icon.tickets { background: linear-gradient(135deg, var(--success-color), #10b981); }
    .stat-icon.movies { background: linear-gradient(135deg, var(--accent-color), #06b6d4); }
    .stat-icon.bookings { background: linear-gradient(135deg, var(--warning-color), #d97706); }
    
    .stat-content {
        flex: 1;
    }
    
    .stat-value {
        font-size: 1.875rem;
        font-weight: 700;
        color: var(--text-dark);
        margin-bottom: 4px;
    }
    
    .stat-label {
        font-size: 0.875rem;
        color: var(--text-light);
        font-weight: 500;
    }
    
    /* Table Container */
    .table-container {
        background-color: var(--card-bg);
        border-radius: var(--radius-lg);
        box-shadow: var(--shadow);
        overflow: hidden;
    }
    
    .table-header {
        padding: 24px;
        border-bottom: 1px solid var(--border-color);
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    
    .table-header h3 {
        font-size: 1.25rem;
        font-weight: 600;
        color: var(--text-dark);
    }
    
    .table-actions {
        display: flex;
        gap: 12px;
    }
    
    .btn {
        padding: 8px 16px;
        border-radius: var(--radius);
        border: none;
        font-weight: 500;
        cursor: pointer;
        display: flex;
        align-items: center;
        gap: 6px;
        transition: all 0.2s ease;
        font-size: 0.875rem;
    }
    
    .btn-primary {
        background-color: var(--primary-color);
        color: white;
    }
    
    .btn-outline {
        background-color: transparent;
        border: 1px solid var(--border-color);
        color: var(--text-dark);
    }
    
    .btn:hover {
        transform: translateY(-1px);
        box-shadow: var(--shadow);
    }
    
    .btn-primary:hover {
        background-color: var(--secondary-color);
    }
    
    .btn-outline:hover {
        background-color: var(--bg-light);
    }
    
    table {
        width: 100%;
        border-collapse: collapse;
    }
    
    thead {
        background-color: var(--bg-light);
    }
    
    th {
        text-align: left;
        padding: 16px 24px;
        font-weight: 600;
        color: var(--text-light);
        font-size: 0.875rem;
        text-transform: uppercase;
        letter-spacing: 0.05em;
        border-bottom: 1px solid var(--border-color);
    }
    
    td {
        padding: 16px 24px;
        border-bottom: 1px solid var(--border-color);
    }
    
    tbody tr {
        transition: background-color 0.2s ease;
    }
    
    tbody tr:hover {
        background-color: var(--primary-light);
    }
    
    .status {
        padding: 6px 12px;
        border-radius: 20px;
        font-size: 0.75rem;
        font-weight: 600;
        display: inline-block;
        text-align: center;
        min-width: 80px;
    }
    
    .status.sold-out { background-color: #fee2e2; color: var(--danger-color); }
    .status.active { background-color: #d1fae5; color: #065f46; }
    .status.upcoming { background-color: #dbeafe; color: var(--primary-color); }
    .status.cancelled { background-color: #fee2e2; color: var(--danger-color); }
    .status.booked { background-color: #d1fae5; color: #065f46; }
    
    /* Responsive Design */
    @media (max-width: 1024px) {
        .sidebar {
            width: 80px;
            padding: 16px 0;
        }
        
        .sidebar-header h2 span,
        .sidebar nav a span {
            display: none;
        }
        
        .sidebar nav a {
            justify-content: center;
            padding: 16px;
        }
        
        .sidebar nav a i {
            margin-right: 0;
            font-size: 1.25rem;
        }
    }
    
    @media (max-width: 768px) {
        body {
            flex-direction: column;
        }
        
        .sidebar {
            width: 100%;
            height: auto;
            padding: 16px;
        }
        
        .sidebar nav {
            flex-direction: row;
            overflow-x: auto;
            padding: 0;
        }
        
        .sidebar nav a {
            flex-shrink: 0;
        }
        
        .stats-grid {
            grid-template-columns: 1fr;
        }
        
        .table-header {
            flex-direction: column;
            gap: 16px;
            align-items: flex-start;
        }
        
        .table-actions {
            width: 100%;
            justify-content: flex-end;
        }
        
        table {
            display: block;
            overflow-x: auto;
        }
    }
</style>
</head>
<body>

    <div class="sidebar">
        <div class="sidebar-header">
            <h2><i class="fas fa-tachometer-alt"></i> <span>Admin Panel</span></h2>
        </div>
        <nav>
            <a href="#" class="active"><i class="fas fa-tachometer-alt"></i> <span>Dashboard</span></a>
            <a href="AdminMovie.jsp"><i class="fas fa-film"></i> <span>Movies</span></a>
            <a href="AdminTheater.jsp"><i class="fas fa-theater-masks"></i> <span>Theater</span></a>
            <a href="Adminpayment.jsp"><i class="fas fa-credit-card"></i> <span>Payment</span></a>
            <a href="userInformation.jsp"><i class="fas fa-users"></i> <span>Users</span></a>
            <a href="admincomingmovie.jsp"><i class="fas fa-calendar-plus"></i> <span>Coming Soon</span></a>
                       <a href="Adminticket.jsp"><i class="fas fa-film"></i> <span>Cancel Ticket</span></a>
        </nav>
    </div>

    <div class="main-content">
        <div class="header">
            <h1>Dashboard Overview</h1>
            <div class="user-info">
                <div class="user-avatar">AD</div>
                <span>Admin User</span>
            </div>
        </div>
        
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-icon revenue">
                    <i class="fas fa-rupee-sign"></i>
                </div>
                <div class="stat-content">
                    <div class="stat-value">₹15,450</div>
                    <div class="stat-label">Total Revenue</div>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon tickets">
                    <i class="fas fa-ticket-alt"></i>
                </div>
                <div class="stat-content">
                    <div class="stat-value">985</div>
                    <div class="stat-label">Tickets Sold</div>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon movies">
                    <i class="fas fa-film"></i>
                </div>
                <div class="stat-content">
                    <div class="stat-value">12</div>
                    <div class="stat-label">Active Movies</div>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon bookings">
                    <i class="fas fa-calendar-check"></i>
                </div>
                <div class="stat-content">
                    <div class="stat-value">45</div>
                    <div class="stat-label">Total Bookings</div>
                </div>
            </div>
        </div>

        <div class="table-container">
            <div class="table-header">
                <h3>Recent Bookings</h3>
                <div class="table-actions">
                    <button class="btn btn-outline">
                        <i class="fas fa-filter"></i> Filter
                    </button>
                    <button class="btn btn-primary">
                        <i class="fas fa-download"></i> Export
                    </button>
                </div>
            </div>
            <table>
                <thead>
                    <tr>
                        <th>Booking ID</th>
                        <th>Customer</th>
                        <th>Movie</th>
                        <th>Theater</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Seats</th>
                        <th>Total Price</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    Connection con = null;
                    PreparedStatement ps = null;
                    ResultSet rs = null;
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","root");
                        ps = con.prepareStatement("SELECT * FROM tickets");
                        rs = ps.executeQuery();
                        while(rs.next()) {
                            String status = rs.getString("status");
                            String statusClass = "";
                            if("Cancelled".equalsIgnoreCase(status)) {
                                statusClass = "cancelled";
                            } else if("Booked".equalsIgnoreCase(status)) {
                                statusClass = "booked";
                            }
                %>
                    <tr>
                        <td><%= rs.getInt("id") %></td>
                        <td><%= rs.getString("name") %></td>
                        <td><%= rs.getString("movie_title") %></td>
                        <td><%= rs.getString("cinema_name") %></td>
                        <td><%= rs.getString("show_date") %></td>
                        <td><%= rs.getString("show_time") %></td>
                        <td><%= rs.getString("seats") %></td>
                        <td><%= rs.getString("total_price") %></td>
                        <td><span class="status <%= statusClass %>"><%= status %></span></td>
                    </tr>
                <%
                        }
                    } catch(Exception e) {
                        out.println("<tr><td colspan='9'>Error: " + e.getMessage() + "</td></tr>");
                    } finally {
                        if(rs != null) try { rs.close(); } catch(Exception e) {}
                        if(ps != null) try { ps.close(); } catch(Exception e) {}
                        if(con != null) try { con.close(); } catch(Exception e) {}
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>