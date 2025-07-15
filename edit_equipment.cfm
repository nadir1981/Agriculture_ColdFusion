<cfscript>
    equipmentComponent = new components.Equipment();
    
    if (structKeyExists(url, "id")) {
        equipment = equipmentComponent.getEquipmentById(url.id);
    } else {
        location(url="equipment.cfm", addToken=false);
    }
    
    if (structKeyExists(form, "submitEquipment")) {
        equipmentData = {
            name = form.name,
            model = form.model,
            manufacturer = form.manufacturer,
            purchaseDate = form.purchaseDate,
            purchasePrice = form.purchasePrice,
            status = form.status
        };
        equipmentComponent.updateEquipment(url.id, equipmentData);
        location(url="equipment.cfm", addToken=false);
    }
</cfscript>

<cfoutput>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Equipment - Agriculture EMS</title>
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
                        <a class="nav-link active" href="equipment.cfm">Equipment</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="farmers.cfm">Farmers</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="rentals.cfm">Rentals</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <h1 class="mb-4">Edit Equipment</h1>
        <form action="edit_equipment.cfm?id=#url.id#" method="post">
            <div class="mb-3">
                <label for="name" class="form-label">Equipment Name</label>
                <input type="text" class="form-control" id="name" name="name" value="#equipment.name#" required>
            </div>
            <div class="mb-3">
                <label for="model" class="form-label">Model</label>
                <input type="text" class="form-control" id="model" name="model" value="#equipment.model#" required>
            </div>
            <div class="mb-3">
                <label for="manufacturer" class="form-label">Manufacturer</label>
                <input type="text" class="form-control" id="manufacturer" name="manufacturer" value="#equipment.manufacturer#" required>
            </div>
            <div class="mb-3">
                <label for="purchaseDate" class="form-label">Purchase Date</label>
                <input type="date" class="form-control" id="purchaseDate" name="purchaseDate" value="#dateFormat(equipment.purchase_date, 'yyyy-mm-dd')#" required>
            </div>
            <div class="mb-3">
                <label for="purchasePrice" class="form-label">Purchase Price</label>
                <input type="number" step="0.01" class="form-control" id="purchasePrice" name="purchasePrice" value="#equipment.purchase_price#" required>
            </div>
            <div class="mb-3">
                <label for="status" class="form-label">Status</label>
                <select class="form-select" id="status" name="status" required>
                    <option value="Available" <cfif equipment.status EQ "Available">selected</cfif>>Available</option>
                    <option value="In Use" <cfif equipment.status EQ "In Use">selected</cfif>>In Use</option>
                    <option value="Under Maintenance" <cfif equipment.status EQ "Under Maintenance">selected</cfif>>Under Maintenance</option>
                    <option value="Retired" <cfif equipment.status EQ "Retired">selected</cfif>>Retired</option>
                </select>
            </div>
            <button type="submit" name="submitEquipment" class="btn btn-primary">Update Equipment</button>
            <a href="equipment.cfm" class="btn btn-secondary">Cancel</a>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
</cfoutput>
