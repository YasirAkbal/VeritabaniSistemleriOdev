using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Npgsql;

namespace WindowsFormsApp2
{
    public partial class BagisciGosterForm : Form
    {

        NpgsqlConnection conn = new NpgsqlConnection("Server=localhost;" +
              "Port=5432;" +
              "User Id=postgres;" +
              "Password=123;" +
              "Database=Kutuphane;");

        public BagisciGosterForm()
        {
            InitializeComponent();
        }

        private void liste_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void BagisciGosterForm_Load(object sender, EventArgs e)
        {
            using (NpgsqlCommand cmd = new NpgsqlCommand())
            {
                cmd.Connection = conn;
                cmd.CommandText = "SELECT \"adi\", \"soyadi\", \"bagisSayisi\" FROM \"bagisyapanlar\" " +
                    "INNER JOIN \"kisiler\" ON \"kisiler\".\"kisiNo\" = \"bagisyapanlar\".\"kisiNo\"" +
                    " WHERE \"bagisSayisi\" > 0 ORDER BY \"bagisSayisi\"";

                conn.Open();
                NpgsqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    ListViewItem item = new ListViewItem(reader["adi"].ToString());
                    item.SubItems.Add(reader["soyadi"].ToString());
                    item.SubItems.Add(reader["bagisSayisi"].ToString());
                    liste.Items.Add(item);
                }

                conn.Close();
            }
        }
    }
}
