<?php
session_start();

// Check if the user is logged in
if(!isset($_SESSION["MemberID"])) {
  // Redirect the user to the login page
  header("Location: login.php");
  exit();
}

$mysqli = require __DIR__ . "/database.php";
// Get all checkouts and reservations made by the user
$sql = "SELECT co.CheckoutID, co.CopyID, co.StartDate, co.EndDate, co.ReturnDate, co.TotalLateFee, co.Status, i.Name, i.SerialOrISBN
        FROM checkout co
        LEFT JOIN copy c ON co.CopyID = c.CopyID
        LEFT JOIN item i ON c.ItemID = i.ItemID
        WHERE co.MemberID = ?
        ORDER BY co.StartDate DESC
        LIMIT 20";
$stmt = $mysqli->prepare($sql);
$stmt->bind_param("s", $_SESSION["MemberID"]);
$stmt->execute();
$result = $stmt->get_result();

?>

<!DOCTYPE html>
<html>
<head>
    <title>My Orders</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/water.css@2/out/water.css">
</head>
<div>
    <a href="main.php"><button>Home</button></a>
    <a href="logout.php"><button>Sign Out</button></a>
</div>

<body>

    <h1>My Orders</h1>

    <table>
        <thead>
            <tr>
                <th>OrderID</th>
                <th>Item Name</th>
                <th>Item Serial/ISBN</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Status</th>
                <th>Return Date</th>
                <th>Late Fee</th>

            </tr>
        </thead>
        <tbody>
        <?php
            if ($result->num_rows > 0) {
                while($row = $result->fetch_assoc()) {
                    echo "<tr>";
                    echo "<td>" . $row["CheckoutID"] . "</td>";
                    echo "<td>" . $row["Name"] . "</td>";
                    echo "<td>" . $row["SerialOrISBN"] . "</td>";
                    echo "<td>" . $row["StartDate"] . "</td>";
                    echo "<td>" . $row["EndDate"] . "</td>";
                    echo "<td>";
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
                    echo "</td>";
                    echo "<td>" . $row["ReturnDate"] . "</td>";
                    echo "<td>" . $row["TotalLateFee"] . "</td>";
                    echo "</tr>";
                }
            } else {
                echo "<tr><td colspan='9'>No orders found.</td></tr>";
            }
            ?>

        </tbody>
    </table>
    <h2>Reservations</h2>
    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Reservation Date</th>
                <th>Expiration Date</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <?php
                $sql = "SELECT r.ReservationID, r.CopyID, r.ReservationDate, r.ExpirationDate, r.Status, i.Name
                        FROM reservation r
                        LEFT JOIN copy c ON r.CopyID = c.CopyID
                        LEFT JOIN item i ON c.ItemID = i.ItemID
                        WHERE r.MemberID = ?";
                $stmt = $mysqli->prepare($sql);
                $stmt->bind_param("s", $_SESSION['MemberID']);
                $stmt->execute();
                $result = $stmt->get_result();

                while ($row = $result->fetch_assoc()) {
                    echo "<tr>";
                    echo "<td>" . $row['Name'] . "</td>";
                    echo "<td>" . $row['ReservationDate'] . "</td>";
                    echo "<td>" . $row['ExpirationDate'] . "</td>";
                    echo "<td>";
                    switch ($row["Status"]) {
                        case 0:
                            echo "<form action='cancel_reservation.php' method='post'><input type='hidden' name='ReservationID' value='" . $row['ReservationID'] . "'><button type='submit'>Cancel</button></form>";
                            break;
                        case 1:
                            echo "Closed";
                            break;
                        default:
                            echo "Unknown";
                    }
                    echo "</td>";
                    echo "</tr>";
                }

                $stmt->close();
                $mysqli->close();
            ?>
        </tbody>
    </table>


</body>
</html>
