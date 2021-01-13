using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI.WebControls;

namespace GUCera
{
    public static class Util
    {
       
        public const string LogInTypeAdmin = "1";
        public const string LogInTypeInstructor = "0";
        public const string LogInTypeStudent = "2";
        
        public static void FillTable(Table table, SqlDataReader reader, string[] attributes)
        {
            table.ForeColor = GetColor("333333");
            table.CellPadding = 4;
            table.HorizontalAlign = HorizontalAlign.Center;
            table.Width = 500;
            table.Height = 100;
            table.CssClass = "auto-style3";
            table.Rows.Add(CreateHeaderRow(attributes));
            while (reader.Read())
            {
                table.Rows.Add(CreateRow(reader, attributes));
            }
        }
        private static TableRow CreateRow(SqlDataReader reader, string[] attributes)
        {
            TableRow row = new TableRow {BackColor = GetColor("E3EAEB")};
            foreach (var attribute in attributes)
            {
                TableCell cell = new TableCell {Text = reader[attribute].ToString()};
                row.Cells.Add(cell);
            }
            return row;
        }

        private static TableHeaderRow CreateHeaderRow(string[] attributes)
        {
            TableHeaderRow row = new TableHeaderRow(){BackColor = GetColor("1C5E55"), ForeColor = Color.White};
            foreach (var attribute in attributes)
            {
                TableHeaderCell cell = new TableHeaderCell {Text = attribute};
                row.Cells.Add(cell);
            }
            return row;
        }

        private static Color GetColor(string hex)
        {
            return System.Drawing.ColorTranslator.FromHtml("#"+hex);
        }
    }
}