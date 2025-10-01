<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Theater Selection</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
             background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        
        .container {
            width: 100%;
            max-width: 1200px;
        }
        
        .page-title {
            color: white;
            text-align: center;
            margin: 20px 0 30px;
            font-size: 2.5rem;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }
        
        .page-title i {
            color: #fdbb2d;
            margin-right: 15px;
        }
        
        /* Theater Filters */
        .theater-filters {
            display: flex;
            gap: 15px;
            margin-bottom: 30px;
            flex-wrap: wrap;
            justify-content: center;
        }
        
        .filter-btn {
            padding: 10px 20px;
            background-color: rgba(255, 255, 255, 0.9);
            border: none;
            border-radius: 30px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-weight: 600;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        
        .filter-btn.active, .filter-btn:hover {
            background-color: #1a2a6c;
            color: white;
            transform: translateY(-2px);
        }
        
        /* Theater Cards */
        .theater-cards {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 25px;
        }
        
        .theater-card {
            background-color: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            display: flex;
            flex-direction: column;
        }
        
        .theater-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 25px rgba(0, 0, 0, 0.2);
        }
        
        .theater-image {
            height: 180px;
            overflow: hidden;
            position: relative;
        }
        
        .theater-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }
        
        .theater-card:hover .theater-image img {
            transform: scale(1.05);
        }
        
        .theater-badge {
            position: absolute;
            top: 15px;
            right: 15px;
            background-color: #fdbb2d;
            color: #1a2a6c;
            padding: 5px 10px;
            border-radius: 4px;
            font-weight: 600;
            font-size: 0.8rem;
        }
        
        .theater-info {
            padding: 20px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
        }
        
        .theater-info h3 {
            font-size: 1.4rem;
            margin-bottom: 8px;
            color: #1a2a6c;
        }
        
        .theater-location {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            color: #666;
        }
        
        .theater-location i {
            margin-right: 8px;
            color: #fdbb2d;
        }
        
        .theater-features {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
            margin-bottom: 20px;
        }
        
        .feature {
            background-color: #f0f5ff;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 0.8rem;
            color: #1a2a6c;
            border: 1px solid #d0d9ff;
        }
        
        .theater-card-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: auto;
        }
        
        .theater-rating {
            display: flex;
            align-items: center;
            background-color: #1a2a6c;
            color: white;
            padding: 6px 12px;
            border-radius: 20px;
        }
        
        .theater-rating i {
            color: #fdbb2d;
            margin-right: 5px;
        }
        
        .book-btn {
            background: linear-gradient(to right, #fdbb2d, #ff8c00);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 8px rgba(253, 187, 45, 0.3);
        }
        
        .book-btn:hover {
            background: linear-gradient(to right, #ff8c00, #fdbb2d);
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(253, 187, 45, 0.4);
        }
        
        /* Responsive Design */
        @media (max-width: 768px) {
            .theater-cards {
                grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            }
            
            .page-title {
                font-size: 2rem;
            }
        }
        
        @media (max-width: 480px) {
            .theater-cards {
                grid-template-columns: 1fr;
            }
            
            .theater-filters {
                justify-content: flex-start;
                overflow-x: auto;
                padding-bottom: 10px;
            }
        }
    </style>
</head>
<body>



    <div class="container">
        <h1 class="page-title"><i class="fas fa-theater-masks"></i>Available Theaters</h1>
        
        <!-- Theater Filters -->
        <div class="theater-filters">
            <button class="filter-btn active">All Theaters</button>
            <button class="filter-btn">IMAX</button>
            <button class="filter-btn">3D</button>
            <button class="filter-btn">4DX</button>
            <button class="filter-btn">Luxury</button>
            <button class="filter-btn">Drive-In</button>
        </div>
        
        <!-- Theater Cards -->
        <div class="theater-cards">
            <!-- Theater Card 1 -->
            <div class="theater-card">
                <div class="theater-image">
                    <img src="https://images.unsplash.com/photo-1574267432553-4b4628081c31?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="Grand Cinema">
                    <div class="theater-badge">Popular</div>
                </div>
                <div class="theater-info">
                    <h3>Grand Cinema</h3>
                    <div class="theater-location">
                        <i class="fas fa-map-marker-alt"></i>
                        <span>Downtown District, City Center</span>
                    </div>
                    <div class="theater-features">
                        <span class="feature">IMAX</span>
                        <span class="feature">3D</span>
                        <span class="feature">Dolby Atmos</span>
                        <span class="feature">Recliners</span>
                    </div>
                    <div class="theater-card-footer">
                        <div class="theater-rating">
                            <i class="fas fa-star"></i>
                            <span>4.7/5</span>
                        </div>
                        <button class="book-btn">Book Now</button>
                    </div>
                </div>
            </div>
            
            <!-- Theater Card 2 -->
            <div class="theater-card">
                <div class="theater-image">
                    <img src="https://images.unsplash.com/photo-1489599809519-e0a0ae2fbfd7?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="Starlight Multiplex">
                    <div class="theater-badge">4DX</div>
                </div>
                <div class="theater-info">
                    <h3>Starlight Multiplex</h3>
                    <div class="theater-location">
                        <i class="fas fa-map-marker-alt"></i>
                        <span>Westside Mall, Suburban Area</span>
                    </div>
                    <div class="theater-features">
                        <span class="feature">4DX</span>
                        <span class="feature">3D</span>
                        <span class="feature">Food Court</span>
                        <span class="feature">Arcade</span>
                    </div>
                    <div class="theater-card-footer">
                        <div class="theater-rating">
                            <i class="fas fa-star"></i>
                            <span>4.5/5</span>
                        </div>
                        <button class="book-btn">Book Now</button>
                    </div>
                </div>
            </div>
            
            <!-- Theater Card 3 -->
            <div class="theater-card">
                <div class="theater-image">
                    <img src="https://images.unsplash.com/photo-1536440136628-849c177e76a1?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="Royal Theater">
                    <div class="theater-badge">Luxury</div>
                </div>
                <div class="theater-info">
                    <h3>Royal Theater</h3>
                    <div class="theater-location">
                        <i class="fas fa-map-marker-alt"></i>
                        <span>Historic District, Old Town</span>
                    </div>
                    <div class="theater-features">
                        <span class="feature">Luxury</span>
                        <span class="feature">Recliner Seats</span>
                        <span class="feature">Gourmet Food</span>
                        <span class="feature">Bar</span>
                    </div>
                    <div class="theater-card-footer">
                        <div class="theater-rating">
                            <i class="fas fa-star"></i>
                            <span>4.9/5</span>
                        </div>
                        <button class="book-btn">Book Now</button>
                    </div>
                </div>
            </div>
            
            <!-- Theater Card 4 -->
            <div class="theater-card">
                <div class="theater-image">
                    <img src="https://images.unsplash.com/photo-1595769810453-2a7d2d5a73d1?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="Cinema Paradiso">
                    <div class="theater-badge">Indie</div>
                </div>
                <div class="theater-info">
                    <h3>Cinema Paradiso</h3>
                    <div class="theater-location">
                        <i class="fas fa-map-marker-alt"></i>
                        <span>Arts District, Riverside</span>
                    </div>
                    <div class="theater-features">
                        <span class="feature">Indie Films</span>
                        <span class="feature">Classic Movies</span>
                        <span class="feature">Cafe</span>
                        <span class="feature">Art Gallery</span>
                    </div>
                    <div class="theater-card-footer">
                        <div class="theater-rating">
                            <i class="fas fa-star"></i>
                            <span>4.6/5</span>
                        </div>
                        <button class="book-btn">Book Now</button>
                    </div>
                </div>
            </div>
            
            <!-- Theater Card 5 -->
            <div class="theater-card">
                <div class="theater-image">
                    <img src="https://images.unsplash.com/photo-1585647347384-2591bc45346f?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="MegaPlex Drive-In">
                    <div class="theater-badge">Drive-In</div>
                </div>
                <div class="theater-info">
                    <h3>MegaPlex Drive-In</h3>
                    <div class="theater-location">
                        <i class="fas fa-map-marker-alt"></i>
                        <span>Highway 7, Outskirts</span>
                    </div>
                    <div class="theater-features">
                        <span class="feature">Drive-In</span>
                        <span class="feature">Double Features</span>
                        <span class="feature">Snack Bar</span>
                        <span class="feature">FM Sound</span>
                    </div>
                    <div class="theater-card-footer">
                        <div class="theater-rating">
                            <i class="fas fa-star"></i>
                            <span>4.4/5</span>
                        </div>
                        <button class="book-btn">Book Now</button>
                    </div>
                </div>
            </div>
            
            <!-- Theater Card 6 -->
            <div class="theater-card">
                <div class="theater-image">
                    <img src="https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="IMAX Experience">
                    <div class="theater-badge">Premium</div>
                </div>
                <div class="theater-info">
                    <h3>IMAX Experience</h3>
                    <div class="theater-location">
                        <i class="fas fa-map-marker-alt"></i>
                        <span>Tech Park, Innovation District</span>
                    </div>
                    <div class="theater-features">
                        <span class="feature">IMAX</span>
                        <span class="feature">Laser Projection</span>
                        <span class="feature">12-Channel Sound</span>
                        <span class="feature">VIP Lounge</span>
                    </div>
                    <div class="theater-card-footer">
                        <div class="theater-rating">
                            <i class="fas fa-star"></i>
                            <span>4.8/5</span>
                        </div>
                        <button class="book-btn">Book Now</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Filter button functionality
        document.addEventListener('DOMContentLoaded', function() {
            const filterButtons = document.querySelectorAll('.filter-btn');
            const theaterCards = document.querySelectorAll('.theater-card');
            
            filterButtons.forEach(button => {
                button.addEventListener('click', function() {
                    // Remove active class from all buttons
                    filterButtons.forEach(btn => btn.classList.remove('active'));
                    // Add active class to clicked button
                    this.classList.add('active');
                    
                    const filterValue = this.textContent.toLowerCase();
                    
                    // Filter theater cards
                    theaterCards.forEach(card => {
                        if (filterValue === 'all theaters') {
                            card.style.display = 'flex';
                        } else {
                            const features = card.querySelector('.theater-features').textContent.toLowerCase();
                            if (features.includes(filterValue)) {
                                card.style.display = 'flex';
                            } else {
                                card.style.display = 'none';
                            }
                        }
                    });
                });
            });
            
            // Book button functionality
            const bookButtons = document.querySelectorAll('.book-btn');
            bookButtons.forEach(button => {
                button.addEventListener('click', function() {
                    const theaterName = this.closest('.theater-card').querySelector('h3').textContent;
                    alert(`Booking tickets at: ${theaterName}`);
                });
            });
        });
    </script>
</body>
</html>