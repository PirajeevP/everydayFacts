<?php

include 'include/header.php';
include 'functions.php';



$results_per_page = 3;

// if (isset($_GET["page"])) { $page  = $_GET["page"]; } else { $page=1; }; 

// $sql = "SELECT * FROM ".$datatable." ORDER BY ID ASC LIMIT $start_from, ".$results_per_page;
// $rs_result = $conn->query($sql); 

$db = getDB();

# get SQL query + Bind Parameters
if (isset($_GET["page"])) { $page  = $_GET["page"]; } else { $page=1; }; 
$start_from = ($page-1) * $results_per_page;
$statement = "SELECT u.UserID, p.PostID, u.UserName, p.PostID, p.Title, DATE_FORMAT(p.PostDate, '%m/%d/%y') AS 'P', c.Type, SUM(r.Number) as 'RANK' 
FROM Rank r 
INNER JOIN Post p INNER JOIN Users u 
INNER JOIN Category c ON u.UserID = p.UserID 
AND p.CategoryID = c.CategoryID AND p.PostID = r.PostID 
GROUP BY p.PostID ORDER BY RANK DESC LIMIT $start_from , $results_per_page";
$statement = mysqli_prepare($db, $statement);
mysqli_stmt_execute($statement);
$result = mysqli_stmt_get_result($statement);
$numberofrows = mysqli_num_rows($result);

?>

<html>
    <table>
    <tr> POST TITLE </tr>
    <?php 
         if (mysqli_num_rows($result) > 0) {
            while($row = mysqli_fetch_array($result)) {
    ?>  
    <tr>
        <td><?php echo $row["PostID"];?> </td>
    </tr>
    <?php 
         }
        } else {
            echo ("No Posts");
        }
    ?>
    </table>

        <?php 
    $statement = "SELECT COUNT(p.PostID) AS total FROM Post p";
    $statement = mysqli_prepare($db, $statement);
    mysqli_stmt_execute($statement);
    $results = mysqli_stmt_get_result($statement);
    if (mysqli_num_rows($results) > 0) {
        while($row = mysqli_fetch_array($results)) {
            $total_pages = ceil($row["total"] / $results_per_page); // calculate total pages with results
            echo "brah";
            for ($i=1; $i<=$total_pages; $i++) {  // print links for all pages
                        echo "<a href='test.php?page=".$i."'";
                        if ($i==$page)  echo " class='curPage'";
                        echo ">".$i."</a> "; 
            }; 
        }
    }
    ?>

</html>