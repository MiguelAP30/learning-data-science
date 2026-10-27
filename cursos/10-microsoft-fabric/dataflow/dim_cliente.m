// dim_cliente: clientes, sin datos personales innecesarios para el análisis.
let
    Origen = Csv.Document(Web.Contents(UrlBase, [RelativePath = "customers.csv"]),
        [Delimiter = ",", Columns = 4, Encoding = 65001, QuoteStyle = QuoteStyle.Csv]),
    Encabezados = Table.PromoteHeaders(Origen, [PromoteAllScalars = true]),
    Tipos = Table.TransformColumnTypes(Encabezados,
        {{"CustomerID", Int64.Type}, {"FirstName", type text}, {"LastName", type text}, {"EmailAddress", type text}}),
    NombreCompleto = Table.AddColumn(Tipos, "CustomerName", each Text.Trim([FirstName]) & " " & Text.Trim([LastName]), type text),
    Dominio = Table.AddColumn(NombreCompleto, "EmailDomain", each Text.AfterDelimiter([EmailAddress], "@"), type text),
    // El correo completo es un dato personal: los flujos de datos no admiten seguridad de nivel de fila,
    // así que lo que no hace falta para analizar no se publica
    Columnas = Table.SelectColumns(Dominio, {"CustomerID", "CustomerName", "EmailDomain"}),
    SinDuplicados = Table.Distinct(Columnas, {"CustomerID"})
in
    SinDuplicados
