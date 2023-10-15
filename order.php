<?php
session_start();

if ($_SESSION["UserType"] !== "employee" || empty($_SESSION["EmployeeID"])) {
    header("Location: main.php");
    exit;
}

$mysqli = require __DIR__ . "/database.php";

$sql = "SELECT checkout.CheckoutID, member.Fname, member.Lname, checkout.StartDate, checkout.EndDate, checkout.ReturnDate, checkout.Status 
        FROM checkout
        INNER JOIN member ON checkout.MemberID = member.MemberID
        INNER JOIN copy ON checkout.CopyID = copy.CopyID
        ORDER BY checkout.Status ASC";
$result = $mysqli->query($sql);

if (isset($_POST["handling"])) {
    // Update checkout status to 1 if the current status is not 2 (Returned)
    $checkoutID = $_POST["checkoutID"];
    $statusSql = "SELECT Status FROM checkout WHERE CheckoutID = ?";
    $stmt = $mysqli->prepare($statusSql);
    $stmt->bind_param("i", $checkoutID);
    $stmt->execute();
    $stmt->bind_result($status);
    $stmt->fetch();
    $stmt->close();

    if ($status == 2) {
        echo "Cannot change status from Returned to Handling.";
    } else {
        $updateSql = "UPDATE checkout SET Status = ? WHERE CheckoutID = ?";
        $stmt = $mysqli->prepare($updateSql);
        $status = 1;
        $stmt->bind_param("ii", $status, $checkoutID);
        if ($stmt->execute()) {
            echo "Checkout status updated.";
        } else {
            echo "Error updating checkout status: " . $mysqli->error;
        }
        $stmt->close();
        header("Refresh:0");
    }
}

if (isset($_POST["returned"])) {
    // Update checkout status to 2
    $checkoutID = $_POST["checkoutID"];
    $updateSql = "UPDATE checkout SET Status = ?, ReturnDate = NOW() WHERE CheckoutID = ?";
    $stmt = $mysqli->prepare($updateSql);
    $status = 2;
    $stmt->bind_param("ii", $status, $checkoutID);
    if ($stmt->execute()) {
        echo "Checkout status updated.";
    } else {
        echo "Error updating checkout status: " . $mysqli->error;
    }
    $stmt->close();
    
    // Update copy status to 0
    $copyIDSql = "SELECT CopyID FROM checkout WHERE CheckoutID = ?";
    $stmt = $mysqli->prepare($copyIDSql);
    $stmt->bind_param("i", $checkoutID);
    $stmt->execute();
    $stmt->bind_result($copyID);
    $stmt->fetch();
    $stmt->close();

    $updateCopySql = "UPDATE copy SET Status = 0 WHERE CopyID = ?";
    $stmt = $mysqli->prepare($updateCopySql);
    $stmt->bind_param("i", $copyID);
    if ($stmt->execute()) {
        echo "Copy status updated.";
    } else {
        echo "Error updating copy status: " . $mysqli->error;
    }
    $stmt->close();
    
    // Check if there are reservations for the copy
    $reservationSql = "SELECT ReservationID, MemberID FROM reservation WHERE CopyID = ? AND Status = 0 ORDER BY ReservationID ASC";
    $stmt = $mysqli->prepare($reservationSql);
    $stmt->bind_param("i", $copyID);
    $stmt->execute();
    $result = $stmt->get_result();
    $row_count = mysqli_num_rows($result);
    $stmt->close();
    
    // If there are reservations, create checkout for the first reservation
    if ($row_count > 0) {
        $reservation = $result->fetch_assoc();
        $reservationID = $reservation["ReservationID"];
        $userID = $reservation["MemberID"];
        
        // Get checkout duration
        $durationSql = "SELECT m.MaxBorrowingDays FROM MemberType m JOIN member ON member.MemberTypeID = m.MemberTypeID WHERE member.MemberID = ?";
        $stmt = $mysqli->prepare($durationSql);
        $stmt->bind_param("i", $userID);
        $stmt->execute();
        $stmt->bind_result($checkoutDuration);
        $stmt->fetch();
        $stmt->close();
        
        // Get current date
        $startDate = date("Y-m-d");
        
        // Calculate end date
        $endDate = date("Y-m-d", strtotime($startDate . " + " . $checkoutDuration . " days"));
        
        // Insert checkout record
        $insertSql = "INSERT INTO checkout (MemberID, CopyID, StartDate, EndDate, Status) VALUES (?, ?, ?, ?, 0)";
        $stmt = $mysqli->prepare($insertSql);
        $stmt->bind_param("iiss", $userID, $copyID, $startDate, $endDate);
        if ($stmt->execute()) {
            echo "Checkout created for user " . $userID . ".";
        } else {
            echo "Error creating checkout: " . $mysqli->error;
        }
        $stmt->close();
        
        // Update reservation status
        $updateReservationSql = "UPDATE reservation SET Status = 1 WHERE ReservationID = ?";
        $stmt = $mysqli->prepare($updateReservationSql);
        $stmt->bind_param("i", $reservationID);
        if ($stmt->execute()) {
            echo "Reservation status updated.";
        } else {
            echo "Error updating reservation status: " . $mysqli->error;
        }
        $stmt->close();
    }
    
    header("Refresh:0");
}

