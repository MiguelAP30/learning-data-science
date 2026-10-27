// ventas_mensuales: resumen por mes y categoría, listo para un informe.
// Hace referencia a fact_ventas (no relee el CSV) y la combina con dim_producto.
let
    Origen = fact_ventas,
    ConProducto = Table.NestedJoin(Origen, {"ProductID"}, dim_producto, {"ProductID"}, "Producto", JoinKind.LeftOuter),
    Categoria = Table.ExpandTableColumn(ConProducto, "Producto", {"Category"}, {"Category"}),
    // Las columnas expandidas llegan sin tipo y el destino Lakehouse no admite el tipo "any"
    CategoriaTipo = Table.TransformColumnTypes(Categoria, {{"Category", type text}}),
    Agrupado = Table.Group(CategoriaTipo, {"Year", "MonthNo", "Category"}, {
        {"Pedidos", each List.Count(List.Distinct([SalesOrderID])), Int64.Type},
        {"Unidades", each List.Sum([OrderQty]), Int64.Type},
        {"Ventas", each Number.Round(List.Sum([LineItemTotal]), 2), type number}}),
    Ordenado = Table.Sort(Agrupado, {{"Year", Order.Ascending}, {"MonthNo", Order.Ascending}, {"Ventas", Order.Descending}})
in
    Ordenado
