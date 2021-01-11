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
    public partial class UyeKayitForm : Form
    {
        NpgsqlConnection conn = new NpgsqlConnection("Server=localhost;" +
                             "Port=5432;" +
                             "User Id=postgres;" +
                             "Password=123;" +
                             "Database=Kutuphane;");
        public UyeKayitForm()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            using (NpgsqlCommand cmd = new NpgsqlCommand())
            {

                cmd.Connection = conn;
                cmd.CommandText = "SELECT uyeekle(@ad,@soyad,@dogum,@dogumyeri,@tel,@adres,@cinsiyet,@eposta)";
                cmd.Parameters.AddWithValue("@ad", t_ad.Text);
                cmd.Parameters.AddWithValue("@soyad", t_soyad.Text);
                cmd.Parameters.AddWithValue("@dogum", dogumT.Value.ToShortDateString());
                cmd.Parameters.AddWithValue("@dogumyeri", t_yeri.Text);
                cmd.Parameters.AddWithValue("@tel", tel.Text);
                cmd.Parameters.AddWithValue("@adres", t_adres.Text);
                cmd.Parameters.AddWithValue("@cinsiyet", t_cinsiyet.Text);
                cmd.Parameters.AddWithValue("@eposta", t_eposta.Text);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }

    }
}
