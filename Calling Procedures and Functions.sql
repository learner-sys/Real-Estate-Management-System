--calling monthly report procedure
BEGIN
  Monthly_report(
    p_year => 2024, p_month => 6
  );
END;

--calling tanent service procedure
BEGIN
tenant_services(p_tenant_name => 'Ahmed Mahmood'):
END;

--calling add tanent procedure
BEGIN
 add_tenant(
    p_name =>'Sara Ali',
    p_phone_number => 12345678,
    p_email => 'saraa@gmail.com'
);
END;

--calling add rent agreement
BEGIN
    Add_Rental_Agreement(6, 29, TO_DATE('2024-06-01', 'YYYY-MM-DD'), TO_DATE('2024-12-31', 'YYYY-MM-DD'), 1000);
END;

--calling check property id
DECLARE
    v_property_exists NUMBER;
BEGIN
    v_property_exists := Check_property_id(14);
    
    IF v_property_exists > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Property exists.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Property does not exist.');
    END IF;
END;
/

--calling check tanunt id
DECLARE
    v_tenant_exists NUMBER;
BEGIN
    v_tenant_exists := Check_tenant_id(7);
    
    IF v_tenant_exists > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Tenant exists.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Tenant does not exist.');
    END IF;
END;
/