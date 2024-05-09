-- Sccsid:     @(#)dss.ri	2.1.8.1
-- TPCD Benchmark Version 8.0


--ALTER TABLE REGION DROP PRIMARY KEY;
--ALTER TABLE NATION DROP PRIMARY KEY;
--ALTER TABLE PART DROP PRIMARY KEY;
--ALTER TABLE SUPPLIER DROP PRIMARY KEY;
--ALTER TABLE PARTSUPP DROP PRIMARY KEY;
--ALTER TABLE ORDERS DROP PRIMARY KEY;
--ALTER TABLE LINEITEM DROP PRIMARY KEY;
--ALTER TABLE CUSTOMER DROP PRIMARY KEY;


-- For table REGION
ALTER TABLE REGION ADD CONSTRAINT REGION_PK PRIMARY KEY (R_REGIONKEY);

-- For table NATION
ALTER TABLE NATION ADD CONSTRAINT NATION_PK PRIMARY KEY (N_NATIONKEY);

ALTER TABLE NATION ADD CONSTRAINT NATION_FK1 FOREIGN KEY (N_REGIONKEY) references REGION(R_REGIONKEY);

-- For table PART
ALTER TABLE PART ADD CONSTRAINT PARTKEY_PK PRIMARY KEY (P_PARTKEY);


-- For table SUPPLIER
ALTER TABLE SUPPLIER ADD CONSTRAINT SUPPLIER_PK PRIMARY KEY (S_SUPPKEY);
ALTER TABLE SUPPLIER ADD CONSTRAINT SUPPLIER_FK1 FOREIGN KEY (S_NATIONKEY) references NATION(N_NATIONKEY);

-- For table PARTSUPP
ALTER TABLE PARTSUPP ADD CONSTRAINT PARTSUPP_PK PRIMARY KEY (PS_PARTKEY,PS_SUPPKEY);

-- For table CUSTOMER
ALTER TABLE CUSTOMER ADD CONSTRAINT CUSTOMER_PK PRIMARY KEY (C_CUSTKEY);
ALTER TABLE CUSTOMER ADD CONSTRAINT CUSTOMER_FK1 FOREIGN KEY (C_NATIONKEY) references NATION(N_NATIONKEY);

-- For table LINEITEM
ALTER TABLE LINEITEM ADD CONSTRAINT LINEITEM_PK PRIMARY KEY (L_ORDERKEY,L_LINENUMBER);

-- For table ORDERS
ALTER TABLE ORDERS ADD CONSTRAINT ORDERS_PK PRIMARY KEY (O_ORDERKEY);

-- For table PARTSUPP
ALTER TABLE PARTSUPP ADD CONSTRAINT PARTSUPP_FK1 FOREIGN KEY (PS_SUPPKEY) references SUPPLIER(S_SUPPKEY);
ALTER TABLE PARTSUPP ADD CONSTRAINT PARTSUPP_FK2 FOREIGN KEY (PS_PARTKEY) references PART(P_PARTKEY);

-- For table ORDERS
ALTER TABLE ORDERS ADD CONSTRAINT ORDERS_FK1 FOREIGN KEY (O_CUSTKEY) references CUSTOMER(C_CUSTKEY);

-- For table LINEITEM
ALTER TABLE LINEITEM ADD CONSTRAINT LINEITEM_FK1 FOREIGN KEY (L_ORDERKEY)  references ORDERS(O_ORDERKEY);
ALTER TABLE LINEITEM ADD CONSTRAINT LINEITEM_FK2 FOREIGN KEY (L_PARTKEY,L_SUPPKEY) references PARTSUPP(PS_PARTKEY, PS_SUPPKEY);
