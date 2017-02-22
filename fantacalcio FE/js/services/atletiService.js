app.service('AtletiService', ['$http', 'settings', function($http, settings) {
        
    var url = settings.url+"atleta.php";
	var url2 = settings.url+"atleta.php?act=del&id=";
    
    var onError = function(response){
        console.log("Errore di chiamata:", response)
    };
    
    var getList = function(callback){
        $http.get(url).then(
                callback, onError);
    };
    
    var getItem = function(id,callback){
        $http.get(url,{id:id}).then(
                callback, onError);
    };
    
    var delItem = function(id,callback){
        //$http.get(url,{act:'del',id:id})
		$http.get(url2+id).then(
                callback, onError);
    };
		var saveItem = function(item,callback){
		//console.log('saving',item)
        $http.post(url,{item:item}).then(
                callback, onError);
    };

    return {
        getList: getList,
        getItem: getItem,
        delItem: delItem,
        saveItem: saveItem
    };
}]);