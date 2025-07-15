component {
    public function init() {
        return this;
    }

    public query function getAllEquipment() {
        var sql = "SELECT * FROM equipment";
        return queryExecute(sql);
    }

    public query function getEquipmentById(required numeric equipmentId) {
        var sql = "SELECT * FROM equipment WHERE equipment_id = :equipmentId";
        var params = {equipmentId = {value=arguments.equipmentId, cfsqltype="cf_sql_integer"}};
        return queryExecute(sql, params);
    }

    public void function addEquipment(required struct equipmentData) {
        var sql = "INSERT INTO equipment (name, model, manufacturer, purchase_date, purchase_price, status)
                   VALUES (:name, :model, :manufacturer, :purchaseDate, :purchasePrice, :status)";
        var params = {
            name = {value=arguments.equipmentData.name, cfsqltype="cf_sql_varchar"},
            model = {value=arguments.equipmentData.model, cfsqltype="cf_sql_varchar"},
            manufacturer = {value=arguments.equipmentData.manufacturer, cfsqltype="cf_sql_varchar"},
            purchaseDate = {value=arguments.equipmentData.purchaseDate, cfsqltype="cf_sql_date"},
            purchasePrice = {value=arguments.equipmentData.purchasePrice, cfsqltype="cf_sql_decimal"},
            status = {value=arguments.equipmentData.status, cfsqltype="cf_sql_varchar"}
        };
        queryExecute(sql, params);
    }

    public void function updateEquipment(required numeric equipmentId, required struct equipmentData) {
        var sql = "UPDATE equipment
                   SET name = :name, model = :model, manufacturer = :manufacturer,
                       purchase_date = :purchaseDate, purchase_price = :purchasePrice, status = :status
                   WHERE equipment_id = :equipmentId";
        var params = {
            equipmentId = {value=arguments.equipmentId, cfsqltype="cf_sql_integer"},
            name = {value=arguments.equipmentData.name, cfsqltype="cf_sql_varchar"},
            model = {value=arguments.equipmentData.model, cfsqltype="cf_sql_varchar"},
            manufacturer = {value=arguments.equipmentData.manufacturer, cfsqltype="cf_sql_varchar"},
            purchaseDate = {value=arguments.equipmentData.purchaseDate, cfsqltype="cf_sql_date"},
            purchasePrice = {value=arguments.equipmentData.purchasePrice, cfsqltype="cf_sql_decimal"},
            status = {value=arguments.equipmentData.status, cfsqltype="cf_sql_varchar"}
        };
        queryExecute(sql, params);
    }

    public void function deleteEquipment(required numeric equipmentId) {
        var sql = "DELETE FROM equipment WHERE equipment_id = :equipmentId";
        var params = {equipmentId = {value=arguments.equipmentId, cfsqltype="cf_sql_integer"}};
        queryExecute(sql, params);
    }
}
