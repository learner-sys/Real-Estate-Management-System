CREATE TABLE properties
(
    property_id    NUMBER(3),
    address        VARCHAR2(50),
    city           VARCHAR2(50),
    size           NUMBER,
    num_bedrooms   NUMBER,
    num_bathrooms  NUMBER,
    CONSTRAINT properties_PK PRIMARY KEY (property_id)
);

CREATE TABLE property_owners
(
    owner_id       NUMBER(3),
    name           VARCHAR2(50),
    phone_number   VARCHAR2(50),
    email          VARCHAR2(50),
    CONSTRAINT property_owners_PK PRIMARY KEY (owner_id)
);

CREATE TABLE property_listings
(
    listing_id     NUMBER(3),
    property_id    NUMBER(3),
    owner_id       NUMBER(3),
    price          NUMBER,
    status         VARCHAR(50),
    description    VARCHAR(50),
    CONSTRAINT property_listings_PK PRIMARY KEY (listing_id),
    CONSTRAINT property_listings_PROPERTIES_FK FOREIGN KEY (property_id) REFERENCES properties (property_id),
    CONSTRAINT property_listings_OWNERS_FK FOREIGN KEY (owner_id) REFERENCES property_owners (owner_id)
);

CREATE TABLE Tenants
(
    tenant_id      NUMBER(3),
    name           VARCHAR2(50),
    phone_number   VARCHAR2(50),
    email          VARCHAR2(50),
    CONSTRAINT Tenants_PK PRIMARY KEY (tenant_id)
);

CREATE TABLE Rental_agreements
(
    rental_id      NUMBER(3),
    listing_id     NUMBER(3),
    tenant_id      NUMBER(3),
    start_date     DATE,
    end_date       DATE,
    rent           NUMBER,
    CONSTRAINT Rental_agreements_PK PRIMARY KEY (rental_id),
    CONSTRAINT Rental_agreements_property_listings_FK FOREIGN KEY (listing_id) REFERENCES property_listings (listing_id),
    CONSTRAINT Rental_agreements_Tenants_FK FOREIGN KEY (tenant_id) REFERENCES Tenants (tenant_id)
);

CREATE TABLE Maintenance_Requests
(
    request_id     NUMBER(3),
    property_id    NUMBER(3),
    tenant_id      NUMBER(3),
    request_date   DATE,
    description    VARCHAR2(50),
    status         VARCHAR2(50),
    CONSTRAINT Maintenance_Requests_PK PRIMARY KEY (request_id),
    CONSTRAINT Maintenance_Requests_properties_FK FOREIGN KEY (property_id) REFERENCES properties (property_id),
    CONSTRAINT Maintenance_Requests_Tenants_FK FOREIGN KEY (tenant_id) REFERENCES Tenants (tenant_id)
);
