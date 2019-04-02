<?php

include 'include/header.php';

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

            <form name = "login">
                <div class = "form-group">
                    <input class="form-control" id="title" type="text" name="Title" placeholder="Title">
                    <select class ="custom-select mt-3" name="cars" id = "gories">
                        <option value="" selected disabled>Please select a category</option>
                            <option value="Science">Science</option>
                            <option value="Art">Art</option>
                            <option value="Literature">Literature</option>
                            <option value="History">History</option>
                            <option value="Mathematics">Mathematics</option>
                            <option value="Other">Other</option>
                    </select>

                    <div class = "mt-3 text-edit">
                        <div id="editor">
                        </div>
            
                        <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>

                             <!-- Initialize Quill editor -->
                            <script>
                                var options = {
                                placeholder: 'Enter Text Here',
                                theme: 'snow'
                                };
                                var quill = new Quill('#editor', options);
                            </script>
                    </div>
                    <script>    </script>   
                    <button type="button" class="mt-3 btn btn-secondary">Publish</button>
                </div>
            </form>
     
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