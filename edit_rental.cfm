<cfscript>
    equipmentComponent = new components.Equipment();
    farmerComponent = new components.Farmer();
    rentalComponent = new components.Rental();
    
    equipmentList = equipmentComponent.getAllEquipment();
    farmerList = farmerComponent.getAllFarmers();
    
    if (structKeyExists(url, "id")) {
        rental = rentalComponent.getRentalById(url.id);
    } else {
        location(url="rentals.cfm", addToken=false);
    }
    
    if (structKeyExists(form, "submitRental")) {
        rentalData = {
            equipmentId = form.equipmentId,
            farmerId = form.farmerId,
            rentalStartDate = form.rentalStartDate,
            rentalEndDate = form.rentalEndDate,
            rentalPrice = form.rentalPrice,
            status = form.status
        };
        rentalComponent.updateRental(url.id, rentalData);
        location(url="rentals.cfm", addToken=false);
    }
</cfscript>

<cfoutput>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Rental - Agriculture EMS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="index.cfm">Agriculture-EMS</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="equipment.cfm">Equipment</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="farmers.cfm">Farmers</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="rentals.cfm">Rentals</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <h1 class="mb-4">Edit Rental</h1>
        <form action="edit_rental.cfm?id=#url.id#" method="post">
            <div class="mb-3">
                <label for="equipmentId" class="form-label">Equipment</label>
                <select class="form-select" id="equipmentId" name="equipmentId" required>
                    <cfloop query="equipmentList">
                        <option value="#equipmentList.equipment_id#" <cfif equipmentList.equipment_id EQ rental.equipment_id>selected</cfif>>#equipmentList.name# (#equipmentList.model#)</option>
                    </cfloop>
                </select>
            </div>
            <div class="mb-3">
                <label for="farmerId" class="form-label">Farmer</label>
                <select class="form-select" id="farmerId" name="farmerId" required>
                    <cfloop query="farmerList">
                        <option value="#farmerList.farmer_id#" <cfif farmerList.farmer_id EQ rental.farmer_id>selected</cfif>>#farmerList.first_name# #farmerList.last_name#</option>
                    </cfloop>
                </select>
            </div>
            <div class="mb-3">
                <label for="rentalStartDate" class="form-label">Rental Start Date</label>
                <input type="date" class="form-control" id="rentalStartDate" name="rentalStartDate" value="#dateFormat(rental.rental_start_date, 'yyyy-mm-dd')#" required>
            </div>
            <div class="mb-3">
                <label for="rentalEndDate" class="form-label">Rental End Date</label>
                <input type="date" class="form-control" id="rentalEndDate" name="rentalEndDate" value="#dateFormat(rental.rental_end_date, 'yyyy-mm-dd')#" required>
            </div>
            <div class="mb-3">
                <label for="rentalPrice" class="form-label">Rental Price</label>
                <input type="number" step="0.01" class="form-control" id="rentalPrice" name="rentalPrice" value="#rental.rental_price#" required>
            </div>
            <div class="mb-3">
                <label for="status" class="form-label">Status</label>
                <select class="form-select" id="status" name="status" required>
                    <option value="Active" <cfif rental.status EQ "Active">selected</cfif>>Active</option>
                    <option value="Completed" <cfif rental.status EQ "Completed">selected</cfif>>Completed</option>
                    <option value="Cancelled" <cfif rental.status EQ "Cancelled">selected</cfif>>Cancelled</option>
                </select>
            </div>
            <button type="submit" name="submitRental" class="btn btn-primary">Update Rental</button>
            <a href="rentals.cfm" class="btn btn-secondary">Cancel</a>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
</cfoutput>
