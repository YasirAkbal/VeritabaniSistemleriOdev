namespace WindowsFormsApp2
{
    partial class KataloguOlanKitapEkle
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
            this.label12 = new System.Windows.Forms.Label();
            this.t_bagislayanAd = new System.Windows.Forms.TextBox();
            this.label = new System.Windows.Forms.Label();
            this.t_katalog = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.t_bagislayanSoyad = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(234, 262);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 0;
            this.button1.Text = "Ekle";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Location = new System.Drawing.Point(138, 120);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(74, 13);
            this.label12.TabIndex = 78;
            this.label12.Text = "Bağışlayan Ad";
            // 
            // t_bagislayanAd
            // 
            this.t_bagislayanAd.Location = new System.Drawing.Point(273, 117);
            this.t_bagislayanAd.MaxLength = 40;
            this.t_bagislayanAd.Name = "t_bagislayanAd";
            this.t_bagislayanAd.Size = new System.Drawing.Size(100, 20);
            this.t_bagislayanAd.TabIndex = 77;
            // 
            // label
            // 
            this.label.AutoSize = true;
            this.label.Location = new System.Drawing.Point(138, 71);
            this.label.Name = "label";
            this.label.Size = new System.Drawing.Size(60, 13);
            this.label.TabIndex = 76;
            this.label.Text = "Katalog No";
            // 
            // t_katalog
            // 
            this.t_katalog.Location = new System.Drawing.Point(273, 68);
            this.t_katalog.Name = "t_katalog";
            this.t_katalog.Size = new System.Drawing.Size(100, 20);
            this.t_katalog.TabIndex = 75;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(138, 170);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(91, 13);
            this.label7.TabIndex = 74;
            this.label7.Text = "Bağışlayan Soyad";
            // 
            // t_bagislayanSoyad
            // 
            this.t_bagislayanSoyad.Location = new System.Drawing.Point(273, 167);
            this.t_bagislayanSoyad.MaxLength = 40;
            this.t_bagislayanSoyad.Name = "t_bagislayanSoyad";
            this.t_bagislayanSoyad.Size = new System.Drawing.Size(100, 20);
            this.t_bagislayanSoyad.TabIndex = 73;
            // 
            // KataloguOlanKitapEkle
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(530, 377);
            this.Controls.Add(this.label12);
            this.Controls.Add(this.t_bagislayanAd);
            this.Controls.Add(this.label);
            this.Controls.Add(this.t_katalog);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.t_bagislayanSoyad);
            this.Controls.Add(this.button1);
            this.Name = "KataloguOlanKitapEkle";
            this.Text = "KataloguOlanKitapEkle";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.TextBox t_bagislayanAd;
        private System.Windows.Forms.Label label;
        private System.Windows.Forms.TextBox t_katalog;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.TextBox t_bagislayanSoyad;
    }
}