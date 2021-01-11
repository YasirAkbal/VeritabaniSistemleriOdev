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
    public partial class KitapListeForm : Form
    {

        NpgsqlConnection conn = new NpgsqlConnection("Server=localhost;" +
                "Port=5432;" +
                "User Id=postgres;" +
                "Password=123;" +
                "Database=Kutuphane;");
        public KitapListeForm()
        {
            InitializeComponent();
        }

        private void KitapListeForm_Load(object sender, EventArgs e)
        {
            button4.Enabled = false;
            button1.Enabled = false;
            button5.Enabled = false;
            listele();
        }

        void listele()
        {
            liste.Items.Clear();
            string odunc;
            using (NpgsqlCommand cmd = new NpgsqlCommand())
            {
                cmd.Connection = conn;
                cmd.CommandText = "SELECT * FROM \"kitaplar\" INNER JOIN \"katalogkitap\" " +
                    "ON \"kitaplar\".\"katalogNo\" = \"katalogkitap\".\"katalogNo\" " +
                    "LEFT OUTER JOIN \"yazarlar\" ON \"katalogkitap\".\"yazar\" = \"yazarlar\".\"yazarNo\" ORDER BY \"kitaplar\".\"katalogNo\", \"kitapNo\"";

                conn.Open();
                NpgsqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    odunc = "Rafta";
                    ListViewItem item = new ListViewItem(reader["kitapNo"].ToString());
                    item.SubItems.Add(reader["katalogNo"].ToString());
                    item.SubItems.Add(reader["kitapAdi"].ToString());
                    item.SubItems.Add(reader["yazarAdi"].ToString() + " " + reader["yazarSoyadi"].ToString());
                    if (reader["oduncAlan"].ToString() != "0")
                        odunc = "Müsait değil";
                    item.SubItems.Add(odunc);
                    item.SubItems.Add(reader["rezerv"].ToString());
                    liste.Items.Add(item);
                }

                conn.Close();
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            long kitapNo = Convert.ToInt64(liste.SelectedItems[0].SubItems[0].Text);
      
            using (NpgsqlCommand cmd = new NpgsqlCommand())
            {
                cmd.Connection = conn;
                cmd.CommandText = "DELETE FROM \"kitaplar\" WHERE \"kitapNo\" = @kitapno";
                cmd.Parameters.AddWithValue("@kitapno", kitapNo);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            listele();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            KitapEkleForm form3 = new KitapEkleForm();
            form3.ShowDialog();
            listele();
        }

        private void liste_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(liste.SelectedItems.Count == 0)
            {
                button4.Enabled = false;
                button1.Enabled = false;
                button5.Enabled = false;
            }
            else
            {
                button4.Enabled = true;
                button1.Enabled = true;
                button5.Enabled = true;
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            KataloguOlanKitapEkle form = new KataloguOlanKitapEkle();
            form.ShowDialog();
            listele();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            long kitapNo = Convert.ToInt64(liste.SelectedItems[0].SubItems[0].Text);
            long kisiNo = Convert.ToInt64(Microsoft.VisualBasic.Interaction.InputBox("Kişi No", "Ödünç verilecek kişinin no'sunu giriniz", "", 0, 0));

            using (NpgsqlCommand cmd = new NpgsqlCommand())
            {
                cmd.Connection = conn;
                cmd.CommandText = "SELECT * FROM kitapodunc(@kitapno,@kisino)";
                cmd.Parameters.AddWithValue("@kitapno", kitapNo);
                cmd.Parameters.AddWithValue("@kisino", kisiNo);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            listele();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            long kitapNo = Convert.ToInt64(liste.SelectedItems[0].SubItems[0].Text);
            long kisiNo = Convert.ToInt64(Microsoft.VisualBasic.Interaction.InputBox("Kişi No", "Ödünç verilecek kişinin no'sunu giriniz", "", 0, 0));

            using (NpgsqlCommand cmd = new NpgsqlCommand())
            {
                cmd.Connection = conn;
                cmd.CommandText = "SELECT * FROM rezervyap(@kitapno,@kisino)";
                cmd.Parameters.AddWithValue("@kitapno", kitapNo);
                cmd.Parameters.AddWithValue("@kisino", kisiNo);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            listele();
        }
    }
}
