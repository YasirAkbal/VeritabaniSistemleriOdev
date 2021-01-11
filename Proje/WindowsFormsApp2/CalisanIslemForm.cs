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
    public partial class CalisanIslemForm : Form
    {

        NpgsqlConnection conn = new NpgsqlConnection("Server=localhost;" +
        "Port=5432;" +
        "User Id=postgres;" +
        "Password=123;" +
        "Database=Kutuphane;");
        public CalisanIslemForm()
        {
            InitializeComponent();
        }

        void goster()
        {
            using (NpgsqlCommand cmd = new NpgsqlCommand())
            {
                cmd.Connection = conn;
                cmd.CommandText = "SELECT * FROM \"calisanlar\" INNER JOIN \"kisiler\" ON \"calisanlar\".\"kisiNo\" = \"kisiler\".\"kisiNo\"";

                conn.Open();
                NpgsqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    ListViewItem item = new ListViewItem(reader["kisiNo"].ToString());
                    item.SubItems.Add(reader["adi"].ToString());
                    item.SubItems.Add(reader["soyadi"].ToString());
                    item.SubItems.Add(reader["dogumTarihi"].ToString());
                    item.SubItems.Add(reader["telefon"].ToString());
                    item.SubItems.Add(reader["eposta"].ToString());
                    item.SubItems.Add(reader["cinsiyet"].ToString());
                    item.SubItems.Add(reader["girisTarihi"].ToString());
                    item.SubItems.Add(reader["sicilNo"].ToString());
                    item.SubItems.Add(reader["isTanimi"].ToString());
                    liste.Items.Add(item);
                }

                conn.Close();
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            CalisanEkleForm form4 = new CalisanEkleForm();
            form4.ShowDialog();
            liste.Items.Clear();
            goster();
        }

        private void CalisanIslemForm_Load(object sender, EventArgs e)
        {
            button2.Enabled = false;
            goster();
        }

        private void liste_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (liste.SelectedItems.Count == 0)
            {
                button2.Enabled = false;
            }
            else
            {
                button2.Enabled = true;
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            long kisiNo = Convert.ToInt64(liste.SelectedItems[0].SubItems[0].Text);

            using (NpgsqlCommand cmd = new NpgsqlCommand())
            {
                cmd.Connection = conn;
                cmd.CommandText = "DELETE FROM \"calisanlar\" WHERE \"kisiNo\" = @kisino;" +
                    "DELETE FROM \"kisiler\" WHERE \"kisiNo\" = @kisino;";
                cmd.Parameters.AddWithValue("@kisino", kisiNo);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            liste.Items.Remove(liste.SelectedItems[0]);
        }
    }
}
