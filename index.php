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


    function ispisiSifru(/* Lista parametara je prazna */)
        {
           
            $slova=[];
            for($i=65;$i<=90;$i++){
                $slova[]=chr($i);
            }
            $slova = array_merge($slova,['Č','Ć','Ž','Š','Đ']);
            
        }
       

   
   ?>
    

</body>
</html>