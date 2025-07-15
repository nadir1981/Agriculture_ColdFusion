<cfscript>
    if (structKeyExists(url, "id")) {
        try {
            farmerComponent = new components.Farmer();
            farmerComponent.deleteFarmer(url.id);
            location(url="farmers.cfm?message=Farmer+deleted+successfully", addToken=false);
        } catch (any e) {
            location(url="farmers.cfm?message=Error:+Cannot+delete+farmer+with+active+rentals", addToken=false);
        }
    } else {
        location(url="farmers.cfm", addToken=false);
    }
</cfscript>
