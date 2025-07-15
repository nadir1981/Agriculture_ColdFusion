<cfscript>
    if (structKeyExists(url, "id")) {
        try {
            rentalComponent = new components.Rental();
            rentalComponent.deleteRental(url.id);
            location(url="rentals.cfm?message=Rental+deleted+successfully", addToken=false);
        } catch (any e) {
            location(url="rentals.cfm?message=Error:+Cannot+delete+rental", addToken=false);
        }
    } else {
        location(url="rentals.cfm", addToken=false);
    }
</cfscript>
