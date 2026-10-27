// fact_ventas: una fila por línea de pedido.
let
    Origen = Csv.Document(Web.Contents(UrlBase, [RelativePath = "orders.csv"]),
        [Delimiter = ",", Columns = 7, Encoding = 65001, QuoteStyle = QuoteStyle.Csv]),
    Encabezados = Table.PromoteHeaders(Origen, [PromoteAllScalars = true]),
    Tipos = Table.TransformColumnTypes(Encabezados,
        {{"SalesOrderID", Int64.Type}, {"OrderDate", type date}, {"CustomerID", Int64.Type}, {"LineItem", Int64.Type},
         {"ProductID", Int64.Type}, {"OrderQty", Int64.Type}, {"LineItemTotal", type number}}, "en-US"),
    // Clave natural: pedido + línea. Si el origen repite una línea, se queda una
    SinDuplicados = Table.Distinct(Tipos, {"SalesOrderID", "LineItem"}),
    Validas = Table.SelectRows(SinDuplicados, each [OrderDate] <> null and [OrderQty] > 0 and [LineItemTotal] >= 0),
    // Columna personalizada del laboratorio
    MonthNo = Table.AddColumn(Validas, "MonthNo", each Date.Month([OrderDate]), Int64.Type),
    Year = Table.AddColumn(MonthNo, "Year", each Date.Year([OrderDate]), Int64.Type),
    UnitPrice = Table.AddColumn(Year, "UnitPrice", each Number.Round([LineItemTotal] / [OrderQty], 2), type number),
    // Clave de fecha (aaaammdd) para relacionar con dim_fecha
    DateKey = Table.AddColumn(UnitPrice, "DateKey",
        each Date.Year([OrderDate]) * 10000 + Date.Month([OrderDate]) * 100 + Date.Day([OrderDate]), Int64.Type)
in
    DateKey
