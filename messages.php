<?php

if(session_status() == PHP_SESSION_NONE){
session_start();
}

// Check if the user clicked the "sign out" button
if (!isset($_SESSION["MemberID"]) && !isset($_SESSION["EmployeeID"])) {
  header("Location: login.php");
  exit();
}

$isEmployee = isset($_SESSION["EmployeeID"]);
?>
<!DOCTYPE html>
<html>
<head>
    <title>MainBoard</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/water.css@2/out/water.css">
    <script src="https://unpkg.com/just-validate@latest/dist/just-validate.production.min.js" defer></script>
    <script src="/js/validation.js" defer></script>
</head>
<body>

    <h1>Hello <?php echo $_SESSION["Fname"]; ?></h1>

    <div>
    <?php
    if ($isEmployee) {
        echo '<a href="emain.php"><button>Employee Main Board</button></a>';
    }
    ?>
</div>
    <a href="add_to_cart.php" style="background-color: #007bff; color: white; padding: 10px 20px; border-radius: 5px; text-decoration: none;">Cart</a>
    <a href="myorders.php" style="background-color: #007bff; color: white; padding: 10px 20px; border-radius: 5px; text-decoration: none; margin-left: 10px;">My Orders</a>
    <a href="updateinfo.php" style="background-color: #007bff; color: white; padding: 10px 20px; border-radius: 5px; text-decoration: none; margin-left: 10px;">Change Information</a>
    <a href="messages.php" style="background-color: #007bff; color: white; padding: 10px 20px; border-radius: 5px; text-decoration: none;margin-left:10px">Messages</a>
    <a href="logout.php"><button>Sign Out</button></a>
    <form action="search.php" method="POST">
 
<h2>Messages</h2>

    <?php
      $mysqli = require __DIR__ . "/database.php";
      // Connect to database
$mysqli = require __DIR__ . "/database.php";

// Query to get total number of notifications
$stmt = $mysqli->prepare("SELECT COUNT(*) FROM notification WHERE memberID = ?");

// Bind the member ID parameter to the prepared statement
$current_user_id = $_SESSION["MemberID"];
$stmt->bind_param("i", $current_user_id);

// Execute the prepared statement
$stmt->execute();

// Get the total number of notifications
$stmt->bind_result($totalMessages);
$stmt->fetch();

$stmt->close();

// Check if there are any notifications
if ($totalMessages > 0) {
    // Select notifications for current user
    $sql = "SELECT * FROM notification WHERE memberID = $current_user_id";
    $result = $mysqli->query($sql);

    // Output notifications as HTML table
    echo "<table>";
    echo "<thead><tr><th>Notification ID</th><th>Message</th><th>Date Created</th></tr></thead>";
    echo "<tbody>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["notificationid"] . "</td><td>" . $row["message"] . "</td> <td>" . $row["created_date"] . "</td></tr>";
    }
    echo "</tbody>";
    echo "</table>";
} else {
    // Output message if there are no notifications
    echo "No notifications found.";
}
?>
  </tbody>
</table>

</body>
</html>
