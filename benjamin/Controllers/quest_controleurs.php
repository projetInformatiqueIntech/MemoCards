<?php
echo "WORK";

$iddeck = 1;

if (isset($_SESSION['list']))
{
    $list = $_SESSION['list'];
}
else
{
    $list = [];

}
var_dump($list);
// RECUPERER LA REPONSE DE LA CARTE DAVANT ICI

if (isset($_GET['qcm'])) {
    $_SESSION['qcm'] = $_GET['qcm'];
}
if (isset($_GET['q'])) {
    $_SESSION['q'] = $_GET['q'];
}

if(!isset($_SESSION['cpt'])) // + !
{
    $_SESSION['cpt'] = 1;
}

if(!isset($_SESSION['cptall']))
{
    $_SESSION['cptall'] = nb_card_select($iddeck);
    $_SESSION['cptall'] = $_SESSION['cptall'][0]['count'];
    //total of cards in the deck
}

//var_dump($_SESSION['cptall']);

if (isset($_POST['answer']))
{
    // RECUPERER INFO DE LA QUESTION
    //echo $_SESSION['iddelaquestiondavant'];

    $getquest = carte_recup_select($_SESSION['iddelaquestiondavant']);
    $played_card = $getquest[0]['played_cards'];
    $level_card = $getquest[0]['level_cards'];
    $chain = $getquest[0]['chain'];

    var_dump($getquest);
    if ($_POST['answer'] === 'T')
    {
        $played_card++;
        $level_card++;
        $chain++;
    }
    else if ($_POST['answer'] === 'F')
    {
        $played_card++;
        $level_card--;
        $chain = 0;
    }
    if ($chain === 3) {
        if ($level_card < 3) {
            $level_card = 3;
        }
    } //echo $played_card;
}

//var_dump($_SESSION['cptall']);
//var_dump($_SESSION['cpt']);

if ($_SESSION['cpt'] <= intval($_SESSION['cptall']))
{
    $choice = rand(0, 100);
    //$choice = 40;
    var_dump($list);
    $liststr = implode(",",$list);
    var_dump($liststr);

    if ($choice < 35)
    {
        //include("./modeles/quest1.php");
        $questions = quest1_select($iddeck, $liststr);
    }
    else
    {
        //include("./modeles/quest2.php");
        $questions = quest2_select($iddeck, $liststr);
    }
    //var_dump($questions);
    $IDDELAQUESTION = $questions[0]['id'];
    $list[]= $IDDELAQUESTION;

    //var_dump(intval($IDDELAQUESTION));

    $ans = verso_recup_select($IDDELAQUESTION);
    var_dump($ans);

    // AFFICHAGE DE LA QUESTION ICI
    include(dirname(__FILE__).'/../vues/affichage_quest.php');


    $_SESSION['cpt']++;
    $_SESSION['list'] = $list;
    $_SESSION['iddelaquestiondavant'] = $IDDELAQUESTION;
}

else {
    //// affichage score
}
//$_SESSION['cpt'] = $cpt;

?>