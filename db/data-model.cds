namespace my.shop;

entity Products {
  key id     : UUID;
      name   : String;
      prices : Association to many PriceHistory
                 on prices.product = $self;
}

entity PriceHistory {
  key product   : Association to one Products;
  key priceDate : Timestamp @cds.on.insert: $now;
      price     : Double;
}


define view Test as
  SELECT from PriceHistory{
    product.id as productId,
    priceDate,
    price,
    ROW_NUMBER() OVER (PARTITION BY product.id ORDER BY priceDate DESC) AS rn
  };
    