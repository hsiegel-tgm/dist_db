	DROP TABLE Vendor2Mensa;
	DROP TABLE Order2Ingredient;
	DROP TABLE Ingredient2Vendor;
	DROP TABLE Meal2Menu;
	DROP TABLE Meal2Ingredient;	
	DROP TABLE Meal;
	DROP TABLE Storage;
	DROP TABLE Ingredient;
	DROP TABLE Day;
	DROP TABLE Served;
	DROP TABLE Menu;
	DROP TABLE Bill;
	DROP TABLE Orders;
	DROP TABLE Vendor;
	DROP TABLE Mensa;

	
	CREATE TABLE Ingredient (
		ID INT NOT NULL,
		name VARCHAR(255) NOT NULL,
		unit VARCHAR2(10) CHECK( unit IN ('kg','l') ),
		price FLOAT NOT NULL,
		PRIMARY KEY (ID)
	);
	
	INSERT INTO Ingredient (ID, name, unit, price) VALUES (1, 'zutat1', 'kg', 2.31);
	
	CREATE TABLE MEAL (
		ID INT NOT NULL,
		name VARCHAR(255) NOT NULL,
		unit VARCHAR(10) CHECK( unit IN ('main_dish','dessert','starter')),
		PRIMARY KEY (ID)
	);
	
	CREATE TABLE MEAL2INGREDIENT (
		ID_meal INT NOT NULL,
		ID_ingredient INT NOT NULL
	);
	
	ALTER TABLE MEAL2INGREDIENT ADD CONSTRAINT FK_meal_0 FOREIGN KEY (ID_meal) REFERENCES Meal (ID);
	ALTER TABLE MEAL2INGREDIENT ADD CONSTRAINT FK_ingredient_0 FOREIGN KEY (ID_ingredient) REFERENCES Ingredient (ID);
	
	CREATE TABLE Day (
		date_stamp DATE NOT NULL,
		PRIMARY KEY (date_stamp)
	);
	
	CREATE TABLE Menu (
		ID INT NOT NULL,
		price FLOAT NOT NULL,
		name VARCHAR(255) NOT NULL,
		PRIMARY KEY (ID)
	);	
		
	CREATE TABLE MEAL2MENU(
		type VARCHAR(10) CHECK( type IN ('starter','main_dish','dessert')),
		ID_menu INT NOT NULL,
		ID_meal INT NOT NULL
	);
	
	ALTER TABLE MEAL2MENU ADD CONSTRAINT FK_menu_0 FOREIGN KEY (ID_menu) REFERENCES Menu (ID);
	ALTER TABLE MEAL2MENU ADD CONSTRAINT FK_meal_1 FOREIGN KEY (ID_meal) REFERENCES Meal (ID);
	
		
	CREATE TABLE Served (
		ID_menu INT NOT NULL,
		date_stamp DATE NOT NULL
	);
	
	ALTER TABLE Served ADD CONSTRAINT FK_menu_1 FOREIGN KEY (ID_menu) REFERENCES Menu (ID);
	ALTER TABLE Served ADD CONSTRAINT FK_Day_0 FOREIGN KEY (date_stamp) REFERENCES Day (date_stamp);
		

	CREATE TABLE Vendor (
		ID INT NOT NULL,
		address  VARCHAR(255) NOT NULL, 
		PRIMARY KEY (ID)
	);
			
	CREATE TABLE Ingredient2Vendor (
		ID_vendor INT NOT NULL,
		ID_ingredient INT NOT NULL
	);
	
	ALTER TABLE Ingredient2Vendor ADD CONSTRAINT FK_vendor_0 FOREIGN KEY (ID_vendor) REFERENCES Vendor (ID);
	ALTER TABLE Ingredient2Vendor ADD CONSTRAINT FK_ingredient_1 FOREIGN KEY (ID_ingredient) REFERENCES Vendor (ID);
			
	CREATE TABLE Orders (
		ID INT NOT NULL,
		ID_vendor INT NOT NULL,
		date_ordered DATE NOT NULL,
		date_delivered DATE NOT NULL,
		PRIMARY KEY (ID)
	);
	
	ALTER TABLE Orders ADD CONSTRAINT FK_vendor_1 FOREIGN KEY (ID_vendor) REFERENCES Vendor (ID);
		
	CREATE TABLE Mensa (
		ID INT NOT NULL,
		university_name VARCHAR(255) NOT NULL,
		PRIMARY KEY (ID)
	);
		
	CREATE TABLE Storage (
		ID_ingredient INT NOT NULL,
		quantity INT,
		PRIMARY KEY (ID_ingredient)
	);
		
	CREATE TABLE Bill(
		ID_orders INT NOT NULL,
		IBAN VARCHAR(40) NOT NULL,
		BIC VARCHAR(40) NOT NULL,
		total_sum FLOAT
	);
	
	ALTER TABLE Bill ADD CONSTRAINT FK_orders_0 FOREIGN KEY (ID_orders) REFERENCES Orders (ID);
		
	CREATE TABLE Order2Ingredient (
		ID_orders INT NOT NULL,
		ID_ingredient INT NOT NULL,
		quantity INT NOT NULL,
		prie FLOAT NOT NULL
	);
	
	ALTER TABLE Order2Ingredient ADD CONSTRAINT FK_orders_1 FOREIGN KEY (ID_orders) REFERENCES Orders (ID);
	ALTER TABLE Order2Ingredient ADD CONSTRAINT FK_ingredient_2 FOREIGN KEY (ID_ingredient) REFERENCES INGREDIENT (ID);
	
	CREATE TABLE Vendor2Mensa (
		ID_mensa INT NOT NULL,
		ID_vendor INT NOT NULL
	);
	
	ALTER TABLE Vendor2Mensa ADD CONSTRAINT FK_mensa_0 FOREIGN KEY (ID_mensa) REFERENCES Mensa (ID);
	ALTER TABLE Vendor2Mensa ADD CONSTRAINT FK_vendor_2 FOREIGN KEY (ID_vendor) REFERENCES Vendor (ID);