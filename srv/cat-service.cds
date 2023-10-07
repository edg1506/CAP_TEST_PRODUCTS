using my.shop as my from '../db/data-model';

service CatalogService {
    entity Products as projection on my.Products;
    @cds.redirection.target: true
    entity PriceHistory as projection on my.PriceHistory;
    entity Test as projection on my.Test;
}
