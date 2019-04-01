<?php

include 'include/header.php';
include 'functions.php';

session_start();

// $result = getAll();

// echo "this is session id: " . $_SESSION['userID'];

// echo '<pre>';
// var_dump($_SESSION);
// echo '</pre>';
$results_per_page = 3;

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
// $numberofrows = mysqli_num_rows($result);


?>

<html>
    <body class = "mb-3">
        <div class="container">
            <div class = "row">
                <div class = "col">
                    <!-- to divide page -->
                </div>
                <!-- first column -->
                <div class = "col-md-8">
                <?php
                        if (mysqli_num_rows($result) > 0) {
                            while($row = mysqli_fetch_array($result)) {
                        ?>
                    <!-- POST -->
                    <div class="card mt-3 bg-white border border-light shadow-sm mb-5">
                        <div class="row no-gutters">
                            <div class="col-auto p-4">
                                <img width="130" src="./images/hamster.jpg" class="img-fluid img-thumbnail" alt="">
                            </div>

                            <div class="col">
                                <div class="card-block mt-4 px-2">
                                    <a href="post.php?id=<?php echo $row["PostID"];?>"
                                    class="card-link">
                                    <?php echo $row["Title"]?>
                                    </a>
                                </div>

                                <div class="card-block mr-2 mt-2 px-2 mb-3">
                                    <div class = "mt-3">
                                        <b><p class="card-text d-inline"><?php echo $row["UserName"];?></p></b> • 
                                        <p class="card-text d-inline"><?php echo $row["P"];?></p>
                                        <p class="card-text float-right"><?php echo $row["Type"];?></p>
                                    </div>
                                </div>
                            </div>
                            
                            <div class = "col-md-1 text-center bg-light">
                                <div class = "mt-4">
                                    <?php
                                        $data = array(
                                            'id' => $row["PostID"],
                                            'vote' => "1",
                                            'user' => $row["UserID"],
                                        );
                                    ?>
                                    <a href = "updownVote.php?<?php echo http_build_query($data,'', '&');?>">
                                        <img width="20" src="./images/thumb-up.png" class="img-fluid" alt="">
                                    </a>
                                    <p class = "mt-3"><?php echo $row["RANK"]?></p>
                                    <?php
                                        $data2 = array(
                                            'id' => $row["PostID"],
                                            'vote' => "0",
                                            'user' => $row["UserID"],
                                        );
                                    ?>
                                    <a href = "updownVote.php?<?php echo http_build_query($data2,'', '&');?>">
                                        <img width="20" src="./images/thumb-down.png" class="img-fluid" alt="">
                                    </a>
                                </div>
                            </div>
                        </div>    
                    </div>
                     <!-- POST END -->

                     <!-- POST -->
                   
                     <!-- POST END -->
                     <?php
                            }
                        } else {
                            echo ("No Posts");
                        }
                        ?>
                </div>

                <!-- second column -->

                <div class = "col">
                    <!-- to divide page -->
                </div>
            </div>

            <!-- PAGINATION -->
            <div class = "row">
                <div class = "col" >
                        <!-- to divide page -->
                </div>
                <div class = "col-md-8">
                        <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-center">
                            <?php
                                $statement = "SELECT COUNT(p.PostID) AS total FROM Post p";
                                $statement = mysqli_prepare($db, $statement);
                                 mysqli_stmt_execute($statement);
                                 $results = mysqli_stmt_get_result($statement);
                                 if (mysqli_num_rows($results) > 0) {
                                      while($row = mysqli_fetch_array($results)) {
                                         $total_pages = ceil($row["total"] / $results_per_page); // calculate total pages with results         
                                          for ($i=1; $i<=$total_pages; $i++) {  // print links for all pages
                            ?>
                                <li class="page-item">
                                    <a class="page-link" href="index.php?page=<?php echo $i; ?>">
                                        <?php echo $i; ?>
                                    </a>
                                </li>
                            <?php
                                        }; 
                                    }
                                }
                            ?>
                            </ul>
                            </nav>
                </div>
                <div class = "col" >
                           <!-- to divide page -->
                </div>
            </div>
            
            
            </div>
        </div>
        </body>
       <!-- Footer -->
       <div class = "footer bg-dark">
            <footer class="navbar navbar-expand-lg navbar-light bg-dark justify-content-between">
                <!-- Content -->
                <a href = "#" class="navbar-brand">
                    <img width="200" class = "img-fluid" src="./images/Logo-black.png">
                </a>

                <!-- Copyright -->
                <div class="text-white nav navbar-nav ml-auto">
                    © 2019 Copyright Michelle & Pirajeev
                </div>

            </footer>
        </div>
        
        <!-- Footer -->
    
</html>