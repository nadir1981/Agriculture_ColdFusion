<cfscript>
    if (structKeyExists(url, "id")) {
        try {
            equipmentComponent = new components.Equipment();
            equipmentComponent.deleteEquipment(url.id);
            location(url="equipment.cfm?message=Equipment+deleted+successfully", addToken=false);
        } catch (any e) {
            location(url="equipment.cfm?message=Error:+Cannot+delete+equipment+that+is+currently+in+use", addToken=false);
        }
    } else {
        location(url="equipment.cfm", addToken=false);
    }
</cfscript>
