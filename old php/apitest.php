
<?php
include 'include/header.php';

// // https://documenter.getpostman.com/view/1946054/S11HvKSz#32af4659-b486-4d8b-a4da-4916481b7dc9

// $curl = curl_init();

// curl_setopt_array($curl, array(
//   CURLOPT_URL => "https://catfact.ninja/facts?limit=1&max_length=140",
//   CURLOPT_RETURNTRANSFER => true,
//   CURLOPT_ENCODING => "",
//   CURLOPT_MAXREDIRS => 10,
//   CURLOPT_TIMEOUT => 0,
//   CURLOPT_FOLLOWLOCATION => false,
//   CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
//   CURLOPT_CUSTOMREQUEST => "GET",
//   CURLOPT_HTTPHEADER => array(
//     "Accept: application/json"
//   ),
// ));

// $response = curl_exec($curl);

// var_dump($response);
// echo "this is ,,. <br>";
// $err = curl_error($curl);
// curl_close($curl);


// if ($err) {
//   echo "cURL Error #:" . $err;
// } else {
//   echo $response;
// }

// echo "<br>";
// echo "<br>";
// echo "<br>";
// $json = json_decode($response);
// print_r($json);



echo "<br>";
echo "this is numbers: " . $z; 
?>

<html>
<head>
<script src="jquery-3.3.1.min.js"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
  <body>
    We now have more users than <span id="number"></span>!
  </body>

  <script>
$(function() {
    $.get('http://numbersapi.com/13/trivia?notfound=floor&fragment', function(data) {
        //$('#number').text(data);
        $z = json_encode($data);
    });
});

  </script>
</html>