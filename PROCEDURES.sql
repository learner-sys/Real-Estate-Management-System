create or replace PROCEDURE Monthly_report(
    p_year IN NUMBER,
    p_month IN NUMBER
)
IS
BEGIN
    FOR owner_info IN (
        SELECT po.owner_id, po.name AS owner_name, 
               COUNT(ra.rental_id) AS rented_properties,
               (SELECT COUNT(*) FROM property_listings pl
                WHERE pl.owner_id = po.owner_id
                AND pl.listing_id NOT IN (
                    SELECT ra.listing_id
                    FROM Rental_agreements ra
                    WHERE EXTRACT(YEAR FROM ra.start_date) = p_year
                      AND EXTRACT(MONTH FROM ra.start_date) = p_month
                )) AS not_rented_properties,
               NVL(SUM(ra.rent), 0) AS total_rentals
        FROM property_owners po
        LEFT JOIN property_listings pl ON po.owner_id = pl.owner_id
        LEFT JOIN Rental_agreements ra ON pl.listing_id = ra.listing_id
        WHERE EXTRACT(YEAR FROM ra.start_date) = p_year
          AND EXTRACT(MONTH FROM ra.start_date) = p_month
        GROUP BY po.owner_id, po.name
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE('Owner ID: ' || owner_info.owner_id);
        DBMS_OUTPUT.PUT_LINE('Owner Name: ' || owner_info.owner_name);
        DBMS_OUTPUT.PUT_LINE('Number of Rented Properties: ' || owner_info.rented_properties);
        DBMS_OUTPUT.PUT_LINE('Number of Not Rented Properties: ' || owner_info.not_rented_properties);
        DBMS_OUTPUT.PUT_LINE('Total Rentals: $' || owner_info.total_rentals);
        DBMS_OUTPUT.PUT_LINE('-----------------------------------');
    END LOOP;
    
    -- Enable DBMS_OUTPUT to display the results
    DBMS_OUTPUT.ENABLE(1000000);
END;
/



create or replace PROCEDURE tenant_services(p_tenant_name IN VARCHAR2)
IS
BEGIN
    FOR tenant_rec IN (SELECT t.tenant_id, t.name, mr.request_id, mr.request_date, mr.description, mr.status
                       FROM Tenants t
                       JOIN Maintenance_Requests mr ON t.tenant_id = mr.tenant_id
                       WHERE t.name = p_tenant_name)
    LOOP
        DBMS_OUTPUT.PUT_LINE('Tenant ID: ' || tenant_rec.tenant_id);
        DBMS_OUTPUT.PUT_LINE('Tenant Name: ' || tenant_rec.name);
        DBMS_OUTPUT.PUT_LINE('Request ID: ' || tenant_rec.request_id);
        DBMS_OUTPUT.PUT_LINE('Request Date: ' || tenant_rec.request_date);
        DBMS_OUTPUT.PUT_LINE('Description: ' || tenant_rec.description);
        DBMS_OUTPUT.PUT_LINE('Status: ' || tenant_rec.status);
        DBMS_OUTPUT.PUT_LINE('----------------------------------------');
    END LOOP;
END;
/


create or replace PROCEDURE add_tenant(
    p_name IN VARCHAR2,
    p_phone_number IN VARCHAR2,
    p_email IN VARCHAR2
)
IS
BEGIN
    INSERT INTO Tenants (name, phone_number, email)
    VALUES (p_name, p_phone_number, p_email);
    
    COMMIT;
END;
/


create or replace PROCEDURE add_rental_agreement(
    p_property_id IN NUMBER,
    p_tenant_id IN NUMBER,
    p_start_date IN DATE,
    p_end_date IN DATE,
    p_rent IN NUMBER
)
IS
    v_property_exists NUMBER;
    v_tenant_exists NUMBER;
    v_listing_id NUMBER;
BEGIN
    -- Check if the property exists
    v_property_exists := Check_property_id(p_property_id);
    -- Check if the tenant exists
    v_tenant_exists := Check_tenant_id(p_tenant_id);
    -- If the property doesn't exist, print an error message
    IF v_property_exists = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Invalid property_id. Please provide a valid property_id.');
        RETURN;
    END IF;
    -- If the tenant doesn't exist, print an error message
    IF v_tenant_exists = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Invalid tenant_id. Please provide a valid tenant_id.');
        RETURN;
    END IF;
    -- Find the listing_id for the given property_id
    SELECT listing_id INTO v_listing_id
    FROM property_listings
    WHERE property_id = p_property_id;
    -- Insert the rental agreement
    INSERT INTO Rental_agreements (listing_id, tenant_id, start_date, end_date, rent)
    VALUES (v_listing_id, p_tenant_id, p_start_date, p_end_date, p_rent);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Rental agreement inserted successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: Failed to insert rental agreement.');
        DBMS_OUTPUT.PUT_LINE('Error code: ' || SQLCODE);
        DBMS_OUTPUT.PUT_LINE('Error message: ' || SQLERRM);
        ROLLBACK;
END;
/