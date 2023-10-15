<?php
session_start();

// Redirect to login page if user is not logged in
if (!isset($_SESSION["MemberID"])) {
  header("Location: login.php");
  exit();
}

// Check if cart is empty
if (!isset($_SESSION["cart"]) || count($_SESSION["cart"]) == 0) {
  echo "Your cart is empty.";
  exit();
}

// Insert checkout into database
$mysqli = require __DIR__ . "/database.php";

$member_id = $_SESSION["MemberID"];
$member_type_id = $_SESSION["MemberTypeID"];
$sql = "SELECT * FROM membertype WHERE MemberTypeID = $member_type_id";
$result = $mysqli->query($sql);
if ($result->num_rows === 1) {
    // Member type found, fetch data
    $row = $result->fetch_assoc();
    $max_borrowing_days = $row["MaxBorrowingDays"];
}
date_default_timezone_set('America/Chicago');
$start_date = date('Y-m-d H:i:s'); // Current datetime in 'Y-m-d H:i:s' format
$end_date = date('Y-m-d 23:59:59', strtotime("+$max_borrowing_days days", strtotime($start_date))); // End date = start date + max borrowing days, set time to end of day (23:59:59)
$employee_id = NULL; // Assuming employee is not needed anymore

$insertSql = "INSERT INTO checkout (MemberID, CopyID, StartDate, EndDate) 
              VALUES (?, ?, ?, ?)";
$insertStmt = $mysqli->prepare($insertSql);

$updateSql = "UPDATE copy SET Status = '1' WHERE CopyID = ?";
$updateStmt = $mysqli->prepare($updateSql);

foreach ($_SESSION["cart"] as $copy_id) {
  $insertStmt->bind_param("iiss", $member_id, $copy_id, $start_date, $end_date);
  $insertStmt->execute();

  $updateStmt->bind_param("i", $copy_id);
  $updateStmt->execute();
}

// Clear cart
$_SESSION["cart"] = array();

// Redirect to main page
header("Location: main.php");
exit();
?>
