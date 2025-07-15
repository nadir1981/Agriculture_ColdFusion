<cfscript>
    rentalComponent = new components.Rental();
    rentalList = rentalComponent.getAllRentals();
</cfscript>

<cfoutput>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rental Management - Agriculture EMS</title>
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
        <h1 class="mb-4">Rental Management</h1>
        <a href="add_rental.cfm" class="btn btn-primary mb-3">Add New Rental</a>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Equipment</th>
                    <th>Farmer</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <cfloop query="rentalList">
                    <tr>
                        <td>#rentalList.rental_id#</td>
                        <td>#rentalList.equipment_name#</td>
                        <td>#rentalList.first_name# #rentalList.last_name#</td>
                        <td>#dateFormat(rentalList.rental_start_date, "yyyy-mm-dd")#</td>
                        <td>#dateFormat(rentalList.rental_end_date, "yyyy-mm-dd")#</td>
                        <td>#rentalList.status#</td>
                        <td>
                            <a href="edit_rental.cfm?id=#rentalList.rental_id#" class="btn btn-sm btn-primary">Edit</a>
                            <a href="delete_rental.cfm?id=#rentalList.rental_id#" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this rental?')">Delete</a>
                        </td>
                    </tr>
                </cfloop>
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
</cfoutput>
