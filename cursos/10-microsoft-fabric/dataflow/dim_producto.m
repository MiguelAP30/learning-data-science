// dim_producto: catálogo de productos.
let
    Origen = Csv.Document(Web.Contents(UrlBase, [RelativePath = "products.csv"]),
        [Delimiter = ",", Columns = 4, Encoding = 65001, QuoteStyle = QuoteStyle.Csv]),
    Encabezados = Table.PromoteHeaders(Origen, [PromoteAllScalars = true]),
    // Cultura en-US: el punto es el separador decimal en el CSV
    Tipos = Table.TransformColumnTypes(Encabezados,
        {{"ProductID", Int64.Type}, {"ProductName", type text}, {"Category", type text}, {"ListPrice", type number}}, "en-US"),
    Recortado = Table.TransformColumns(Tipos, {{"ProductName", Text.Trim, type text}, {"Category", Text.Trim, type text}}),
    SinDuplicados = Table.Distinct(Recortado, {"ProductID"})
in
    SinDuplicados
