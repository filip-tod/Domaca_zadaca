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
    function zbroj_slova($decko, $cura)
    {
        $ponavljanje_slova = [];
        $par = $decko . $cura;
        $strArray = count_chars($par, 1);
        $rezultat = null;

        foreach ($strArray as $key => $value) {
            $ponavljanje_slova[chr($key)] = $value;
        }
        foreach (str_split($par) as $slovo) {
            $rezultat .= $ponavljanje_slova[$slovo];
        }
        return $rezultat;
    }
    
    function kalkulator($zbroj_slova)             
        {
        if ($GLOBALS['flag']) {

            if ((int)$GLOBALS['result'] <= 100) {
                echo "čestitke vas rezultat je ";
                echo $GLOBALS['result'] . "<br>";
                exit();
            } else {

                $GLOBALS['flag'] = false;
                $GLOBALS['result'] = $GLOBALS['rtn'];
                $GLOBALS['rtn'] = null;
                kalkulator($GLOBALS['result']);
            }
        } else {
            $suma = str_split($zbroj_slova);
            if (count($suma) == 1) {
                $GLOBALS['rtn'] .= $suma[0];
                $GLOBALS['flag'] = true;
                kalkulator($GLOBALS['rtn']);
            } else {
                $GLOBALS['rtn'] .= strval(array_shift($suma) + array_pop($suma));
            }
            kalkulator(implode($suma));
        }
    }

    if (isset($_POST['predaj']))

    $rtn = null;
    $flag = false;
    $result = 101;
    $decko = strtoupper($_POST['imedecka']);
    $cura = strtoupper($_POST['imecure']);

    echo $decko . ' ' . $cura . "<br>";
    $zbroj_slova = zbroj_slova($decko, $cura);
    kalkulator($zbroj_slova);
?>
</body>

</html>