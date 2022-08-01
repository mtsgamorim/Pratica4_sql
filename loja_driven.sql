CREATE TABLE "public.users" (
	"id" serial NOT NULL,
	"name" varchar(50) NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	"adressId" integer NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	"price" integer NOT NULL,
	"principalPhoto" integer NOT NULL,
	"categoryId" integer,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.category" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "category_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.productSize" (
	"id" serial NOT NULL,
	"size" varchar(3) NOT NULL UNIQUE,
	CONSTRAINT "productSize_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.address" (
	"id" serial NOT NULL,
	"country" varchar(50) NOT NULL,
	"state" TEXT NOT NULL,
	"city" TEXT NOT NULL,
	"zipcode" varchar(8) NOT NULL,
	"district" TEXT NOT NULL,
	"street" TEXT NOT NULL,
	"number" integer NOT NULL,
	CONSTRAINT "address_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.purchases" (
	"id" serial NOT NULL,
	"userId" integer NOT NULL,
	"statusId" integer NOT NULL,
	"date" TIMESTAMP NOT NULL DEFAULT NOW(),
	CONSTRAINT "purchases_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.purchaseStatus" (
	"id" serial NOT NULL,
	"status" TEXT NOT NULL UNIQUE,
	CONSTRAINT "purchaseStatus_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.photos" (
	"id" serial NOT NULL,
	"url" TEXT NOT NULL,
	"productId" integer NOT NULL,
	CONSTRAINT "photos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.order" (
	"id" serial NOT NULL,
	"purchaseId" integer NOT NULL,
	"productId" integer NOT NULL,
	"quantity" integer NOT NULL,
	"sizeId" integer NOT NULL,
	CONSTRAINT "order_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "users" ADD CONSTRAINT "users_fk0" FOREIGN KEY ("adressId") REFERENCES "address"("id");

ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("principalPhoto") REFERENCES "photos"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk1" FOREIGN KEY ("categoryId") REFERENCES "category"("id");




ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk1" FOREIGN KEY ("statusId") REFERENCES "purchaseStatus"("id");


ALTER TABLE "photos" ADD CONSTRAINT "photos_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");

ALTER TABLE "order" ADD CONSTRAINT "order_fk0" FOREIGN KEY ("purchaseId") REFERENCES "purchases"("id");
ALTER TABLE "order" ADD CONSTRAINT "order_fk1" FOREIGN KEY ("productId") REFERENCES "products"("id");
ALTER TABLE "order" ADD CONSTRAINT "order_fk2" FOREIGN KEY ("sizeId") REFERENCES "productSize"("id");










