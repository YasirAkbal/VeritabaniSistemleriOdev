namespace WindowsFormsApp2
{
    partial class KitapEkleForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label7 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.BasımTarihi = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.t_bagislayanAd = new System.Windows.Forms.TextBox();
            this.t_dil = new System.Windows.Forms.TextBox();
            this.basimT = new System.Windows.Forms.DateTimePicker();
            this.t_ciltNo = new System.Windows.Forms.TextBox();
            this.t_ktpad = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.t_kaynakTipi = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.t_isbn = new System.Windows.Forms.TextBox();
            this.label9 = new System.Windows.Forms.Label();
            this.t_sayfa = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.t_yayinEvi = new System.Windows.Forms.TextBox();
            this.label10 = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.t_yazarAd = new System.Windows.Forms.TextBox();
            this.label12 = new System.Windows.Forms.Label();
            this.t_yazarSoyad = new System.Windows.Forms.TextBox();
            this.t_kitapKat = new System.Windows.Forms.ComboBox();
            this.label8 = new System.Windows.Forms.Label();
            this.t_bagislanSoyadi = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(167, 602);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(76, 13);
            this.label7.TabIndex = 53;
            this.label7.Text = "Bağışlayan Adı";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(167, 200);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(19, 13);
            this.label5.TabIndex = 51;
            this.label5.Text = "Dil";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(167, 141);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(38, 13);
            this.label6.TabIndex = 50;
            this.label6.Text = "Cilt No";
            // 
            // BasımTarihi
            // 
            this.BasımTarihi.AutoSize = true;
            this.BasımTarihi.Location = new System.Drawing.Point(167, 91);
            this.BasımTarihi.Name = "BasımTarihi";
            this.BasımTarihi.Size = new System.Drawing.Size(64, 13);
            this.BasımTarihi.TabIndex = 49;
            this.BasımTarihi.Text = "Basım Tarihi";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(167, 43);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(49, 13);
            this.label1.TabIndex = 47;
            this.label1.Text = "Kitap Adı";
            // 
            // t_bagislayanAd
            // 
            this.t_bagislayanAd.Location = new System.Drawing.Point(302, 599);
            this.t_bagislayanAd.Name = "t_bagislayanAd";
            this.t_bagislayanAd.Size = new System.Drawing.Size(100, 20);
            this.t_bagislayanAd.TabIndex = 45;
            // 
            // t_dil
            // 
            this.t_dil.Location = new System.Drawing.Point(302, 193);
            this.t_dil.Name = "t_dil";
            this.t_dil.Size = new System.Drawing.Size(100, 20);
            this.t_dil.TabIndex = 43;
            // 
            // basimT
            // 
            this.basimT.Location = new System.Drawing.Point(302, 84);
            this.basimT.Name = "basimT";
            this.basimT.Size = new System.Drawing.Size(200, 20);
            this.basimT.TabIndex = 42;
            // 
            // t_ciltNo
            // 
            this.t_ciltNo.Location = new System.Drawing.Point(302, 134);
            this.t_ciltNo.Name = "t_ciltNo";
            this.t_ciltNo.Size = new System.Drawing.Size(100, 20);
            this.t_ciltNo.TabIndex = 41;
            // 
            // t_ktpad
            // 
            this.t_ktpad.Location = new System.Drawing.Point(302, 36);
            this.t_ktpad.Name = "t_ktpad";
            this.t_ktpad.Size = new System.Drawing.Size(100, 20);
            this.t_ktpad.TabIndex = 39;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(235, 728);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(129, 42);
            this.button1.TabIndex = 38;
            this.button1.Text = "Ekle";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(167, 248);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(63, 13);
            this.label2.TabIndex = 56;
            this.label2.Text = "Kaynak Tipi";
            // 
            // t_kaynakTipi
            // 
            this.t_kaynakTipi.Location = new System.Drawing.Point(302, 245);
            this.t_kaynakTipi.MaxLength = 15;
            this.t_kaynakTipi.Name = "t_kaynakTipi";
            this.t_kaynakTipi.Size = new System.Drawing.Size(100, 20);
            this.t_kaynakTipi.TabIndex = 55;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(167, 303);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(32, 13);
            this.label3.TabIndex = 58;
            this.label3.Text = "ISBN";
            // 
            // t_isbn
            // 
            this.t_isbn.Location = new System.Drawing.Point(302, 300);
            this.t_isbn.MaxLength = 13;
            this.t_isbn.Name = "t_isbn";
            this.t_isbn.Size = new System.Drawing.Size(100, 20);
            this.t_isbn.TabIndex = 57;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(167, 351);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(64, 13);
            this.label9.TabIndex = 60;
            this.label9.Text = "Sayfa Sayısı";
            // 
            // t_sayfa
            // 
            this.t_sayfa.Location = new System.Drawing.Point(302, 348);
            this.t_sayfa.Name = "t_sayfa";
            this.t_sayfa.Size = new System.Drawing.Size(100, 20);
            this.t_sayfa.TabIndex = 59;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(167, 402);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(51, 13);
            this.label4.TabIndex = 62;
            this.label4.Text = "Yayın Evi";
            // 
            // t_yayinEvi
            // 
            this.t_yayinEvi.Location = new System.Drawing.Point(302, 399);
            this.t_yayinEvi.Name = "t_yayinEvi";
            this.t_yayinEvi.Size = new System.Drawing.Size(100, 20);
            this.t_yayinEvi.TabIndex = 61;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(167, 453);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(73, 13);
            this.label10.TabIndex = 64;
            this.label10.Text = "Kitap Kategori";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(167, 503);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(52, 13);
            this.label11.TabIndex = 66;
            this.label11.Text = "Yazar Adı";
            // 
            // t_yazarAd
            // 
            this.t_yazarAd.Location = new System.Drawing.Point(302, 500);
            this.t_yazarAd.Name = "t_yazarAd";
            this.t_yazarAd.Size = new System.Drawing.Size(100, 20);
            this.t_yazarAd.TabIndex = 65;
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Location = new System.Drawing.Point(167, 552);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(69, 13);
            this.label12.TabIndex = 68;
            this.label12.Text = "Yazar Soyadı";
            // 
            // t_yazarSoyad
            // 
            this.t_yazarSoyad.Location = new System.Drawing.Point(302, 549);
            this.t_yazarSoyad.Name = "t_yazarSoyad";
            this.t_yazarSoyad.Size = new System.Drawing.Size(100, 20);
            this.t_yazarSoyad.TabIndex = 67;
            // 
            // t_kitapKat
            // 
            this.t_kitapKat.FormattingEnabled = true;
            this.t_kitapKat.Location = new System.Drawing.Point(302, 453);
            this.t_kitapKat.MaxDropDownItems = 100;
            this.t_kitapKat.MaxLength = 20;
            this.t_kitapKat.Name = "t_kitapKat";
            this.t_kitapKat.Size = new System.Drawing.Size(121, 21);
            this.t_kitapKat.TabIndex = 69;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(167, 655);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(93, 13);
            this.label8.TabIndex = 71;
            this.label8.Text = "Bağışlayan Soyadı";
            // 
            // t_bagislanSoyadi
            // 
            this.t_bagislanSoyadi.Location = new System.Drawing.Point(302, 652);
            this.t_bagislanSoyadi.Name = "t_bagislanSoyadi";
            this.t_bagislanSoyadi.Size = new System.Drawing.Size(100, 20);
            this.t_bagislanSoyadi.TabIndex = 70;
            // 
            // KitapEkleForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(649, 820);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.t_bagislanSoyadi);
            this.Controls.Add(this.t_kitapKat);
            this.Controls.Add(this.label12);
            this.Controls.Add(this.t_yazarSoyad);
            this.Controls.Add(this.label11);
            this.Controls.Add(this.t_yazarAd);
            this.Controls.Add(this.label10);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.t_yayinEvi);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.t_sayfa);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.t_isbn);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.t_kaynakTipi);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.BasımTarihi);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.t_bagislayanAd);
            this.Controls.Add(this.t_dil);
            this.Controls.Add(this.basimT);
            this.Controls.Add(this.t_ciltNo);
            this.Controls.Add(this.t_ktpad);
            this.Controls.Add(this.button1);
            this.Name = "KitapEkleForm";
            this.Text = "KitapEkleForm";
            this.Load += new System.EventHandler(this.KitapEkleForm_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label BasımTarihi;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox t_bagislayanAd;
        private System.Windows.Forms.TextBox t_dil;
        private System.Windows.Forms.DateTimePicker basimT;
        private System.Windows.Forms.TextBox t_ciltNo;
        private System.Windows.Forms.TextBox t_ktpad;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox t_kaynakTipi;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox t_isbn;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.TextBox t_sayfa;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox t_yayinEvi;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.TextBox t_yazarAd;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.TextBox t_yazarSoyad;
        private System.Windows.Forms.ComboBox t_kitapKat;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.TextBox t_bagislanSoyadi;
    }
}