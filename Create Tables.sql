CREATE TABLE Categories (
	ID UNIQUEIDENTIFIER NOT NULL,
	ClusterKey INT IDENTITY(1,1) NOT NULL,
	Name varchar(50) UNIQUE
);

ALTER TABLE Categories
ADD CONSTRAINT PK_Categories
PRIMARY KEY NONCLUSTERED (ID);

CREATE UNIQUE CLUSTERED INDEX CIX_Categories ON Categories(ClusterKey);

CREATE TABLE DataTypes (
	ID UNIQUEIDENTIFIER NOT NULL,
	ClusterKey INT IDENTITY(1,1) NOT NULL,
	Name varchar(50) UNIQUE
);

ALTER TABLE DataTypes
ADD CONSTRAINT PK_DataTypes
PRIMARY KEY NONCLUSTERED (ID);

CREATE UNIQUE CLUSTERED INDEX CIX_DataTypes ON DataTypes(ClusterKey);

CREATE TABLE CategoryFields (
	ID UNIQUEIDENTIFIER NOT NULL,
	ClusterKey INT IDENTITY(1,1) NOT NULL,
	CategoryID UNIQUEIDENTIFIER NOT NULL,
	DataTypeID UNIQUEIDENTIFIER NOT NULL,
	Name varchar(50) DEFAULT 'New Field',
	Order int(2) DEFAULT 0,
	Default varchar(50),
	FOREIGN KEY (CategoryID) REFERENCES Categories(ID),
	FOREIGN KEY (DataTypeID) REFERENCES DataTypes(ID)
);

ALTER TABLE CategoryFields
ADD CONSTRAINT PK_CategoryFields
PRIMARY KEY NONCLUSTERED (ID);

CREATE UNIQUE CLUSTERED INDEX CIX_CategoryFields ON CategoryFields(ClusterKey);

CREATE TABLE Items (
	ID UNIQUEIDENTIFIER NOT NULL,
	ClusterKey INT IDENTITY(1,1) NOT NULL,
	CategoryID UNIQUEIDENTIFIER NOT NULL,
	FOREIGN KEY (CategoryID) REFERENCES Categories(ID)
);

ALTER TABLE Items
ADD CONSTRAINT PK_Items
PRIMARY KEY NONCLUSTERED (ID);

CREATE UNIQUE CLUSTERED INDEX CIX_Items ON Items(ClusterKey);

CREATE TABLE ItemFields (
	ID UNIQUEIDENTIFIER NOT NULL,
	ClusterKey INT IDENTITY(1,1) NOT NULL,
	ItemID UNIQUEIDENTIFIER NOT NULL,
	CategoryFieldID UNIQUEIDENTIFIER NOT NULL,
	Data varchar(100),
	FOREIGN KEY (ItemID) REFERENCES Items(ID),
	FOREIGN KEY (CategoryFieldID) REFERENCES CategorieFields(ID)
);

ALTER TABLE ItemFields
ADD CONSTRAINT PK_ItemFields
PRIMARY KEY NONCLUSTERED (ID);

CREATE UNIQUE CLUSTERED INDEX CIX_ItemFields ON ItemFields(ClusterKey);