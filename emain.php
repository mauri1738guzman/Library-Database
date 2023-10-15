<?php
session_start();

if ($_SESSION["UserType"] !== "employee" || empty($_SESSION["EmployeeID"])) {
    header("Location: main.php");
    exit;
}


// Check connection
$mysqli = require __DIR__ . "/database.php";

// Get employee information
$sql = "SELECT E.Fname, E.Lname, E.Email, L.LibraryName  AS LibraryName FROM Employee E JOIN Library L ON E.LibraryID = L.LibraryID WHERE E.EmployeeID = " . $_SESSION["EmployeeID"];
$result = $mysqli->query($sql);

if ($result->num_rows > 0) {
    // Output employee information
    $row = $result->fetch_assoc();
    $fname = $row["Fname"];
    $lname = $row["Lname"];
    $email = $row["Email"];
    $libraryName = $row["LibraryName"];
} else {
    echo "Error: Employee not found.";
}

$mysqli->close();
?>

<!DOCTYPE html>
<html>
<head>
    <title>Employee Main</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/water.css@2/out/water.css">
</head>
<body>
    <div>
        <h2>Employee Information</h2>
        <p><strong>Email:</strong> <?=$email?></p>
        <p><strong>First Name:</strong> <?=$fname?></p>
        <p><strong>Last Name:</strong> <?=$lname?></p>
        <p><strong>Work at:</strong> <?=$libraryName?></p>
    </div>
    <form action="search.php" method="POST">
  <div>
    <label for="search-field">Search by:</label>
    <select id="search-field" name="search-field">
      <option value="name">Name</option>
      <option value="isbn">ISBN</option>
      <option value="creator">Creator</option>
    </select>
  </div>
  <div>
    <input type="text" id="search" name="search">
  </div>
  <button type="submit">Search</button>
</form>
    <div>
        <h2>Employee Tasks</h2>
        <div class="button-list">
        <form method="get" action="add_item.php">
            <button type="submit" class="button">Add New Item</button>
        </form>

        <!-- <form method="get" action="modify_item.php">
            <button type="submit" class="button">Modify Item</button>
        </form> -->

        <form method="get" action="order.php">
            <button type="submit" class="button">Order</button>
        </form>
        <form method="get" action="report.php">
            <button type="submit" class="button">Report</button>
        </form>
    </div>
    </div>
    <div>
        <form method="post" action="logout.php">
            <button class="water-btn" type="submit">Sign out</button>
        </form>
    </div>
</body>
</html>


