create or replace FUNCTION Check_property_id(p_property_id IN NUMBER)
RETURN NUMBER
IS
    v_property_count NUMBER := 0;
BEGIN
    SELECT COUNT(*) INTO v_property_count
    FROM properties
    WHERE property_id = p_property_id;
    
    RETURN v_property_count;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN v_property_count;
END;
/


create or replace FUNCTION Check_tenant_id(p_tenant_id IN NUMBER)
RETURN NUMBER
IS
    v_tenant_count NUMBER := 0;
BEGIN
    SELECT COUNT(*) INTO v_tenant_count
    FROM Tenants
    WHERE tenant_id = p_tenant_id;
    
    RETURN v_tenant_count;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN v_tenant_count;
END;
/