const seatData = {
  premium: [
    ['1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16'],
    ['1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16'],
    ['1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16'],
    ['1','2','3','4','5','6','7','8','9','10','11','12','13']
  ],
  executive: [
    ['1','2','3','4','5','6','7','8','9','10','11','12','13'],
    ['1','2','3','4','5','6','7','8','9','10','11','12','13'],
    ['1','2','3','4','5','6','7','8','9','10','11','12','13']
  ],
  normal: [
    ['1','2','3','4','5','6','7','8','9','10','11','12']
  ]
};

const soldSeats = {
  premium: ['4-5','4-6','1-7','2-8'],
  executive: ['1-1','1-2','1-3'],
  normal: ['1-6','1-7']
};

const bestsellerSeats = {
  premium: ['1-7','2-8','3-8'],
  executive: ['1-1','1-2','1-3','1-4','1-5','1-6','1-7','1-8','1-9'],
  normal: ['1-8']
};

const disabledSeats = {
  premium: ['2-3','3-5'],
  executive: ['2-2'],
  normal: ['1-4']
};

const seatPrices = {
	premium: parseInt('<%= prime1 != null ? prime1 : "300" %>') || 300,
	    executive: parseInt('<%= classicplus1 != null ? classicplus1 : "200" %>') || 200,
	    normal: parseInt('<%= classic1 != null ? classic1 : "150" %>') || 150

};
let selectedSeats = [];

// Row labels A, B, C...
function getRowLabel(index) {
  return String.fromCharCode(65 + index);
}

// Update booking summary
function updateBookingSummary() {
  const selectedSeatsElement = document.getElementById('selected-seats');
  const totalPriceElement = document.getElementById('total-price');
  const bookButton = document.getElementById('book-btn');
  
  if (selectedSeats.length > 0) {
    const seatLabels = selectedSeats.map(seat => {
      const rowLabel = getRowLabel(seat.rowIndex);
      return `${rowLabel}${seat.seatNumber}`;
    });
    
    selectedSeatsElement.textContent = seatLabels.join(', ');
    const total = selectedSeats.reduce((sum, seat) => sum + seat.price, 0);
    totalPriceElement.textContent = total;
    bookButton.disabled = false;
  } else {
    selectedSeatsElement.textContent = 'None';
    totalPriceElement.textContent = '0';
    bookButton.disabled = true;
  }
}

// Generate seats
function createSeats(sectionId, rows) {
  const container = document.getElementById(sectionId);
  const price = seatPrices[sectionId];

  rows.forEach((row, rowIndex) => {
    const rowDiv = document.createElement('div');
    rowDiv.className = 'seat-row';

    const label = document.createElement('div');
    label.className = 'row-label';
    label.innerText = getRowLabel(rowIndex);
    rowDiv.appendChild(label);

    const seatInner = document.createElement('div');
    seatInner.className = 'seat-row-inner';

    row.forEach((seat) => {
      const seatDiv = document.createElement('div');
      seatDiv.innerText = seat;
      const seatId = `${rowIndex+1}-${seat}`;
      
      if(soldSeats[sectionId].includes(seatId)) {
        seatDiv.className = 'seat sold';
      } 
	  else if(disabledSeats[sectionId]?.includes(seatId)) {
        seatDiv.className = 'seat disabled';
      } else if(bestsellerSeats[sectionId].includes(seatId)) {
        seatDiv.className = 'seat bestseller';
      } else {
        seatDiv.className = 'seat available';
      }

      seatDiv.addEventListener('click', () => {
        if(!seatDiv.classList.contains('sold') && !seatDiv.classList.contains('disabled')) {
          seatDiv.classList.toggle('selected');
          
          const seatIdentifier = `${sectionId}-${rowIndex+1}-${seat}`;
          
          if(seatDiv.classList.contains('selected')) {
            selectedSeats.push({
              section: sectionId,
              rowIndex: rowIndex,
              seatNumber: seat,
              price: price,
              identifier: seatIdentifier
            });
          } else {
            selectedSeats = selectedSeats.filter(s => s.identifier !== seatIdentifier);
          }
          
          updateBookingSummary();
        }
      });

      seatInner.appendChild(seatDiv);
    });

    rowDiv.appendChild(seatInner);
    container.appendChild(rowDiv);
  });
}

// Initialize
createSeats('premium', seatData.premium);
createSeats('executive', seatData.executive);
createSeats('normal', seatData.normal);

// Reset button
document.getElementById('reset-btn').addEventListener('click', function() {
  document.querySelectorAll('.seat.selected').forEach(seat => {
    seat.classList.remove('selected');
  });
  selectedSeats = [];
  updateBookingSummary();
});

// Proceed to Booking - save session
document.getElementById('book-btn').addEventListener('click', function () {
  if (selectedSeats.length > 0) {
    // Build seat labels like A1,B1,C5…
    const seatIdentifiers = selectedSeats.map(seat => {
      const rowLabel = getRowLabel(seat.rowIndex);
      return `${rowLabel}${seat.seatNumber}`;
    }).join(',');

    const total = selectedSeats.reduce((sum, seat) => sum + seat.price, 0);

    document.getElementById('form-selected-seats').value = seatIdentifiers;
    document.getElementById('form-total-price').value = total;

    document.getElementById('booking-form').submit(); // send to setBookingSession.jsp
  }
});



