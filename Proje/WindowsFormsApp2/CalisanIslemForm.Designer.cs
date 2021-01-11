namespace WindowsFormsApp2
{
    partial class CalisanIslemForm
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
            this.button1 = new System.Windows.Forms.Button();
            this.liste = new System.Windows.Forms.ListView();
            this.KisiNo = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.Adi = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.Soyadi = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.DogumTarihi = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.Telefon = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.Eposta = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.Cinsiyet = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.GirisTarihi = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.Sicil = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.IsTanimi = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.button2 = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(307, 396);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(153, 46);
            this.button1.TabIndex = 0;
            this.button1.Text = "Calışan Ekle";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // liste
            // 
            this.liste.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.KisiNo,
            this.Adi,
            this.Soyadi,
            this.DogumTarihi,
            this.Telefon,
            this.Eposta,
            this.Cinsiyet,
            this.GirisTarihi,
            this.Sicil,
            this.IsTanimi});
            this.liste.Location = new System.Drawing.Point(27, 49);
            this.liste.Name = "liste";
            this.liste.Size = new System.Drawing.Size(1007, 294);
            this.liste.TabIndex = 28;
            this.liste.UseCompatibleStateImageBehavior = false;
            this.liste.View = System.Windows.Forms.View.Details;
            this.liste.SelectedIndexChanged += new System.EventHandler(this.liste_SelectedIndexChanged);
            // 
            // KisiNo
            // 
            this.KisiNo.Text = "Kişi No";
            this.KisiNo.Width = 80;
            // 
            // Adi
            // 
            this.Adi.Text = "Adı";
            this.Adi.Width = 80;
            // 
            // Soyadi
            // 
            this.Soyadi.Text = "Soyadı";
            this.Soyadi.Width = 80;
            // 
            // DogumTarihi
            // 
            this.DogumTarihi.Text = "Doğum Tarihi";
            this.DogumTarihi.Width = 105;
            // 
            // Telefon
            // 
            this.Telefon.Text = "Telefon";
            this.Telefon.Width = 100;
            // 
            // Eposta
            // 
            this.Eposta.Text = "Eposta";
            this.Eposta.Width = 100;
            // 
            // Cinsiyet
            // 
            this.Cinsiyet.Text = "Cinsiyet";
            this.Cinsiyet.Width = 50;
            // 
            // GirisTarihi
            // 
            this.GirisTarihi.Text = "Giriş Tarihi";
            this.GirisTarihi.Width = 100;
            // 
            // Sicil
            // 
            this.Sicil.Text = "Sicil No";
            this.Sicil.Width = 100;
            // 
            // IsTanimi
            // 
            this.IsTanimi.Text = "İş Tanımı";
            this.IsTanimi.Width = 200;
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(574, 397);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(160, 45);
            this.button2.TabIndex = 29;
            this.button2.Text = "Sil";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // CalisanIslemForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1073, 498);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.liste);
            this.Controls.Add(this.button1);
            this.Name = "CalisanIslemForm";
            this.Text = "CalisanIslemForm";
            this.Load += new System.EventHandler(this.CalisanIslemForm_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.ListView liste;
        private System.Windows.Forms.ColumnHeader KisiNo;
        private System.Windows.Forms.ColumnHeader Adi;
        private System.Windows.Forms.ColumnHeader Soyadi;
        private System.Windows.Forms.ColumnHeader DogumTarihi;
        private System.Windows.Forms.ColumnHeader Telefon;
        private System.Windows.Forms.ColumnHeader Eposta;
        private System.Windows.Forms.ColumnHeader Cinsiyet;
        private System.Windows.Forms.ColumnHeader GirisTarihi;
        private System.Windows.Forms.ColumnHeader Sicil;
        private System.Windows.Forms.ColumnHeader IsTanimi;
        private System.Windows.Forms.Button button2;
    }
}