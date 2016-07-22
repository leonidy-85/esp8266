function jobDB() {
    var db = LocalStorage.openDatabaseSync("led.db", "1.0", "led DataBase", 100000);


    db.transaction(
        function(tx) {

            tx.executeSql("CREATE TABLE IF NOT EXISTS led(name TEXT, ip TEXT, descripcion TEXT)");

            var rs = tx.executeSql("SELECT * FROM led");


            if (rs.rows.length <= 0) {


//                tx.executeSql('INSERT INTO led VALUES(?, ?, ?)', ["Hall", "192.168.1.10", "test"]);
//                tx.executeSql('INSERT INTO led VALUES(?, ?, ?)', ["Bedroom", "192.168.1.11", ""]);



                var rs = tx.executeSql('SELECT * FROM led ORDER BY name ASC');
            }

            var index = 0;
            if (rs.rows.length > 0) {
                var index = 0;
                while (index <rs.rows.length) {
                    var unidad = rs.rows.item (index);
                    dbprimary.append ({
                    "name": unidad.name,
                    "ip": unidad.ip,
                    "descripcion": unidad.descripcion});
                index ++;
                }
            }
        }
    )
}


function insert(name, ip, descripcion) {
    var db = LocalStorage.openDatabaseSync("led.db", "1.0", "led DataBase", 100000);

    db.transaction(
        function(tx) {
            // Создание таблицы если она не существует:
            tx.executeSql("CREATE TABLE IF NOT EXISTS led(name TEXT, ip TEXT, descripcion TEXT)");

            // Создание дб
            tx.executeSql('INSERT INTO led VALUES(?, ?, ?)', [name, ip, descripcion]);
        }
    )
}


function del(name) {
    var db = LocalStorage.openDatabaseSync("led.db", "1.0", "led DataBase", 100000);

    db.transaction(
        function(tx) {
            // Удалить по имени:
            tx.executeSql('DELETE FROM led WHERE name = ?',[name]);
        }
    )
}

//Функция записи по имени
function recoger(name) {
var db = LocalStorage.openDatabaseSync("led.db", "1.0", "led DataBase", 100000);
    db.transaction(
        function(tx) {
            var rs = tx.executeSql('SELECT * FROM led WHERE name = ?',[name]);
            var unidad = rs.rows.item (0);

            led.append ({
            "ip": unidad.ip,
            "descripcion": unidad.descripcion});
        }
    )
}
