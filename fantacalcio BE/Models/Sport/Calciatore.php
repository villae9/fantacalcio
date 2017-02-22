<?php
namespace Models\Sport;

use Models\Table as Table;
use Models\Sport\Squadra;

class Calciatore extends Table {
    
    // Nome della tabella
    const TABLE_NAME = "calciatore";
    const BINDINGS = [
        //"nome_colonna"=>"nome_parametro",
        "id"=>"id",
        "nome"=>"nome",
        "ruolo"=>"ruolo",
        "squadra_id"=>"squadra_id"
    ];
    
    public $nome;
    public $ruolo;
    public $squadra_id;
    
    
    public function __construct($id = 0, $params = []){
        
        parent::init($this, $id);
        
        foreach($params as $k => $v){
            if(ca_array($v)){
                $this->$k = 
                        array_map(function($i){return is_int($i)?$i:$i->id;}, $v);
                $this->$k = array_unique($this->$k);
                sort($this->$k);
            }else{
                $this->$k = $v;
            }       
        }
    }
    
    public static function get ($id=0, &$obj=null){
        $result = parent::get($id, $obj);
        // le nostre modifiche
        if(is_array($result)){
            foreach($result as &$item){
                Calciatore::loadSquadra($item);
            }
        } else if ($result) {
            Calciatore::loadSquadra($result);
        }
        // fine delle nostre modifiche
        return $result;
    }
    
    protected static function loadSquadra(&$item){
        if($item->squadra_id){
            $squadra = new Squadra($item->squadra_id);
        }else{
            $squadra = new Squadra();
        }
        foreach(Squadra::getBindings() as $p){
            $newProp = "squadra_".$p;
            $item->$newProp = $squadra->$p;
        }
    }
    
    public function save(){
        parent::save();
        $this->storeCalciatore();
    }
    
    public function loadCalciatore(){
        try{
            $sql = "SELECT c.id, c.nome, c.ruolo, s.denominazione, s.datafondazione, s.allenatore FROM calciatore c LEFT JOIN squadra s ON c.squadra_id = s.id";
            $stmt = self::$db->prepare($sql);
            if($stmt->execute([":id"=>$this->id])){
                $this->calciatore = array_map(function($i){return $i['id'];}, $stmt->fetchAll());
            }
        }catch(\PDOException $e){
            die($e->getMessage());
        }
    }
    
//    public function storeIscrizioni(){
//        try{
//            // rimuovo quelle relazioni che non valgono piu
//            $sql = "UPDATE iscrizioni SET atleti_id = null WHERE id NOT IN (".
//                    join(", ",$this->iscrizioni).") AND atleti_id = :id";
//            $stmt = self::$db->prepare($sql);
//            $stmt->execute([":id"=>$this->id]);
//        }catch(\PDOException $e){
//            die($e->getMessage());
//        }
        
//        if(count($this->calciatore)){
//            try{
//                // aggiungo quelle relazione che valgono da adesso
//                $sql = "UPDATE iscrizioni SET atleti_id = :id WHERE id IN (".
//                        join(", ",$this->iscrizioni).")";
//                $stmt = self::$db->prepare($sql);
//                $stmt->execute([":id"=>$this->id]);
//            }catch(\PDOException $e){
//                die($e->getMessage());
//            }
//        }
    
}


