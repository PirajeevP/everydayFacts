<?php

include 'include/header.php';
include 'functions.php';

session_start();

#Load Categories
$fillCat = getCategories();

# GET TITLE, CATEGORY, TEXT to update;
$title = $_POST['title'];
$category = $_POST["sel-category"];
$text = $_POST['content-area'];

# THIS IS TESTING.. CAN BE DELETED LATER
// echo "Title: " . $title . "<br>";
// echo "Category: " . $category;
// echo "<br> This is text: " . htmlentities($_POST['content-area']) . "<br>"; 

if (!empty($_POST)){
    if ( isset( $_POST['title'],$_POST["sel-category"],$_POST["content-area"])){
        echo "<br> there's stuff in title and category";
       createNewPost($_SESSION['userID'],$title,$category,$text);
    } 
}
?>

<!DOCTYPE html>

<html>


<body>
<div class = "container">
    <div class = "row">
        <div class = "col">
         <!-- for formatting purposes -->
        </div>

        <div class = "col md-10 text-center">
            <h1>Add New Fact</h1>

            <form action = "" name = "newpost" method="post" id="identifier">
                <div class = "form-group">
                    <input class="form-control" id="title" type="text" name="title" placeholder="Title">
                    <select class ="custom-select mt-3" name="sel-category" id = "gories">
                        <option value ="0" selected>Category</option>
                                <?php
                            if (mysqli_num_rows($fillCat) > 0) {
                                while($row = mysqli_fetch_array($fillCat)) {
                            ?>
                                <option value="<?php echo $row["CategoryID"];?>"><?php echo $row["Type"];?></option>

                                <?php
                                }
                            } else {
                                echo ("No Categories");
                            }
                            ?>
                    </select>
                    
                    <div id = "textcontent">
                     </div>
                    <div class = "mt-3 text-edit">

                        <div id="quillEditor">
        
                        </div>
                        
                        <textarea name="content-area" style="display:none;" id="hiddenArea"></textarea>
                        
                        <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>

                        <!-- Initialize Quill editor -->
                      
                        <script>
                        var options = {
                            placeholder: 'Waiting for your precious content',
                            theme: 'snow'
                            };
                            var editor = new Quill('#quillEditor',options);
                        
                        var textContent = document.getElementById("textcontent");

                        // editor.on('text-change', function(){
                        //     var delta = editor.root.innerHTML;
                        //     textContent.innerHTML = delta;
                         
                        // });

                        $("#identifier").on("submit",function(){
                        // $("#hiddenArea").val($("#quillEditor").html())
                        var delta= editor.root.innerHTML;
                        $("#hiddenArea").val($(delta).html());
                        })
                        
                    
                        </script>
                    </div>
                
                    <button type="submit" class="mt-3 btn btn-secondary">Publish</button>
                </div>
            </form>
         <!-- Text Editor -->
        </div>

        <div class = "col">
         <!-- for formatting purposes -->
         
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
        
        <!-- Footer -->
</div>

</body>

</html>