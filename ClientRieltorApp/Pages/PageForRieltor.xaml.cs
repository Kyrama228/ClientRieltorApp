using System;
using System.Collections.Generic;
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
    /// Логика взаимодействия для PageForRieltor.xaml
    /// </summary>
    public partial class PageForRieltor : Page
    {
        int i = 1;
        public PageForRieltor()
        {
            InitializeComponent();
            RieltorListView.ItemsSource = MainWindow.ent.Products.ToList();
        }

        private void GoBack_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new StartPage());
        }

        private void Addbtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AddEditRealtor(new Products()));
        }

        private void Editbtn_Click(object sender, RoutedEventArgs e)
        {
            Products rl = RieltorListView.SelectedItem as Products;
            if (rl != null)
            {
                NavigationService.Navigate(new AddEditRealtor(rl));
            }
            else
            {
                MessageBox.Show("Null");
            }
        }

        private void Deletebtn_Click(object sender, RoutedEventArgs e)
        {
            Products rl = RieltorListView.SelectedItem as Products;
            if (rl != null)
            {
                var result = MessageBox.Show("Вы действительно хотите удалить?", "Да or Нет", MessageBoxButton.YesNo);
                if (result == MessageBoxResult.Yes)
                {
                    MainWindow.ent.Products.Remove(rl);
                    MainWindow.ent.SaveChanges();
                    RieltorListView.ItemsSource = MainWindow.ent.Products.ToList();
                }
                else
                {
                    MessageBox.Show("Операция отменена пользователем");
                }

            }
            MessageBox.Show("Null");
        }

        private void RieltorImage_MouseDown(object sender, MouseButtonEventArgs e)
        {
            
        }

        private void RieltorImage_MouseUp(object sender, MouseButtonEventArgs e)
        {

        }
    }
}