?>

<!DOCTYPE html>
<html>
<head>
    <title>Handling</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/water.css@2/out/water.css">
</head>
<div>
    <a href="emain.php"><button>Home</button></a>
    <a href="logout.php"><button>Sign Out</button></a>
</div>
<body>
    <div>
    <h2>Checkout List</h2>
        <table>
            <thead>
                <tr>
                    <th>Checkout ID</th>
                    <th>Member First Name</th>
                    <th>Member Last Name</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Return Date</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = $result->fetch_assoc()): ?>
                <tr>
                    <td><?php echo $row["CheckoutID"]; ?></td>
                    <td><?php echo $row["Fname"]; ?></td>
                    <td><?php echo $row["Lname"]; ?></td>
                    <td><?php echo $row["StartDate"]; ?></td>
                    <td><?php echo $row["EndDate"]; ?></td>
                    <td><?php echo $row["ReturnDate"]; ?></td>
                    <td>
                    <?php
                        switch ($row["Status"]) {
                            case 0:
                                echo "Ordered";
                                break;
                            case 1:
                                echo "Handling";
                                break;
                            case 2:
                                echo "Returned";
                                break;
                            case 3:
                                echo "Lost";
                                break;
                            default:
                                echo "Unknown";
                        }
                    ?>
                </td>
                </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
<?php 
     if (isset($_POST["search"])) {
         $checkoutID = $_POST["checkoutID"];
         $searchSql = "SELECT checkout.CheckoutID, member.Fname, member.Lname, checkout.StartDate, checkout.EndDate, checkout.ReturnDate, checkout.Status 
                         FROM checkout
                         INNER JOIN member ON checkout.MemberID = member.MemberID
                         INNER JOIN copy ON checkout.CopyID = copy.CopyID
                         WHERE checkout.CheckoutID = ?";
         $stmt = $mysqli->prepare($searchSql);
         $stmt->bind_param("i", $checkoutID);
         $stmt->execute();
         $result = $stmt->get_result();
         if ($result->num_rows === 0) {
             echo "Checkout not found.";
         } else {
             $row = $result->fetch_assoc();
             ?>
<h2>Checkout Information</h2>
<table>
<thead>
<tr>
<th>Checkout ID</th>
<th>Member First Name</th>
<th>Member Last Name</th>
<th>Start Date</th>
<th>End Date</th>
<th>Return Date</th>
<th>Status</th>
</tr>
</thead>
<tbody>
<tr>
<td><?php echo $row["CheckoutID"]; ?></td>
<td><?php echo $row["Fname"]; ?></td>
<td><?php echo $row["Lname"]; ?></td>
<td><?php echo $row["StartDate"]; ?></td>
<td><?php echo $row["EndDate"]; ?></td>
<td><?php echo $row["ReturnDate"]; ?></td>
<td><?php echo $row["Status"]; ?></td>
</tr>
</tbody>
</table>
<?php
         }
         $stmt->close();
     }
     ?>
<h2>Handle Checkout</h2>
<form method="post" action="">
<label for="checkoutID">Checkout ID:</label>
<input type="number" id="checkoutID" name="checkoutID">
<input type="submit" name="handling" value="Mark As Handled">
<input type="submit" name="returned" value="Mark As Returned">
</form>
</div>
</body>
</html>
