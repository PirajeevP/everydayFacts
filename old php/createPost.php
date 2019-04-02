<?php

include 'include/header.php';

?>

<!DOCTYPE html>

<html>


<body>
<div class = "container">
    
    <div class="row">
        <div class="col-md-5">
            <h1>Add New Fact</h1>
        </div>
     </div>
        

        
        <form name="login">
        <div class="form-group">
           
        <input class="form-control form-control-sm" id="title" type="text" name="Title" placeholder="Title">
            
        </div>
        <div class="form-group">
            <select class ="custom-select" name="cars" id = "gories">
            <option value="" selected disabled>Please select a category</option>
                <option value="Science">Science</option>
                <option value="Art">Art</option>
                <option value="Literature">Literature</option>
                <option value="History">History</option>
                <option value="Mathematics">Mathematics</option>
                <option value="Other">Other</option>
            </select>
        </div>
        </form>
        <div id="editor">
            Enter Text Here
        </div>
        <div class="row">
            <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>

         <!-- Initialize Quill editor -->
         <script>
                var quill = new Quill('#editor', {
                  theme: 'snow'
              });
             </script>
        </div>
        <br>
        <div class="row">
            <button class="btn btn-secondary">Publish</button></th>
        </div>
        
    </div>
    <div class="col-md-2">
    <div class="errobox" id="ero">
    
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