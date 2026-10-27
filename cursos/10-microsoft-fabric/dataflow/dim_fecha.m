// dim_fecha: dimensión de fecha estándar, generada (no viene de ningún archivo).
// Cubre los años completos en los que hay ventas.
let
    Inicio = #date(Date.Year(List.Min(fact_ventas[OrderDate])), 1, 1),
    Fin = #date(Date.Year(List.Max(fact_ventas[OrderDate])), 12, 31),
    Fechas = List.Dates(Inicio, Duration.Days(Fin - Inicio) + 1, #duration(1, 0, 0, 0)),
    Tabla = Table.FromColumns({Fechas}, type table [Date = date]),
    DateKey = Table.AddColumn(Tabla, "DateKey", each Date.Year([Date]) * 10000 + Date.Month([Date]) * 100 + Date.Day([Date]), Int64.Type),
    Year = Table.AddColumn(DateKey, "Year", each Date.Year([Date]), Int64.Type),
    Quarter = Table.AddColumn(Year, "Quarter", each "T" & Text.From(Date.QuarterOfYear([Date])), type text),
    MonthNo = Table.AddColumn(Quarter, "MonthNo", each Date.Month([Date]), Int64.Type),
    MonthName = Table.AddColumn(MonthNo, "MonthName", each Date.ToText([Date], "MMMM", "es-ES"), type text),
    // Lunes = 1 ... domingo = 7
    DayOfWeek = Table.AddColumn(MonthName, "DayOfWeek", each Date.DayOfWeek([Date], Day.Monday) + 1, Int64.Type),
    DayName = Table.AddColumn(DayOfWeek, "DayName", each Date.ToText([Date], "dddd", "es-ES"), type text),
    IsWeekend = Table.AddColumn(DayName, "IsWeekend", each Date.DayOfWeek([Date], Day.Monday) >= 5, type logical)
in
    IsWeekend
