component {
    public function init() {
        return this;
    }

    public query function getAllFarmers() {
        var sql = "SELECT * FROM farmers ORDER BY last_name, first_name";
        return queryExecute(sql);
    }

    public query function getFarmerById(required numeric farmerId) {
        var sql = "SELECT * FROM farmers WHERE farmer_id = :farmerId";
        var params = {farmerId = {value=arguments.farmerId, cfsqltype="cf_sql_integer"}};
        return queryExecute(sql, params);
    }

    public void function addFarmer(required struct farmerData) {
        var sql = "INSERT INTO farmers (first_name, last_name, email, phone, address)
                   VALUES (:firstName, :lastName, :email, :phone, :address)";
        var params = {
            firstName = {value=arguments.farmerData.firstName, cfsqltype="cf_sql_varchar"},
            lastName = {value=arguments.farmerData.lastName, cfsqltype="cf_sql_varchar"},
            email = {value=arguments.farmerData.email, cfsqltype="cf_sql_varchar"},
            phone = {value=arguments.farmerData.phone, cfsqltype="cf_sql_varchar"},
            address = {value=arguments.farmerData.address, cfsqltype="cf_sql_varchar"}
        };
        queryExecute(sql, params);
    }

    public void function updateFarmer(required numeric farmerId, required struct farmerData) {
        var sql = "UPDATE farmers
                   SET first_name = :firstName, last_name = :lastName,
                       email = :email, phone = :phone, address = :address
                   WHERE farmer_id = :farmerId";
        var params = {
            farmerId = {value=arguments.farmerId, cfsqltype="cf_sql_integer"},
            firstName = {value=arguments.farmerData.firstName, cfsqltype="cf_sql_varchar"},
            lastName = {value=arguments.farmerData.lastName, cfsqltype="cf_sql_varchar"},
            email = {value=arguments.farmerData.email, cfsqltype="cf_sql_varchar"},
            phone = {value=arguments.farmerData.phone, cfsqltype="cf_sql_varchar"},
            address = {value=arguments.farmerData.address, cfsqltype="cf_sql_varchar"}
        };
        queryExecute(sql, params);
    }

    public void function deleteFarmer(required numeric farmerId) {
        var sql = "DELETE FROM farmers WHERE farmer_id = :farmerId";
        var params = {farmerId = {value=arguments.farmerId, cfsqltype="cf_sql_integer"}};
        queryExecute(sql, params);
    }

    public query function getFarmerRentals(required numeric farmerId) {
        var sql = "SELECT er.*, e.name as equipment_name, e.model
                   FROM equipment_rentals er
                   INNER JOIN equipment e ON er.equipment_id = e.equipment_id
                   WHERE er.farmer_id = :farmerId
                   ORDER BY er.rental_start_date DESC";
        var params = {farmerId = {value=arguments.farmerId, cfsqltype="cf_sql_integer"}};
        return queryExecute(sql, params);
    }
}
