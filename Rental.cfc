component {
    public function init() {
        return this;
    }

    public query function getAllRentals() {
        var sql = "SELECT er.*, e.name as equipment_name, f.first_name, f.last_name
                   FROM equipment_rentals er
                   INNER JOIN equipment e ON er.equipment_id = e.equipment_id
                   INNER JOIN farmers f ON er.farmer_id = f.farmer_id
                   ORDER BY er.rental_start_date DESC";
        return queryExecute(sql);
    }

    public query function getRentalById(required numeric rentalId) {
        var sql = "SELECT er.*, e.name as equipment_name, f.first_name, f.last_name
                   FROM equipment_rentals er
                   INNER JOIN equipment e ON er.equipment_id = e.equipment_id
                   INNER JOIN farmers f ON er.farmer_id = f.farmer_id
                   WHERE er.rental_id = :rentalId";
        var params = {rentalId = {value=arguments.rentalId, cfsqltype="cf_sql_integer"}};
        return queryExecute(sql, params);
    }

    public void function addRental(required struct rentalData) {
        var sql = "INSERT INTO equipment_rentals (equipment_id, farmer_id, rental_start_date, rental_end_date, rental_price, status)
                   VALUES (:equipmentId, :farmerId, :rentalStartDate, :rentalEndDate, :rentalPrice, :status)";
        var params = {
            equipmentId = {value=arguments.rentalData.equipmentId, cfsqltype="cf_sql_integer"},
            farmerId = {value=arguments.rentalData.farmerId, cfsqltype="cf_sql_integer"},
            rentalStartDate = {value=arguments.rentalData.rentalStartDate, cfsqltype="cf_sql_date"},
            rentalEndDate = {value=arguments.rentalData.rentalEndDate, cfsqltype="cf_sql_date"},
            rentalPrice = {value=arguments.rentalData.rentalPrice, cfsqltype="cf_sql_decimal"},
            status = {value=arguments.rentalData.status, cfsqltype="cf_sql_varchar"}
        };
        queryExecute(sql, params);
    }

    public void function updateRental(required numeric rentalId, required struct rentalData) {
        var sql = "UPDATE equipment_rentals
                   SET equipment_id = :equipmentId, farmer_id = :farmerId,
                       rental_start_date = :rentalStartDate, rental_end_date = :rentalEndDate,
                       rental_price = :rentalPrice, status = :status
                   WHERE rental_id = :rentalId";
        var params = {
            rentalId = {value=arguments.rentalId, cfsqltype="cf_sql_integer"},
            equipmentId = {value=arguments.rentalData.equipmentId, cfsqltype="cf_sql_integer"},
            farmerId = {value=arguments.rentalData.farmerId, cfsqltype="cf_sql_integer"},
            rentalStartDate = {value=arguments.rentalData.rentalStartDate, cfsqltype="cf_sql_date"},
            rentalEndDate = {value=arguments.rentalData.rentalEndDate, cfsqltype="cf_sql_date"},
            rentalPrice = {value=arguments.rentalData.rentalPrice, cfsqltype="cf_sql_decimal"},
            status = {value=arguments.rentalData.status, cfsqltype="cf_sql_varchar"}
        };
        queryExecute(sql, params);
    }

    public void function deleteRental(required numeric rentalId) {
        var sql = "DELETE FROM equipment_rentals WHERE rental_id = :rentalId";
        var params = {rentalId = {value=arguments.rentalId, cfsqltype="cf_sql_integer"}};
        queryExecute(sql, params);
    }

    public query function getActiveRentals() {
        var sql = "SELECT er.*, e.name as equipment_name, f.first_name, f.last_name
                   FROM equipment_rentals er
                   INNER JOIN equipment e ON er.equipment_id = e.equipment_id
                   INNER JOIN farmers f ON er.farmer_id = f.farmer_id
                   WHERE er.status = 'Active'
                   ORDER BY er.rental_start_date DESC";
        return queryExecute(sql);
    }
}
