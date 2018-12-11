<?php $title = 'Incription'; ?>
<?php ob_start(); ?>
<html>
  <head>
        <meta charset="utf-8"/>
      <!-- Le script du head -->
      <script src="https://www.google.com/recaptcha/api.js" async defer></script>
      <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="./Public/css/connection.css" rel="stylesheet" type="text/css" />

    </head>
<body>  
<div class="background">
<div class="page-container">

    <center><img class="mb-4"  src="./Public/img/memocards_white.png" width="600" alt=""></center>
    

        <form action="index.php?page=inscription" method="POST" class="form-signin">
        <div id="erreur">
    <p>Vous n'avez pas rempli correctement les champs du formulaire !</p>
</div>

<form>
    <label for="username"></label> <input type="text" name="username"id="username" class="champ"placeholder="Username" />
    <label for="password"></label> <input type="password" name="password" id="password" class="champ"placeholder="Mot de passe" />
    <label for="confirmation"></label>  <input type="password" id="confirmation" class="champ" placeholder="Confirmation mot de passe" />
    <label for="email"></label> <input type="text" name="email" id="mail" class="champ" placeholder="E-mail"/><br>
    <input type="radio" name="sex" value="M" width:20px class="champ">Homme
    <input type="radio" name="sex" value="F" checked class="champ">Femme<br>

            <select name="region" class="form-control" class="champ">
                <option value="region" disabled selected>Région</option> 
                <option value="hauts_de_france">Hauts-de-France</option> 
                <option value="normandie">Normandie</option>
                <option value="ile_de_france">Ile-de-France</option>
                <option value="bretagne">Bretagne</option>
                <option value="pays_de_la_loire">Pays de la Loire</option>
                <option value="centre_val_de_loire">Centre-Val de Loire</option>
                <option value="grand_est">Grand Est</option>
                <option value="nouvelle_aquitaine">Nouvelle-Aquitaine</option>
                <option value="bourgogne_franche_comte">Bourgogne-Franche-Comté</option>
                <option value="auvergne_rhones_alpes">Auvergne-Rhône-Alpes</option>
                <option value="occitanie">Occitanie</option>
                <option value="paca">Provence-Alpes-Côte d'Azur</option>
                <option value="corse">Corse</option>
                <option value="guadeloupe">Guadeloupe</option>
                <option value="martinique">Martinique</option>
                <option value="guyane">Guyane</option>
                <option value="mayotte">Mayotte</option>
                <option value="la_reunion">La Réunion</option>
            </select><br>

            <input type="date" name="date_de_naissance" id="date_de_naissance" class="champ" placeholder="Date de naissance" >

    <input type="submit" id="envoi" value="Inscription"/> 
   <!-- <input type="reset" id="rafraichir" value="Rafraîchir" /> -->
</form>

<!-- on inclut la bibliothèque depuis les serveurs de Google -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script>
    $(document).ready(function(){
        
        var $username = $('#username'),
            $password = $('#password'),
            $confirmation = $('#confirmation'),
            $mail = $('#mail'),
            $envoi = $('#envoi'),
            $reset = $('#rafraichir'),
            $erreur = $('#erreur'),
            $champ = $('.champ');

        $champ.keyup(function(){
            if($(this).val().length < 5){ // si la chaîne de caractères est inférieure à 5
                $(this).css({ // on rend le champ rouge
                    borderColor : 'red',
                color : 'red'
                });
            }
            else{
                $(this).css({ // si tout est bon, on le rend vert
                borderColor : 'green',
                color : 'green'
            });
            }
        });

        $confirmation.keyup(function(){
            if($(this).val() != $password.val()){ // si la confirmation est différente du mot de passe
                $(this).css({ // on rend le champ rouge
                    borderColor : 'red',
                color : 'red'
                });
            }
            else{
            $(this).css({ // si tout est bon, on le rend vert
                borderColor : 'green',
                color : 'green'
            });
            }
        });

        $envoi.click(function(e){

            // puis on lance la fonction de vérification sur tous les champs :
            verifier($username);
            verifier($password);
            verifier($confirmation);
            verifier($mail);
            if(!verifier($username) && !verifier($password) && !verifier($confirmation) && !verifier($mail))
            {
                e.preventDefault(); // on annule la fonction par défaut du bouton d'envoi
            }
        });

        $reset.click(function(){
            $champ.css({ // on remet le style des champs comme on l'avait défini dans le style CSS
                borderColor : '#ccc',
                color : '#555'
            });
            $erreur.css('display', 'none'); // on prend soin de cacher le message d'erreur
        });

        function verifier(champ){
            if(champ.val() == ""){ // si le champ est vide
                $erreur.css('display', 'block'); // on affiche le message d'erreur
                champ.css({ // on rend le champ rouge
                    borderColor : 'red',
                    color : 'red'
                });
            } else {
                return true;
            }
        }

    });
</script>         

        <!-- Bouton de retour à l'écran d'accueil -->
<form action='index.php?page=home' method='POST'>
    <button type="submit" value="Retour à l'écran de connexion">Retour à l'écran de connexion</button>
</form>


</div>
    <center><p >&copy; MemoCards</p></center>

</div>
 </div>    
 
<?php $content = ob_get_clean(); ?>
<?php require(dirname(__FILE__).'/template_accueil.php'); ?>
