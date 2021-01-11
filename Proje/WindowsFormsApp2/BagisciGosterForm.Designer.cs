namespace WindowsFormsApp2
{
    partial class BagisciGosterForm
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
            this.Adi = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.Soyadi = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader1 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.SuspendLayout();
            // 
            // liste
            // 
            this.liste.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.Adi,
            this.Soyadi,
            this.columnHeader1});
            this.liste.Location = new System.Drawing.Point(111, 63);
            this.liste.Name = "liste";
            this.liste.Size = new System.Drawing.Size(416, 237);
            this.liste.TabIndex = 3;
            this.liste.UseCompatibleStateImageBehavior = false;
            this.liste.View = System.Windows.Forms.View.Details;
            this.liste.SelectedIndexChanged += new System.EventHandler(this.liste_SelectedIndexChanged);
            // 
            // Adi
            // 
            this.Adi.Text = "Adi";
            this.Adi.Width = 130;
            // 
            // Soyadi
            // 
            this.Soyadi.Text = "Soyadi";
            this.Soyadi.Width = 130;
            // 
            // columnHeader1
            // 
            this.columnHeader1.Text = "Bağış Sayısı";
            this.columnHeader1.Width = 130;
            // 
            // BagisciGosterForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(658, 373);
            this.Controls.Add(this.liste);
            this.Name = "BagisciGosterForm";
            this.Text = "BagisciGosterForm";
            this.Load += new System.EventHandler(this.BagisciGosterForm_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.ListView liste;
        private System.Windows.Forms.ColumnHeader Adi;
        private System.Windows.Forms.ColumnHeader Soyadi;
        private System.Windows.Forms.ColumnHeader columnHeader1;
    }
}