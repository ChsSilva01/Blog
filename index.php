<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <title>Blog do Carlão</title>
</head>
<body class="body">
    <?php
        $conexao = mysqli_connect("127.0.0.1","root","");
        mysqli_select_db($conexao,"blog");
        mysqli_set_charset($conexao, "UTF8");

        $query = mysqli_query($conexao,"SELECT imagens.imagem, textos.texto, textos.dat FROM noticia INNER JOIN imagens ON noticia.codigo_imagens = imagens.codigo_imagem INNER JOIN textos ON noticia.codigo_texto = textos.codigo_texto;");

        while($exibe = mysqli_fetch_array($query)){
            echo $exibe[2];
        }
    ?>
    <!-- <div class="wraaper">
        <div class="header">
            <div><a class="text">BLOG DO CARLÃO</a></div>
        </div>
        <div class="notice">
            <div class="image"></div>
            <div class="text-notice">
                
            </div>
        </div>
        <div class="other-notices">
            <div style="left: 5%; width: 90%; height: 40vh; background-color: #000; position: relative"></div>
            <div style="left: 5%; width: 90%; height: 40vh; background-color: #000; position: relative"></div>
            <div style="left: 5%; width: 90%; height: 40vh; background-color: #000; position: relative"></div>
        </div>
    </div> -->
</body>
</html>