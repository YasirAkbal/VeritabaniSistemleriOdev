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
    public partial class KitapEkleForm : Form
    {

     NpgsqlConnection conn = new NpgsqlConnection("Server=localhost;" +
                     "Port=5432;" +
                     "User Id=postgres;" +
                     "Password=123;" +
                     "Database=Kutuphane;");
        public KitapEkleForm()
        {
            InitializeComponent();
        }

        private void KitapEkleForm_Load(object sender, EventArgs e)
        {
            using (NpgsqlCommand cmd = new NpgsqlCommand())
            {
                cmd.Connection = conn;
                cmd.CommandText = "SELECT \"kategoriAdi\" FROM \"kategoriler\"";

                conn.Open();
                NpgsqlDataReader reader = cmd.ExecuteReader();   

                while (reader.Read())
                {
                    t_kitapKat.Items.Add(reader["kategoriAdi"].ToString());
                } 

                conn.Close();
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            using (NpgsqlCommand cmd = new NpgsqlCommand())
            {

                cmd.Connection = conn;
                cmd.CommandText = "SELECT katalogvekitap(@ktpad,@basim,@cilt,@dili,@tip,@isbn,@sayfa,@yayin,@kat,@yzrad,@yzrsyad,@bagisad,@bagissoyad)";
                cmd.Parameters.AddWithValue("@ktpad", t_ktpad.Text);
                cmd.Parameters.AddWithValue("@basim", basimT.Value.ToShortDateString());
                cmd.Parameters.AddWithValue("@cilt", Convert.ToInt16(t_ciltNo.Text));
                cmd.Parameters.AddWithValue("@dili", t_dil.Text);
                cmd.Parameters.AddWithValue("@tip", t_kaynakTipi.Text);
                cmd.Parameters.AddWithValue("@isbn", t_isbn.Text);
                cmd.Parameters.AddWithValue("@sayfa", Convert.ToInt16(t_sayfa.Text));
                cmd.Parameters.AddWithValue("@yayin", t_yayinEvi.Text);
                cmd.Parameters.AddWithValue("@kat", t_kitapKat.SelectedIndex + 1);
                cmd.Parameters.AddWithValue("@yzrad", t_yazarAd.Text);
                cmd.Parameters.AddWithValue("@yzrsyad", t_yazarSoyad.Text);
                cmd.Parameters.AddWithValue("@bagisad", t_bagislayanAd.Text);
                cmd.Parameters.AddWithValue("@bagissoyad", t_bagislanSoyadi.Text);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }

    }
}
