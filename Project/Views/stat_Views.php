<p><h1> <i>Vos decks :</i>  </h1></p>


<form method="POST" action="">
<?php   for($i=0; $i<2; $i++)
        { 
            if(isset($datas[$i]['name'])) 
            { ?>
                <button name="deckstat" value="<?php echo $datas[$i]['id']; ?>" style="width:250px">
                    <h3> <?php echo $datas[$i]['name']; ?> </h3>
                    <img src="<?php echo $datas[$i]['picture']; ?>" alt="" height="100"> <br>

                    <label for="description"><i><b>Description :</b></i> </label>
                    <p id="description"> <?php echo $datas[$i]['description']; ?> </p>
                </button>
    <?php   }
        } ?> <br><br>

</form>

<?php $content = ob_get_clean(); ?>
<?php require(dirname(__FILE__).'/template.php'); ?>