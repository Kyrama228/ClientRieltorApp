using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ClientRieltorApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для AddEditRealtor.xaml
    /// </summary>
    public partial class AddEditRealtor : Page
    {
        Products rllocl = new Products();
        public string sourceforimage;
        public AddEditRealtor(Products rl)
        {
            InitializeComponent();
            this.DataContext = rl;
            rllocl = rl;
        }

        private void AddImageBtn_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog fileDialog = new OpenFileDialog();

            fileDialog.ShowDialog();
            MessageBox.Show(fileDialog.FileName);
            try
            {
                if (ImageProfile.Source == null)
                {
                    MessageBox.Show("Please choose pic");
                    return;
                }
                else
                {
                    ImageProfile.Source = new BitmapImage(new Uri(fileDialog.FileName));
                    sourceforimage = fileDialog.FileName;
                    rllocl.Image = sourceforimage;
                }
            }
            catch (Exception ex)
            {
               MessageBox.Show( ex.Message.ToString());
            }
            
        }
        private void FirstNameTb_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            e.Handled = "0123456789".IndexOf(e.Text) < 0;
        }
        private void SaveBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {


                if (FirstNameTb.Text != null)
                {
                    var v = Convert.ToDecimal(FirstNameTb.Text);
                    rllocl.Cost = v;
                }
                else return;
                rllocl.Name = SecondNameTb.Text;
                if (rllocl.Id == 0)
                {
                    MainWindow.ent.Products.Add(rllocl);
                }
                try
                {
                    MainWindow.ent.SaveChanges();
                    MessageBox.Show("Succsess");
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }
                NavigationService.Navigate(new Pages.PageForRieltor());
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }

        private void BackBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }



        private void FirstNameTb_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (FirstNameTb.Text == null)
            {
                e.Handled = true;
                MessageBox.Show("Please,enter data");
            }
        }

        private void FirstNameTb_TextInput(object sender, TextCompositionEventArgs e)
        {
            if (FirstNameTb.Text == null)
            {
                e.Handled = true;
                MessageBox.Show("Please,enter data");
            }
        }
    }
}
