<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ljubavni kalkulator</title>
</head>
<body>
    <form action="" method="post">
        <input type="text" name="imedecka" required>
        <input type="text" name="imecure" required>
        <input type="submit" name="predaj">
    </form>

    <?php
    if(isset($_POST['predaj']))

    $decko= $_POST['imedecka'];
    $cura= $_POST['imecure'];
    



    foreach (count_chars($decko, 1) as $i => $val1) /* {
        echo "There were $val1 instance(s) of \"" , chr($i) , "\" in the string.\n";
     } */
     foreach (count_chars($cura, 1) as $i => $val2) /* {
        echo "There were $val2 instance(s) of \"" , chr($i) , "\" in the string.\n";
     } */

     $val=$val1+$val2;

     function suma($val,$suma=0)
{
    if(gettype($val)==='integer'){
        return $val;
    }
    $suma=0;
    foreach($val as $e){
        $suma += suma($e,$suma);
        if($suma<=100)
        break;
    }
    return $suma;
}
echo $suma;


   
   ?>
    

</body>
</html>