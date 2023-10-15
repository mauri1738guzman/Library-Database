<?php
session_start();

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
<h2>List of Items</h2>
<table>
  <thead>
    <tr>
      <th>Name</th>
      <th>Type</th>
      <th>Quantity</th>
      <th>Creator</th>
      <th>ISBN</th>
      <th>Action</th>
    </tr>
  </thead>
  <tbody>
    <?php
      $mysqli = require __DIR__ . "/database.php";
      $sql = "SELECT item.ItemID, item.Name, item.Creator, item.SerialOrISBN, itemtype.Name AS TypeName 
              FROM item JOIN itemtype ON item.TypeID = itemtype.ItemTypeID 
              WHERE item.Available = 1 
              ORDER BY itemtype.Name, item.Name 
              LIMIT 20";

      $result = $mysqli->query($sql);
      if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
          echo "<tr>";
          echo "<td>" . $row["Name"] . "</td>";
          echo "<td>" . $row["TypeName"] . "</td>";
          echo "<td>" . getQuantity($row["ItemID"]) . "</td>";
          echo "<td>" . $row["Creator"] . "</td>";
          echo "<td>" . $row["SerialOrISBN"] . "</td>";
          echo "<td><a href='item.php?id=" . $row["ItemID"] . "'>View Details</a></td>";
          echo "</tr>";
        }
      } else {
        echo "<tr><td colspan='4'>No items found.</td></tr>";
      }

      function getQuantity($itemID) {
        $mysqli = require __DIR__ . "/database.php";
        $sql = "SELECT COUNT(*) as count FROM copy WHERE ItemID = ?";
        $stmt = $mysqli->prepare($sql);
        $stmt->bind_param("i", $itemID);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
          $row = $result->fetch_assoc();
          return $row["count"];
        } else {
          return 0;
        }
      }
    ?>
  </tbody>
</table>

</body>
</html>
