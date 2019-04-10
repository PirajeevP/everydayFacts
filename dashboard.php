<?php

include 'include/header.php';
include 'functions.php';

session_start();

# LOAD CATEGORIES
$fillCat = getCategories();


# if USERID is SET and CATEGORY is SET THEN FILTER
if ( isset( $_SESSION['userID'],$_POST["sel-category"])) {
    $a = $_SESSION['userID'];
    $cat = $_POST["sel-category"];

    # IF categoryID != "". get filtered posts.. 
    if ($cat != ""){
        $result = filter($cat,$a);

    } 
} else {
    $a = $_SESSION['userID'];
    $result = getPosts($a);
}


# SEARCH BAR FUNCTIONALITIES 
if ($_POST['searchbar'] != ""){
    $a = $_SESSION['userID'];
    $text = $_POST['searchbar'];
    $result = search($a,$text);
} 

# DELETE FUCTIONALITIES
if (isset($_POST['deleteSubmit'])){
    if (!empty($_POST['checked_id'])){
        $db = getDB();
        $idStr = implode(',',$_POST['checked_id']);
        deletePost($idStr);
    }
}


?>

<html>
    <body>
        <div class = "container">
            <div class = "row">
                <div class = "col-md-2">
                    <h2> Dashboard </h2>
                </div>
                <div class = "col-md-10">
                    <a href = "createPost.php" class="btn btn-primary float-right">Create New</a>
                </div>
            </div>

            <!-- Filter Options -->
            <div class = "row mt-5">
                <div class = "col-md-6">
                <form method="post" class = "filter-options">
                    <div class = "form-inline">
                        <select name = "deleteOption" class = "mr-2 custom-select">
                            <option selected>Delete</option>
                        </select>
                        <input type="submit" name="deleteSubmit" value = "Apply" class="btn btn-primary">

                        <select name = "sel-category" class = "ml-2 mr-2 custom-select tx">
                            <option value ="0" selected>Category</option>
                            <?php
                        if (mysqli_num_rows($fillCat) > 0) {
                            while($row = mysqli_fetch_array($fillCat)) {
                        ?>
                            <option value="<?php echo $row["CategoryID"];?>"><?php echo $row["Type"];?></option>

                            <?php
                            }
                        } else {
                            echo ("No Posts");
                        }
                        ?>
                        </select>
                        <button type="Submit" class="btn btn-primary">Filter</button>
                    </div>
                   
                </div>

                <div class = "col-md-6">
                        <div class = "form-inline float-right">
                            <input class="form-control mr-sm-2" type="search" name = "searchbar" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                        </div>
                </div>
                    
                
            </div>

            <!-- Filter Options -->
            <div class = "row mt-3">
                <div class = "col">
                <table class="table bg-white border border-light shadow-sm mb-5">
                    <thead>
                        <tr>
                        <th></th>
                        <th>Title</th>
                        <th>Edit</th>
                        <th>Category</th>
                        <th>Date</th>
                        <th>Rank</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- one row -->
                        <?php
                        if (mysqli_num_rows($result) > 0) {
                            while($row = mysqli_fetch_array($result)) { 
                                
                        ?>
                        <tr> 
                        <th scope="row">
                        
                                <input name = "checked_id[]" value="<?php echo $row["PostID"];?>" type="checkbox">
                         
                        </th>
                        <td><a href="post.php?id=<?php echo $row["PostID"];?>"><?php echo $row["Title"];?></a></td>
                        <td><a href="editPost.php?id=<?php echo $row["PostID"];?>">Edit</a></td>
                        <td><?php echo $row["Type"];?></td>
                        <td><?php echo $row["PostDate"];?></td>
                        <td><?php echo $row["Rank"];?></td>
                        </tr>

                        <?php
                            }
                        } else {
                            echo ("No Posts");
                        }
                        ?>
                    </tbody>
                </table>
                    </form>
                </div>
            </div>

        </div>


        <!-- Footer -->
        <div class = "footer bg-dark">
            <footer class="navbar navbar-expand-lg navbar-light bg-dark justify-content-between">
                <!-- Content -->
                <a href = "#" class="navbar-brand">
                    <img width="200" class = "img-fluid" src="./images/Logo-black.png">
                </a>

                <!-- Copyright -->
                <div class="text-white nav navbar-nav ml-auto">© 2019 Copyright Michelle & Pirajeev
                </div>
                <!-- Copyright -->

            </footer>
        </div>
        <!-- Footer -->
    </body>
</html>