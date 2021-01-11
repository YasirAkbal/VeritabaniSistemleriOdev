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
    public partial class UyeleriGosterForm : Form
    {

        NpgsqlConnection conn = new NpgsqlConnection("Server=localhost;" +
        "Port=5432;" +
        "User Id=postgres;" +
        "Password=123;" +
        "Database=Kutuphane;");

        public UyeleriGosterForm()
        {
            InitializeComponent();
        }
    
        void goster()
        {
            liste.Items.Clear();

            using (NpgsqlCommand cmd = new NpgsqlCommand())
            {
                cmd.Connection = conn;
                cmd.CommandText = "SELECT * FROM \"uyeler\" INNER JOIN \"kisiler\" ON \"uyeler\".\"kisiNo\" = \"kisiler\".\"kisiNo\"";

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
                    liste.Items.Add(item);
                }

                conn.Close();
            }
        }
        private void UyeleriGosterForm_Load(object sender, EventArgs e)
        {
            button1.Enabled = false;
            goster();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            long kisiNo = Convert.ToInt64(liste.SelectedItems[0].SubItems[0].Text);

            using (NpgsqlCommand cmd = new NpgsqlCommand())
            {
                cmd.Connection = conn;
                cmd.CommandText = "DELETE FROM \"uyeler\" WHERE \"kisiNo\" = @kisino;" +
                    "DELETE FROM \"kisiler\" WHERE \"kisiNo\" = @kisino;";
                cmd.Parameters.AddWithValue("@kisino", kisiNo);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }   
            goster();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            UyeKayitForm form = new UyeKayitForm();
            form.ShowDialog();
            goster();
        }

        private void liste_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (liste.SelectedItems.Count == 0)
            {
                button1.Enabled = false;
            }
            else
            {
                button1.Enabled = true;
            }
        }
    }
}
