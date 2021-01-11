namespace WindowsFormsApp2
{
    partial class KitapListeForm
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
            this.liste = new System.Windows.Forms.ListView();
            this.KitapNo = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.KatalogNo = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.KitapAdi = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.Yazar = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.OduncDurumu = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.RezervDurumu = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.button4 = new System.Windows.Forms.Button();
            this.button5 = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // liste
            // 
            this.liste.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.KitapNo,
            this.KatalogNo,
            this.KitapAdi,
            this.Yazar,
            this.OduncDurumu,
            this.RezervDurumu});
            this.liste.Location = new System.Drawing.Point(26, 33);
            this.liste.Name = "liste";
            this.liste.Size = new System.Drawing.Size(628, 296);
            this.liste.TabIndex = 0;
            this.liste.UseCompatibleStateImageBehavior = false;
            this.liste.View = System.Windows.Forms.View.Details;
            this.liste.SelectedIndexChanged += new System.EventHandler(this.liste_SelectedIndexChanged);
            // 
            // KitapNo
            // 
            this.KitapNo.Text = "Kitap No";
            this.KitapNo.Width = 80;
            // 
            // KatalogNo
            // 
            this.KatalogNo.Text = "Katalog No";
            this.KatalogNo.Width = 80;
            // 
            // KitapAdi
            // 
            this.KitapAdi.Text = "Kitap Adi";
            this.KitapAdi.Width = 150;
            // 
            // Yazar
            // 
            this.Yazar.Text = "Yazar";
            this.Yazar.Width = 100;
            // 
            // OduncDurumu
            // 
            this.OduncDurumu.Text = "Ödünç Durumu";
            this.OduncDurumu.Width = 100;
            // 
            // RezervDurumu
            // 
            this.RezervDurumu.Text = "Rezervasyon";
            this.RezervDurumu.Width = 80;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(718, 169);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(118, 43);
            this.button1.TabIndex = 1;
            this.button1.Text = "Sil";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(718, 241);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(118, 40);
            this.button2.TabIndex = 2;
            this.button2.Text = "Kitap Ekle";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // button3
            // 
            this.button3.Cursor = System.Windows.Forms.Cursors.Cross;
            this.button3.Location = new System.Drawing.Point(718, 309);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(118, 46);
            this.button3.TabIndex = 26;
            this.button3.Text = "Kataloğu Kayıtlı Kitap Ekle";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // button4
            // 
            this.button4.Cursor = System.Windows.Forms.Cursors.Cross;
            this.button4.Location = new System.Drawing.Point(718, 33);
            this.button4.Name = "button4";
            this.button4.Size = new System.Drawing.Size(120, 42);
            this.button4.TabIndex = 27;
            this.button4.Text = "Ödünç Ver";
            this.button4.UseVisualStyleBackColor = true;
            this.button4.Click += new System.EventHandler(this.button4_Click);
            // 
            // button5
            // 
            this.button5.Location = new System.Drawing.Point(720, 105);
            this.button5.Name = "button5";
            this.button5.Size = new System.Drawing.Size(118, 40);
            this.button5.TabIndex = 28;
            this.button5.Text = "Rezervasyon Yap";
            this.button5.UseVisualStyleBackColor = true;
            this.button5.Click += new System.EventHandler(this.button5_Click);
            // 
            // KitapListeForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(877, 429);
            this.Controls.Add(this.button5);
            this.Controls.Add(this.button4);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.liste);
            this.Name = "KitapListeForm";
            this.Text = "KitapListeForm";
            this.Load += new System.EventHandler(this.KitapListeForm_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.ListView liste;
        private System.Windows.Forms.ColumnHeader KitapNo;
        private System.Windows.Forms.ColumnHeader KatalogNo;
        private System.Windows.Forms.ColumnHeader KitapAdi;
        private System.Windows.Forms.ColumnHeader Yazar;
        private System.Windows.Forms.ColumnHeader OduncDurumu;
        private System.Windows.Forms.ColumnHeader RezervDurumu;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Button button4;
        private System.Windows.Forms.Button button5;
    }
}