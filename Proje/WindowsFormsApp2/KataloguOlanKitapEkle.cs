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
    public partial class KataloguOlanKitapEkle : Form
    {

        NpgsqlConnection conn = new NpgsqlConnection("Server=localhost;" +
        "Port=5432;" +
        "User Id=postgres;" +
        "Password=123;" +
        "Database=Kutuphane;");
        public KataloguOlanKitapEkle()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            using (NpgsqlCommand cmd = new NpgsqlCommand())
            {
                cmd.Connection = conn;
                cmd.CommandText = "SELECT * FROM kitapekle(@katalogno,@bAd,@bSoyad)";
                cmd.Parameters.AddWithValue("@katalogno",Convert.ToInt32(t_katalog.Text)); 
                cmd.Parameters.AddWithValue("@bAd", t_bagislayanAd.Text);
                cmd.Parameters.AddWithValue("@bSoyad", t_bagislayanSoyad.Text);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }

    }
}
