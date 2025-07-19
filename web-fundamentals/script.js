// Form handling
document.getElementById("demo-form").addEventListener("submit", function (e) {
  e.preventDefault();

  // Get form values
  const username = document.getElementById("username").value;
  const email = document.getElementById("email").value;

  // Add to table
  addUserToTable(username, email);

  // Reset form
  this.reset();
});

// Table functionality
function addUserToTable(name, email) {
  const tableBody = document.getElementById("table-body");
  const rowCount = tableBody.children.length;

  const row = document.createElement("tr");
  row.innerHTML = `
        <td>${rowCount + 1}</td>
        <td>${name}</td>
        <td>${email}</td>
        <td>
            <button onclick="deleteRow(this)" class="delete-btn">Delete</button>
        </td>
    `;

  tableBody.appendChild(row);
}

function deleteRow(button) {
  const row = button.parentElement.parentElement;
  row.remove();
  updateTableIds();
}

function updateTableIds() {
  const rows = document.getElementById("table-body").getElementsByTagName("tr");
  for (let i = 0; i < rows.length; i++) {
    rows[i].cells[0].textContent = i + 1;
  }
}

// Toggle message functionality
document.getElementById("toggle-btn").addEventListener("click", function () {
  const message = document.getElementById("hidden-message");
  message.classList.toggle("hidden");
});

// Counter functionality
let count = 0;
const counterDisplay = document.getElementById("counter");

document.getElementById("increment").addEventListener("click", function () {
  count++;
  counterDisplay.textContent = count;
});

document.getElementById("decrement").addEventListener("click", function () {
  count--;
  counterDisplay.textContent = count;
});

// Add some initial data to the table
window.addEventListener("load", function () {
  addUserToTable("John Doe", "john@example.com");
  addUserToTable("Jane Smith", "jane@example.com");
});
