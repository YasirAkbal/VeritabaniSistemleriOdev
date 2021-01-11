using Npgsql;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApp2
{
    public partial class Form1 : Form
    {

        NpgsqlConnection conn = new NpgsqlConnection("Server=localhost;" +
                                     "Port=5432;" +
                                     "User Id=postgres;" +
                                     "Password=123;" +
                                     "Database=Kutuphane;");
        public Form1()
        {
            InitializeComponent();
        }



        private void button3_Click(object sender, EventArgs e)
        {
            CalisanIslemForm form = new CalisanIslemForm();
            form.ShowDialog();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            KitapListeForm form5 = new KitapListeForm();
            form5.ShowDialog();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            BagisciGosterForm form6 = new BagisciGosterForm();
            form6.ShowDialog();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            UyeleriGosterForm form = new UyeleriGosterForm();
            form.ShowDialog();
        }

    }
}
