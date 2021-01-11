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
    public partial class CalisanEkleForm : Form
    {

        NpgsqlConnection conn = new NpgsqlConnection("Server=localhost;" +
                     "Port=5432;" +
                     "User Id=postgres;" +
                     "Password=123;" +
                     "Database=Kutuphane;");
        public CalisanEkleForm()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            using (NpgsqlCommand cmd = new NpgsqlCommand())
            {
                cmd.Connection = conn;
                cmd.CommandText = "SELECT * FROM calisanekle(@ad,@soyad,@dogum,@dogumyeri,@tel,@adres,@cinsiyet,@eposta,@istanimi,@sicilno)";
                cmd.Parameters.AddWithValue("@ad", t_ad.Text);
                cmd.Parameters.AddWithValue("@soyad", t_soyad.Text);
                cmd.Parameters.AddWithValue("@dogum", dogumT.Value.ToShortDateString());
                cmd.Parameters.AddWithValue("@dogumyeri", t_yeri.Text);
                cmd.Parameters.AddWithValue("@tel", tel.Text);
                cmd.Parameters.AddWithValue("@adres", t_adres.Text);
                cmd.Parameters.AddWithValue("@cinsiyet", t_cinsiyet.Text);
                cmd.Parameters.AddWithValue("@eposta", t_eposta.Text);
                cmd.Parameters.AddWithValue("@istanimi", t_isTanimi.Text);
                cmd.Parameters.AddWithValue("@sicilno", t_sicilNo.Text);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }

    }
}
