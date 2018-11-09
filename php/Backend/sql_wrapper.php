<?php
class SqlWrap{
    private static function collapse($result){
        if ($result == null){
            return null;
        }
        //mi ricordo di gstire il caso in cui ho un array nullo
        $key = array_keys($result[0])[0];
        $new_result = [];
        $lim = count($result);
        for($i = 0; $i < $lim; $i++){
            $new_result[$i] = $result[$i][$key];
        }
        return $new_result;
    }

    public static function query($query, $collapse = false){
        include "phpConnect.php";
        if(!$result = $connect->query($query)){
            throw Exception("La query non è andata a buon fine");
        }
        $connect->close();
        $lista_return = [];
        if($result->num_rows > 0){
          while($row = $result->fetch_array(MYSQLI_ASSOC)){
              array_push($lista_return,$row);
            }
            $result->free();
            if ($collapse){
                $lista_return = self::collapse($lista_return);
            }
            return $lista_return;
        }
  
        else
            return null;
    }

}















?>