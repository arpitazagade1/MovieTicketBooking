<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String email = (String) session.getAttribute("email");
    String name = (String) session.getAttribute("name");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(120deg, #89f7fe 0%, #66a6ff 100%);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .modal-content {
            background: #ffffff;
            border-radius: 18px;
            border: none;
            box-shadow: 0 8px 25px rgba(0,0,0,0.2);
            animation: popIn 0.8s ease;
        }

        .modal-header {
            border: none;
            justify-content: center;
            background: linear-gradient(to right, #667eea, #764ba2);
            color: white;
            border-top-left-radius: 18px;
            border-top-right-radius: 18px;
        }

        .modal-title {
            font-weight: bold;
            font-size: 1.6rem;
        }

        .modal-body {
            padding: 2rem;
            color: #333;
        }

        .profile-pic {
            width: 95px;
            height: 95px;
            border-radius: 50%;
            margin-bottom: 15px;
            border: 3px solid #fff;
            box-shadow: 0px 4px 12px rgba(0,0,0,0.3);
            object-fit: cover;
        }

        .welcome-text {
            font-size: 1.2rem;
            font-weight: 600;
            margin-bottom: 8px;
        }

        .email-text {
            font-size: 0.95rem;
            color: #555;
            margin-bottom: 15px;
        }

        .btn-custom {
            background: linear-gradient(to right, #ff758c, #ff7eb3);
            border: none;
            color: white;
            border-radius: 30px;
            padding: 10px 22px;
            font-weight: 500;
            transition: 0.3s;
        }

        .btn-custom:hover {
            transform: scale(1.07);
            box-shadow: 0px 6px 18px rgba(0,0,0,0.3);
        }

        @keyframes popIn {
            from { transform: scale(0.8); opacity: 0; }
            to { transform: scale(1); opacity: 1; }
        }
    </style>
</head>
<body>

<!-- Modal -->
<div class="modal fade show" id="welcomePopup" tabindex="-1" aria-hidden="true" style="display:block;">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content text-center">
      <div class="modal-header">
        <h5 class="modal-title">🎉 Welcome to the Portal</h5>
      </div>
      <div class="modal-body">
        <!-- Profile pic -->
        <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" class="profile-pic" alt="Profile">
        <p class="welcome-text">Hello, <%= name %> 👋</p>
        <p class="email-text"><strong>Email:</strong> <%= email %></p>
        <a href="" class="btn btn-custom mt-2">Go to Admin Panel 🚀</a>
      </div>
    </div>
  </div>
</div>

</body>
</html>